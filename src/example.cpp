#include "example.h"

Example::Example(): nh_() {
    odom_sub_ = nh_.subscribe("/odom", 10, &Example::odomCallback, this);
    odom1_pub_ = nh_.advertise<nav_msgs::Odometry>("/odom1", 10);
}

void Example::odomCallback(const nav_msgs::Odometry &msg) {
    ROS_INFO_STREAM("Look, here is your odometry: (" << msg.pose.pose.position.x << ", " << msg.pose.pose.position.y << ", " << msg.pose.pose.position.z << ")");
    odom1_pub_.publish(msg);
}

int main(int argc, char * argv[])
{
    ros::init(argc, argv, "example_node");

    Example ex;
    ros::spin();

    return 0;
}
