
# Copyright 2022 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, ament-cmake, ament-lint-auto, ament-lint-common, dolly-follow, gazebo-ros-pkgs, ros2launch, rviz2 }:
buildRosPackage {
  pname = "ros-rolling-dolly-gazebo";
  version = "0.4.0-r2";

  src = fetchurl {
    url = "https://github.com/ros2-gbp/dolly-release/archive/release/rolling/dolly_gazebo/0.4.0-2.tar.gz";
    name = "0.4.0-2.tar.gz";
    sha256 = "ed2618c8a0b5aaf0446280f3a69bd1fee5b0ff69f9de0e984679fc5d9cce60ad";
  };

  buildType = "ament_cmake";
  buildInputs = [ ament-cmake ];
  checkInputs = [ ament-lint-auto ament-lint-common ];
  propagatedBuildInputs = [ dolly-follow gazebo-ros-pkgs ros2launch rviz2 ];
  nativeBuildInputs = [ ament-cmake ];

  meta = {
    description = ''Launch Gazebo simulation with Dolly robot.'';
    license = with lib.licenses; [ asl20 ];
  };
}
