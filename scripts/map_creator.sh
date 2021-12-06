#!/bin/sh
CATKIN_WS="$(cd $(dirname "$0")/../..> /dev/null && pwd)"
xterm  -e  " gzserver $CATKIN_WS/src/map/vworld.world " &
sleep 5
xterm  -e  " source /opt/ros/kinetic/setup.bash; roslaunch pgm_map_creator request_publisher.launch"
