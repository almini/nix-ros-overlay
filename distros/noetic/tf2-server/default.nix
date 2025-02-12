
# Copyright 2022 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, catkin, geometry-msgs, gtest, message-generation, message-runtime, nodelet, python3Packages, roscpp, rospy, rostest, tf, tf2-msgs, tf2-ros }:
buildRosPackage {
  pname = "ros-noetic-tf2-server";
  version = "1.1.2-r1";

  src = fetchurl {
    url = "https://github.com/peci1/tf2_server-release/archive/release/noetic/tf2_server/1.1.2-1.tar.gz";
    name = "1.1.2-1.tar.gz";
    sha256 = "0ec115bae4a412ef6d2ffb78be3ac3eaf93d84afba296b398c3253447f5c120d";
  };

  buildType = "catkin";
  buildInputs = [ catkin message-generation python3Packages.setuptools ];
  checkInputs = [ gtest rostest tf ];
  propagatedBuildInputs = [ geometry-msgs message-runtime nodelet roscpp rospy tf2-msgs tf2-ros ];
  nativeBuildInputs = [ catkin python3Packages.setuptools ];

  meta = {
    description = ''TF2 server that can provide transforms over separate TF topics'';
    license = with lib.licenses; [ bsdOriginal ];
  };
}
