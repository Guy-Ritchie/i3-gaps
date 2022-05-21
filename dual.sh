#!/bin/bash

# Works well enough!

echo "There are 4 different kinds of configurations for the dual monitor setup."
echo "They are :"
echo "1. Internal Display only."
echo "2. External Display only."
echo "3. Clone/Mirror the primary display to the secondary display."
echo "4. Extend the primary display to the secondary display."

read -p "Which configuration do you want to use ? Enter any number from (1-4)" config

! test -f /tmp/dual/count.txt && { mkdir /tmp/dual/; touch /tmp/dual/count.txt;}

#if test -f "/var/tmp/count.txt"; then
#	echo "File exists. Continuing..."
#else
#	sudo mkdir /var/tmp
#	sudo touch /var/tmp/count.txt
#	echo "File created."
#fi

case $config in
	1)
		echo "Internal Display only will be visible now."
		xrandr --output LVDS-1 --auto --output VGA-1 --off
		feh --bg-scale /home/rinzler/pictures/waterstream.jpg
		echo "one" > /tmp/dual/count.txt
		sleep 2
		;;
	2)
		echo "External Display only will be visible now."
		xrandr --output LVDS-1 --off --output VGA-1 --auto
		feh --bg-scale /home/rinzler/pictures/waterstream.jpg
		echo "two" > /tmp/dual/count.txt
		sleep 2
		;;
	3)
		echo "Cloning / Mirroring the primary display to secondary display"
		count=$(cat /tmp/dual/count.txt)
		case $count in
			"one")
				#xrandr --output LVDS-1 --auto --output VGA-1 --same-as LVDS-1 --auto
				#xrandr --output LVDS-1 --auto --output VGA-1 --same-as LVDS-1 --mode 1440x900 --scale 1.054x1.171
				xrandr --output LVDS-1 --auto --output VGA-1 --same-as LVDS-1 --mode 1440x900 --scale 0.948x0.853
				;;
			"two")
				#xrandr --output VGA-1 --auto --output LVDS-1 --same-as VGA-1 --auto
				#xrandr --output VGA-1 --auto --output LVDS-1 --same-as VGA-1 --mode 1440x900 --scale 0.948x0.853
				xrandr --output LVDS-1 --auto --output VGA-1 --same-as LVDS-1 --mode 1440x900 --scale 0.948x0.853
				;;
		esac
		#xrandr --output VGA-1 --auto --output LVDS-1 --auto
		#xrandr --output VGA-1  --output LVDS-1 --same-as VGA-1
		feh --bg-scale /home/rinzler/pictures/waterstream.jpg
		sleep 2
		;;
	4)
		echo "Extending the primary display to the secondary display."
		echo "The secondary display will be extended to the left of the primary display."
		#xrandr --output LVDS-1 --auto --output VGA-1 --auto --left-of LVDS-1
		xrandr --output LVDS-1 --mode 1366x768 --scale 1x1 --output VGA-1 --mode 1440x900 --scale 1x1 --left-of LVDS-1
		feh --bg-scale /home/rinzler/pictures/waterstream.jpg
		;;
esac

#rm -rf /home/rinzler/dual/
#rmdir /home/rinzler/dual
