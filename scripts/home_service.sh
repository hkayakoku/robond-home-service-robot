#!/bin/sh
CATKIN_WS="$(cd $(dirname "$0")/../..> /dev/null && pwd)"
export ROBOT_INITIAL_POSE="-x 0 -y -5 -Y 1.5707"
xterm -e "roslaunch turtlebot_gazebo turtlebot_world.launch world_file:=$CATKIN_WS/src/map/vworld.world" &
sleep 10
xterm -e "roslaunch turtlebot_gazebo amcl_demo.launch map_file:=$CATKIN_WS/src/map/map.yaml" &
xterm -e "roslaunch turtlebot_rviz_launchers view_navigation.launch" &
sleep 10
xterm -e "rosrun add_markers add_markers" &
sleep 3
xterm -e "rosrun pick_objects pick_objects"  
