#!/bin/bash
set -e

PROJECT_DIR="$(realpath "$(dirname "$0")/..")"
VENV_DIR="${PROJECT_DIR}/yocto-venv"

print_usage() {
    echo "Usage: $0 checkout|shell|build <path/to/yml>"
}

do_prepare_env() {
    if [ -d "$VENV_DIR" ]; then
        if [ ! -f "$VENV_DIR/pyvenv.cfg" ]; then
            echo "[x] Python venv directory exists but no pyvenv.cfg"
            echo "[x] Make sure to remove the directory and repeat again"
            exit 1
        fi
        echo "Virtual environment already exists. Skipping creation."
    else
        python3 -m venv "$VENV_DIR" || {
            echo "[x] Failed to setup python3 venv"
            exit 1
        }
    fi

    echo "[+] Sourcing the Python venv"
    source "$VENV_DIR/bin/activate" || {
        echo "[x] Failed to source the virtual environment."
        exit 1
    }

    if ! pip3 list | grep -q kas; then
        echo "[+] Installing kas"
        if ! pip3 install kas; then
            echo "[x] Error installing kas .."
            exit 1
        fi
    else
        echo "kas is already installed"
    fi
}

do_kas_action() {
    local action="$1"
    local yml="$2"

    if ! kas-container --runtime-args "--volume /mnt/storage:/mnt/storage" "$action" "$yml"; then
        echo "[x] Failed to ${action} the kas file."
        exit 1
    fi
}

main() {
    if [ "$#" -ne 2 ]; then
        print_usage
        exit 1
    fi

    local action="$1"
    local yml="$2"

    if [ ! -f "$yml" ]; then
        echo "[x] YML file not found: $yml"
        exit 1
    fi

    case "$action" in
        checkout|shell|build)
            ;;
        *)
            echo "[x] Invalid action: $action. Use checkout, shell, or build."
            exit 1
            ;;
    esac

    do_prepare_env
    do_kas_action "$action" "$yml"
}

main "$@"
