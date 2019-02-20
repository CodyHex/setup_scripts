#!/bin/bash
# A bash script to create folders for a whole robotics project.

echo "You should put this script as ~/catkin_ws/src/create_robot_project.sh"
echo -n "Is the script there? [y/n]:"
read choice
if (($choice != y)); then
	echo "Quit the script."
	exit
fi

echo "Your Robot Name use be used as the prefix for folders."
echo -n "Enter The Robot Name: "
read robot_name

echo  "Your are going to create a whole project folder structure with->" $robot_name 
echo -n "are you sure? [y/n]:"
read choice

if (($choice == y))
then
	mkdir -p $robot_name/{$robot_name"_base",$robot_name"_hri",$robot_name"_viz"}
else
	exit
fi

echo -n "Do you want README for folder design ideas? [y/n]:"
read choice

# base_readme="# README\n Create a ROS package with a hardware version name here. E.g. 'beta_robot_driver'.\n"
# base_readme+="some other things\n"

if (($choice == y)); then
	touch $robot_name/{$robot_name"_base",$robot_name"_hri",$robot_name"_viz"}/README.md
	echo $base_readme
	echo -e $base_readme >> $robot_name/$robot_name"_base"/README.md
fi

tree -L 3

