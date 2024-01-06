function py() {
    if [ "$#" -eq 0 ]; then
        pyenv shell --unset
    else
        pyenv shell $1
    fi
}

function gr() {
    if [ "$#" -eq 0 ]; then
        go run .
    else
        go run "$@"
    fi
}

function rg() {
    # If outputting (fd 1 = stdout) directly to a terminal, page automatically:
    if [ -t 1 ]; then
        command rg -p --no-heading "$@" | bat
    else
        command rg "$@"
    fi
}
