
# Copyright 2022 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, catkin, robot-state-publisher, roslaunch, roslib, rviz, urdf, xacro }:
buildRosPackage {
  pname = "ros-noetic-dbw-mkz-description";
  version = "1.6.0-r1";

  src = fetchurl {
    url = "https://github.com/DataspeedInc-release/dbw_mkz_ros-release/archive/release/noetic/dbw_mkz_description/1.6.0-1.tar.gz";
    name = "1.6.0-1.tar.gz";
    sha256 = "910acb3bcadbca9107c6b94bbfb1530078ffa012694061f6a69ecb2479342972";
  };

  buildType = "catkin";
  buildInputs = [ catkin ];
  checkInputs = [ roslaunch roslib rviz ];
  propagatedBuildInputs = [ robot-state-publisher roslaunch urdf xacro ];
  nativeBuildInputs = [ catkin ];

  meta = {
    description = ''URDF and meshes describing the Lincoln MKZ.'';
    license = with lib.licenses; [ bsdOriginal ];
  };
}
