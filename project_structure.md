# Project Folder Structure Logic 

**Preserver the file name and path to not break the download link.**

==[This script is here at My Github](https://github.com/CodyHex/setup_scripts/blob/master/create_robot_project.sh)==   

Peng He 2/20/2019

---

*Abstract:*

I have experienced a lot project folder structure iterations during my career time and because every time it happens it probably means that we did something not necessarily wrong but no good for encapsulating our software product.  During the modern MVC design, if you keep carrying the wrong responsibility of your program, then eventually the whole project will become a brain twister and very hard to debug when something is not working. 

> So I decide to share my experience and write this script for you to quickly setup the project structure. You don't need to go over the details if you just want to get something working and I wish I can help you when some days later that you look back and think this script really saved your time a little bit. 



**Considering your `robot name` properly, make is simple and short and related to your product name.** I use `robot` for `robot name` in the following article. Please avoid using the word `robot` when you have a specific product. 

## The "_base" folder

This folder holds your robot's low level and hight level primitive actions. 

In short words:

- create`alpha_robot_driver` package to handle the hardware communication.
- create `robot_base` package to isolate the high level robot action calls.

For example, you should use `catkin_create_package` to create something like `alpha_robot_driver`. This is because usually you will have a different hardware set for different product iteration, and a "driver" is used to match a "firmware" such that on your firmware team, they will have a git repo with a name like `alpha_robot_driver`. 

In this package, you should:

- isolate/implement the primitive hardware control commands with a specific custom ROS messages from the **`alpha_robot_driver/msg` ** 
- handle the firmware (sensor or states) feedback with a specific custom ROS messages from **robot_msgs** package inside the **robot_message folder.** 

Here is the reason why doing so:

1. **Make whatever calls the robot action API stay the same.** From my experience, the product firmware is very easy to get changes during prototyping, and the best way to have a less impact on your high level software system is to have a abstract action package that is **robot_base** package and keep the actions have a high-level API exposed to the system, for instance, your vehicle drive speed, your robot actuator position action command etc. By doing so, you will stabilized your robot specify API to other packages like the vehicle path following control, and when your firmware driver rolls into the next iteration, you only need to update the **robot_base** package for the command. 

2. **Make whatever reads the robot feedback API stay the same**. The other reason is expose out your robot feedback message into the generic **robot_msg** package, so the program that reads from the message will always have the same API such that the driver version won't matter. For example, if the feedback messages are in `alpha_robot_driver` pkg, then when you have a `beta_robot_driver`, you may have a bad time to patch all programs that calls the feedback from alpha folder.  I personally, for small projects, just make custom messages like: `range_snsr`, `angle_snsr`, `binary_snsr` and put all the same type sensor values in this message. It is also quick for you to debug that you don't need to echo four topic at the same time. 

   > Another solution for the feedback can be always using the ROS standard messages. Only if you can define the sensor topic name properly.

## The Tree View Structure

```terminal
├── aRobot
│   ├── aRobot_base 		# holds robot_driver and generic base API
│   │   └── README.md
│   ├── aRobot_bringup 		# the versioned_launch folder for your product
│   │   └── README.md
│   ├── aRobot_debug 		# when just want to make some small tools
│   │   └── README.md
│   ├── aRobot_description 	# robot urdf
│   │   └── README.md
│   ├── aRobot_hri 			# GUI stuff
│   │   └── README.md
│   ├── aRobot_legacy 		# in case you have some old things haven't trashed yet
│   │   └── README.md
│   ├── aRobot_localization # no need to explain
│   │   └── README.md
│   ├── aRobot_manager 		# this monitor & manage the robot status
│   │   └── README.md
│   ├── aRobot_message 		# expose your message API to another and stay cool
│   │   └── README.md
│   ├── aRobot_navigation 	# make sure you can do your control as a plugin
│   │   └── README.md
│   ├── aRobot_perception 	# vision for detecting things or may publish tf(AR)
│   │   └── README.md
│   ├── aRobot_simulator 	# usually Gazebo but could be V-REP
│   │   └── README.md
│   ├── aRobot_visualization# let you avoiding kill Rviz with the main
│   │   └── README.md
│   ├── external_libraries 	# gitignored folder, download & unzip from a share drive
│   │   └── README.md
│   ├── install            	# other small drivers, such as kvaser lib
│   │   └── README.md
│   ├── ots_packages       	# 3rd party off the shelf source code
│   │   └── README.md
│   └── README.md


```

