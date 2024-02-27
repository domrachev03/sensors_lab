#!/usr/bin/env python3
import rospy

from nav_msgs.msg import Odometry


class Example(object):
    def __init__(self):
        self.odometry = Odometry()
        self.odom_subscriber = rospy.Subscriber("/odom", Odometry, self.odomCallback)

        rospy.loginfo("[Example] loaded")

    def odomCallback(self, msg: Odometry):
        rospy.loginfo(
            f"Look, here is your odometry: {msg.pose.pose.position.x}, {msg.pose.pose.position.y}, {msg.pose.pose.position.z}"
        )


if __name__ == "__main__":
    rospy.init_node("example_node")

    exp = Example()
    rospy.spin()
