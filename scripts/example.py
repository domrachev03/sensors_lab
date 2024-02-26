#!/usr/bin/env python3
import os
import rospy

from nav_msgs.msg import Odometry


class Example(object):

    def __init__(self):
        self.odometry = Odometry()
        self.odom_subscriber = rospy.Subscriber("/odom", Odometry, odomCallback)

        rospy.loginfo("[Example] loaded")

    def odomCallback(self, msg: Odometry):
        rospy.loginfo(
            f"Look, here is your odometry: {msg.pose.x}, {msg.pose.y}, {msg.pose.z}"
        )


if __name__ == "__main__":
    rospy.init_node("example_node")

    exp = Example()
    exp.spin()
