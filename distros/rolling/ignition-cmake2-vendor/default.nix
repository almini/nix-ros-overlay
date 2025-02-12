
# Copyright 2022 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, ament-cmake-copyright, ament-cmake-lint-cmake, ament-cmake-test, ament-cmake-xmllint, cmake, doxygen, git, ignition }:
buildRosPackage {
  pname = "ros-rolling-ignition-cmake2-vendor";
  version = "0.0.2-r1";

  src = fetchurl {
    url = "https://github.com/ros2-gbp/ignition_cmake2_vendor-release/archive/release/rolling/ignition_cmake2_vendor/0.0.2-1.tar.gz";
    name = "0.0.2-1.tar.gz";
    sha256 = "0d57fe9bdc1c2328c2c4f7020a11575464f39cd8c4d172bd885659b2ab31adf5";
  };

  buildType = "cmake";
  buildInputs = [ ament-cmake-test cmake doxygen git ];
  checkInputs = [ ament-cmake-copyright ament-cmake-lint-cmake ament-cmake-xmllint ];
  propagatedBuildInputs = [ ignition.cmake2 ];
  nativeBuildInputs = [ ament-cmake-test cmake doxygen git ];

  meta = {
    description = ''This package provides the Ignition CMake 2.x library.'';
    license = with lib.licenses; [ asl20 ];
  };
}
