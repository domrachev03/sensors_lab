#include <ros/ros.h>
#include <nav_msgs/Odometry.h>


class Example {
private:
    ros::NodeHandle nh_;
    ros::Subscriber odom_sub_;
    ros::Publisher odom1_pub_;
public:
    Example();
    void odomCallback(const nav_msgs::Odometry &msg);
};
