
# Copyright 2022 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, ament-copyright, ament-flake8, ament-index-python, ament-pep257, launch, launch-ros, pythonPackages, ros2cli, ros2pkg }:
buildRosPackage {
  pname = "ros-galactic-ros2launch";
  version = "0.14.5-r1";

  src = fetchurl {
    url = "https://github.com/ros2-gbp/launch_ros-release/archive/release/galactic/ros2launch/0.14.5-1.tar.gz";
    name = "0.14.5-1.tar.gz";
    sha256 = "3af54d856a7ce1ccf41d420423aafcf8983ae859a20addfaeaa4e7670696811a";
  };

  buildType = "ament_python";
  checkInputs = [ ament-copyright ament-flake8 ament-pep257 pythonPackages.pytest ];
  propagatedBuildInputs = [ ament-index-python launch launch-ros ros2cli ros2pkg ];

  meta = {
    description = ''The launch command for ROS 2 command line tools.'';
    license = with lib.licenses; [ asl20 ];
  };
}
