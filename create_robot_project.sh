#!/bin/bash
# A bash script to create folders for a whole robotics project. 2/20/2019

echo "You should put this script as ~/catkin_ws/src/create_robot_project.sh"
echo -n "Is the script there? [y/n]:"
read choice
if [ $choice != "y" ]
then
	echo "Terminated."
	exit
fi

echo "Your Robot Name is suggested for the prefix of the project. For a Object Oriented Design Style"
echo -n "Enter The Robot Name: "
read robot_name

echo  "Your are going to create a project folder structure with prefix->" $robot_name
echo -n "are you sure? [y/n]:"
read choice

if [ $choice = "y" ]
then
	mkdir -p $robot_name/{$robot_name"_base",$robot_name"_bringup",$robot_name"_description",$robot_name"_hri",$robot_name"_legacy"}
	mkdir -p $robot_name/{$robot_name"_localization",$robot_name"_manager",$robot_name"_message",$robot_name"_navigation",$robot_name"_perception"}
	mkdir -p $robot_name/{$robot_name"_simulator",$robot_name"_visualization",$robot_name"_debug","external_libraries","install","ots_packages"}
else
	echo "Terminated."
	exit
fi

echo -n "Create a README for each folder? [y/n]:"
read choice

# base_readme="# README\n Create a ROS package with a hardware version name here. E.g. 'beta_robot_driver'.\n"
# base_readme+="some other things\n"

if [ $choice = "y" ]
then
	touch $robot_name/{$robot_name"_base",$robot_name"_bringup",$robot_name"_description",$robot_name"_hri",$robot_name"_legacy"}/README.md
	touch $robot_name/{$robot_name"_localization",$robot_name"_manager",$robot_name"_message",$robot_name"_navigation",$robot_name"_perception"}/README.md
	touch $robot_name/{$robot_name"_simulator",$robot_name"_visualization",$robot_name"_debug","external_libraries","install","ots_packages"}/README.md
else
	echo "Skipped Readme Creation."
fi

echo -n "Download the README for folder structure explanation in the root folder? [y/n]:"
read choice

if [ $choice = "y" ]
then
	curl -o $robot_name/README.md 'https://raw.githubusercontent.com/CodyHex/setup_scripts/master/project_structure.md'
	echo "Downloaded."
else
	echo "Skipped downloading the root readme."
fi

echo -e "Create Project Folder Structure Finished.\nIt will show you the tree list if you have 'tree' installed."

tree -L 3

