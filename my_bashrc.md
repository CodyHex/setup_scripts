```

# for tilix terminal
if [ $TILIX_ID ] || [ $VTE_VERSION ]; then
        source /etc/profile.d/vte.sh
fi

# run xserver
export DISPLAY=:0.0
alias xdisplay='dbus-launch --exit-with-session ~/.xsession'

# My IDEs
alias sskey='xmodmap ~/.Xmodmap' # swap ctr and alt
alias xclion='bash ~/Apps/clion/bin/clion.sh'
alias xgendoc='rosdoc_lite . -o ~/catkin_ws/src/doc/'

# ROS related
alias hpmake='cd ~/catkin_ws && catkin_make'
alias exmaster="export ROS_MASTER_URI='http://ubuntu1:11311'"
source /opt/ros/melodic/setup.bash
source ~/catkin_ws/devel/setup.bash

# ML
alias hconda='export PATH="/home/user/anaconda3/bin:$PATH"'

```
