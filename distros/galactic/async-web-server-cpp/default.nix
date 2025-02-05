
# Copyright 2022 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, ament-cmake-ros, boost, launch-testing, openssl, python3Packages }:
buildRosPackage {
  pname = "ros-galactic-async-web-server-cpp";
  version = "2.0.0-r2";

  src = fetchurl {
    url = "https://github.com/ros2-gbp/async_web_server_cpp-release/archive/release/galactic/async_web_server_cpp/2.0.0-2.tar.gz";
    name = "2.0.0-2.tar.gz";
    sha256 = "ab69fc26e1a7da03ef1a69335ac7d132470ada68600b06566305624565a5da66";
  };

  buildType = "catkin";
  buildInputs = [ ament-cmake-ros openssl ];
  checkInputs = [ launch-testing python3Packages.websocket-client ];
  propagatedBuildInputs = [ boost ];
  nativeBuildInputs = [ ament-cmake-ros ];

  meta = {
    description = ''Asynchronous Web/WebSocket Server in C++'';
    license = with lib.licenses; [ bsdOriginal ];
  };
}
