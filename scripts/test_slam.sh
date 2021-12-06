#!/bin/sh
CATKIN_WS="$(cd $(dirname "$0")/../..> /dev/null && pwd)"
export ROBOT_INITIAL_POSE="-x 0 -y -5 -Y 0"
xterm -e "roslaunch turtlebot_gazebo turtlebot_world.launch world_file:=$CATKIN_WS/src/map/vworld.world" &
sleep 15
xterm -e "roslaunch turtlebot_gazebo gmapping_demo.launch" &
xterm -e "roslaunch turtlebot_rviz_launchers view_navigation.launch" &
xterm -e "roslaunch turtlebot_teleop keyboard_teleop.launch"
