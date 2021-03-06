#!/bin/bash
set -eu -o pipefail

host=root@192.168.0.2

_print_password ()
{
    gopass disks/oxygen/root
}

_ensure_gopass_latest ()
{
    gopass sync --store root
}

unlock_remote_luks ()
{
    _print_password | ssh $host cryptroot-unlock
}

_ensure_gopass_latest
unlock_remote_luks
