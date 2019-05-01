```

# for tilix terminal
if [ $TILIX_ID ] || [ $VTE_VERSION ]; then
        source /etc/profile.d/vte.sh
fi

# swap ctr and alt
alias sskey='xmodmap ~/.Xmodmap'
# run xserver
export DISPLAY=:0.0
alias xdisplay='dbus-launch --exit-with-session ~/.xsession'
alias exmaster="export ROS_MASTER_URI='http://ubuntu1:11311'"
alias hpmake='cd ~/catkin_ws && catkin_make'

source /opt/ros/kinetic/setup.bash
source ~/rdex_ws/devel/setup.bash

alias hconda='export PATH="/home/user/anaconda3/bin:$PATH"'
# for the husky robot, disabled
# export HUSKY_GAZEBO_DESCRIPTION=$(rospack find husky_gazebo)/urdf/description.gazebo.xacro

```
