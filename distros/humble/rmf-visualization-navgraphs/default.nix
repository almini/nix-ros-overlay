
# Copyright 2022 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, ament-cmake, ament-lint-auto, ament-lint-common, geometry-msgs, rclcpp, rclcpp-components, rmf-building-map-msgs, rmf-fleet-msgs, rmf-traffic, rmf-traffic-ros2, rmf-utils, rmf-visualization-msgs, visualization-msgs }:
buildRosPackage {
  pname = "ros-humble-rmf-visualization-navgraphs";
  version = "2.0.0-r1";

  src = fetchurl {
    url = "https://github.com/ros2-gbp/rmf_visualization-release/archive/release/humble/rmf_visualization_navgraphs/2.0.0-1.tar.gz";
    name = "2.0.0-1.tar.gz";
    sha256 = "dc8b8b117fa1799583ca356e3572f2b19c913f66b0af2a3ad6cc8ec6b174326c";
  };

  buildType = "ament_cmake";
  buildInputs = [ ament-cmake ];
  checkInputs = [ ament-lint-auto ament-lint-common rmf-utils ];
  propagatedBuildInputs = [ geometry-msgs rclcpp rclcpp-components rmf-building-map-msgs rmf-fleet-msgs rmf-traffic rmf-traffic-ros2 rmf-visualization-msgs visualization-msgs ];
  nativeBuildInputs = [ ament-cmake ];

  meta = {
    description = ''A package to visualiize the navigation graphs of fleets'';
    license = with lib.licenses; [ "Apache-license-2.0" ];
  };
}
