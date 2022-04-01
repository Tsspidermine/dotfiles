function openproj
    set confpath "$HOME/.config/openproj/openprojrc"
    set confdir "$HOME/.config/openproj"

    if test -e "$confpath"
        while read -la --delimiter="=" line
            set $line
        end < $confpath
    else
        mkdir -p "$confdir"
        touch "$confpath"
    end

    argparse -s h/help d/directory changedir= editor= -- $argv
    or return

    # If -h or --help is given, we print a little help text and return
    if set -q _flag_help
        echo "openproj [-h|--help] [-d|--directory] [ARGUMENTS...]"
        return 0
    end

    # If -d or --directory is given, send the user to the project directory
    if set -q _flag_directory
        cd $directory
    end

    # if --changedir is given, change the project directory.
    if set -q _flag_changedir
        if test -d (realpath $_flag_changedir)
            set -l newdir (realpath $_flag_changedir)
            sed -i "s|$directory|$newdir|" "$confpath"
            echo "Changing project location to $newdir!"
            set -e newdir
        else
            echo "Error: File: _flag_changedir is not a directory"
            return 1
        end
    end

    # if --editor is given, set the editor
    if set -q _flag_editor
        if test -e /sbin/$_flag_editor
            sed -i "s|$editor|$_flag_editor|" "$confpath"
            echo "Changing editor to $_flag_editor!"
        else
            echo "Error: We can't find $_flag_editor! Make sure it exists in the /bin directory."
            return 1
        end
    end
end
