# Sensors & Sensing Lab: Lidar & SLAM
This repository is a template for the homework on topic "Lidars, SLAM, RANSAC" for the course "Sensors & Sensing" in Innopolis University.

It contains ROS Noetic sample package with Docker environment to use it without ROS locally installed.

## Usage
There are three ways to use this repository.
1. **Using repo as ROS package**
   One could use the repository with native ROS Noetic installation by putting it in the `/ws/src` directory. The package was optimized for `catkin build`.

2. **Using devcontainer**
   [Devcontainer](https://code.visualstudio.com/docs/devcontainers/containers) is a plugin that allows to connect IDE to the docker environment. Also it installs all the plugins for convinient development environment.

   To utilize it, you need to:
   1. Install VSCode and Devcontainer plugin inside it.
   2. Press Ctrl+Shift+P and choose `Rebuild and reopen in container`
   3. Open the terminal, and source the ROS environment (it is builded upon start): `source /ros_ws/devel/setup.bash`

   Done! Now you could use the environment and run the ROS code right inside the container. It would automaticall mount the repository there and save all the changes you would make.

3. **Running docker-compsoe**
   Finally, one could just run the docker compose via `docker-compose up`, which would automatically build the package and launch the `solution.launch` file.


## Lab task
### Task 1
1. Select the room relative to which you will be capturing data. At least 2 walls in the room must be accessible.
2. Connect to the lidar (via [this repo](https://github.com/IljaRukin/camsense_X1_lidar?tab=readme-ov-file)) capture 3+ frames of lidar data at different points in the room.
3. Combine the point clouds using the [ICP algorithm](https://github.com/pglira/simpleICP). Visualize the result obtained. Blue indicates the points you captured from the lidar, red indicates the points where the lidar was standing during the measurements.
4. Run the [RANSAC](https://scikit-learn.org/stable/auto_examples/linear_model/plot_ransac.html) algorithm to detect walls on the resulting image.
> Note: the ideal implementation would be using ROS nodes, because it would allow automaticall visualize it in `rviz` and you would implement RANSAC algorithm only once for both tasks.
> 
> Think about how you could collect data from the lidar and publish it as a scan message.
### Task 2
1. Using this repository and the [rosbag file](https://drive.google.com/file/d/1lUPTX5NeEGetGuRORpGiRVaJvWjGmNnO/view?usp=sharing), run the 2D SLAM algorithm for reconstructing the room SLAM was performed into. The result should resemble the picture below. 
   1. Put the rosbag file in `rosbags` folder. 
   2. The solution should be put in `solution.launch` file. The sample `C++` and `Python` nodes are provided.
2. On top of the resulting map, perform the RANSAC algorithm to find the walls. Publish the result as ROS topic and show it in RVIZ.
3. Elaborate on which walls were found, which were not and why.

<p align="center">
  <img src="https://drive.google.com/uc?export=view&id=1rxgsFCRmuKPExJUQXKzxsu4j5AMMS19l" alt="drawing" width="500"/>
</p>

## TODO list
- [ ] Add node for connecting to Camsense lidar