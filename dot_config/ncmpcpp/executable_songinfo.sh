#!/bin/sh

generate_preview() {
	local input_file="$1"
	local output_file="$2"

	[ -e "$output_file" ] || ffmpeg -y -i "$input_file" -an -vf scale=128:128 "$output_file" >/dev/null 2>&1
}

music_dir="$HOME/Music"
previewdir="$HOME/.config/ncmpcpp/previews"
current_song_info="$(mpc --format '%title% \n%artist% - %album%' current)"
filename="$music_dir/$(mpc --format %file% current)"
album="$(mpc --format %album% current)"
title="$(mpc --format %title% current)"
previewname="$previewdir/$(echo "${album:-$title}" | base64).png"

generate_preview "$filename" "$previewname" &&
	notify-send -a 'ncmpcpp' -r 27072 "Now Playing" "$current_song_info" -i "$previewname" ||
	previewname="$HOME/.config/ncmpcpp/default.png" &&
	notify-send -a 'ncmpcpp' -r 27072 "Now Playing" "$current_song_info" -i "$previewname"
