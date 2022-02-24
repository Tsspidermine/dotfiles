#!/usr/bin/env bash

SCRIPT_DIR=$(dirname "${BASH_SOURCE[0]}")
POWEROFF="  poweroff"
REBOOT="  reboot"
LOGOUT="  logout"

# rofi -theme $SCRIPT_DIR/powermenu.rasi -show pm -modi "pm:/home/tsspidermine/.config/rofi/scripts/powermenu.sh" 

confirm_exit() {
	rofi -dmenu\
		-i\
		-no-fixed-num-lines\
		-p "Are you sure? [y/N]"\
		-theme $SCRIPT_DIR/powermenu.rasi\
		-theme-str '#inputbar { enabled: true; }'
}

msg() {
	rofi -theme "$SCRIPT_DIR/powermenu" -e "Available Options - yes/y/no/n"
}

options="$POWEROFF\n$REBOOT\n$LOGOUT"
chosen="$(echo -e "$options" | rofi -theme $SCRIPT_DIR/powermenu.rasi -dmenu)" 

case $chosen in
	$POWEROFF)
		ans=$(confirm_exit &)	
		if [[ $ans == "yes" || $ans == "y" ]]; then
			systemctl poweroff
		elif [[ $ans == "no" || $ans == "n" || $ans == "" ]]; then
			exit 0
		else
			msg
		fi
		;;
	$REBOOT)
		ans=$(confirm_exit &)	
		if [[ $ans == "yes" || $ans == "y" ]]; then
			systemctl reboot
		elif [[ $ans == "no" || $ans == "n" || $ans == "" ]]; then
			exit 0
		else
			msg
		fi
		;;
	$LOGOUT)
		ans=$(confirm_exit &)	
		if [[ $ans == "yes" || $ans == "y" ]]; then
			bspc quit
		elif [[ $ans == "no" || $ans == "n" || $ans == "" ]]; then
			exit 0
		else
			msg
		fi
		;;
esac

