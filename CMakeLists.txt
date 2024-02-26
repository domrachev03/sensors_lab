cmake_minimum_required(VERSION 3.0.2)
project(sensors_lab)
find_package(catkin REQUIRED COMPONENTS
  roscpp
  rospy
  geometry_msgs
  nav_msgs
  std_msgs
)

catkin_package(
 INCLUDE_DIRS include
 CATKIN_DEPENDS roscpp rospy
)


include_directories(
  include
  ${catkin_INCLUDE_DIRS}
)
add_executable(example_node src/example.cpp)
add_dependencies(example_node ${${PROJECT_NAME}_EXPORTED_TARGETS} ${catkin_EXPORTED_TARGETS})
target_link_libraries(example_node
  ${catkin_LIBRARIES}
)
install(DIRECTORY scripts/
  DESTINATION ${CATKIN_PACKAGE_BIN_DESTINATION}
  USE_SOURCE_PERMISSIONS
  PATTERN ".svn" EXCLUDE)
