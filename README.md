# setup_scripts

# for tilix terminal in bashrc
```
if [ $TILIX_ID ] || [ $VTE_VERSION ]; then
        source /etc/profile.d/vte.sh
fi
```
# tilix command link file with a terminal
`ln -s /etc/profile.d/vte-2.91.sh /etc/profile.d/vte.sh`

# swap ctr and alt alias
`alias sskey='xmodmap ~/.Xmodmap'`

# touch ~/.Xmodmap file 
```
clear control
clear mod1
keycode 37 = Alt_L Meta_L
keycode 64 = Control_L
add control = Control_L Control_R
add mod1 = Alt_L Meta_L
```

# clion desktop .local/share/applications/jetbrain-XXX.desktop
`Exec=bash -i -c "PATH_TO_CLION/bin/clion.sh" %f`

# clion using catkin make
To have a single build across the IDE and console, you need to set CLion build paths to the catkin workspace directories. For this, go to File | Settings (Ctrl+Alt+S) | Build, Execution, Deployment | CMake and change two fields:

In Generation path, set `workspace_folder/build`.

In CMake options, `add -DCATKIN_DEVEL_PREFIX:PATH=workspace_folder/devel`.

![](https://www.jetbrains.com/help/img/idea/2019.1/cl_ros_cmake_settings.png)

alias exmaster="export ROS_MASTER_URI='http://ubuntu1:11311'"
alias exapw="export ROS_MASTER_URI='http://apoorvcn47-Oryx-Pro:11311'"
alias cdagv='cd ~/rdex_ws/src/agv'
alias cdcatkin='cd ~/rdex_ws/'
source /opt/ros/kinetic/setup.bash
source ~/rdex_ws/devel/setup.bash

alias hconda='export PATH="/home/user/anaconda3/bin:$PATH"'
# for the husky robot, disabled
# export HUSKY_GAZEBO_DESCRIPTION=$(rospack find husky_gazebo)/urdf/description.gazebo.xacro

