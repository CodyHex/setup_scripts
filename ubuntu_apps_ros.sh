
# chrome stable 3rd ppa
wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | sudo apt-key add -
echo 'deb [arch=amd64] http://dl.google.com/linux/chrome/deb/ stable main' | sudo tee /etc/apt/sources.list.d/google-chrome.list
sudo apt-get update 
sudo apt-get install google-chrome-stable

# ros kinetic
sudo sh -c 'echo "deb http://packages.ros.org/ros/ubuntu $(lsb_release -sc) main" > /etc/apt/sources.list.d/ros-latest.list' && \
sudo apt-key adv --keyserver hkp://ha.pool.sks-keyservers.net:80 --recv-key 421C365BD9FF1F717815A3895523BAEEB01FA116 && \
sudo apt-get update && \
sudo apt-get install ros-kinetic-desktop-full && \
sudo rosdep init && \
rosdep update && \
echo "source /opt/ros/kinetic/setup.bash" >> ~/.bashrc && \
source ~/.bashrc && \
sudo apt-get install python-rosinstall python-rosinstall-generator python-wstool build-essential

# miniconda
# if you install ROS first, conda will detect the PYTHONPATH is set, choose "no" to not append the conda path to it
# becareful /user/ should be your user name, everytime in a new terminal if you want to run conda, type ssconda first
echo "alias ssconda='unset PYTHONPATH && export PATH=/home/user/miniconda3/bin:$PATH' " >> ~/.bashrc && source ~/.bashrc
