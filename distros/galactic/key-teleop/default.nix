
# Copyright 2022 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, ament-copyright, ament-flake8, ament-pep257, geometry-msgs, pythonPackages, rclpy }:
buildRosPackage {
  pname = "ros-galactic-key-teleop";
  version = "1.3.0-r1";

  src = fetchurl {
    url = "https://github.com/ros2-gbp/teleop_tools-release/archive/release/galactic/key_teleop/1.3.0-1.tar.gz";
    name = "1.3.0-1.tar.gz";
    sha256 = "bda57bc39ba604027a1fd39eb47393aaa495facfc8098fa80e2c47be1ea6145e";
  };

  buildType = "ament_python";
  checkInputs = [ ament-copyright ament-flake8 ament-pep257 pythonPackages.pytest ];
  propagatedBuildInputs = [ geometry-msgs rclpy ];

  meta = {
    description = ''A text-based interface to send a robot movement commands.'';
    license = with lib.licenses; [ bsdOriginal ];
  };
}
