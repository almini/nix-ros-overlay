
# Copyright 2022 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, catkin, glew, jsoncpp, mapviz, pluginlib, qt5, roscpp, swri-math-util, swri-transform-util, swri-yaml-util, tf }:
buildRosPackage {
  pname = "ros-noetic-tile-map";
  version = "1.4.1-r2";

  src = fetchurl {
    url = "https://github.com/swri-robotics-gbp/mapviz-release/archive/release/noetic/tile_map/1.4.1-2.tar.gz";
    name = "1.4.1-2.tar.gz";
    sha256 = "50c04b7b4f00b808c329d3d161ba2ada5155278071db1bafda5edec95e4559d4";
  };

  buildType = "catkin";
  buildInputs = [ catkin ];
  propagatedBuildInputs = [ glew jsoncpp mapviz pluginlib qt5.qtbase roscpp swri-math-util swri-transform-util swri-yaml-util tf ];
  nativeBuildInputs = [ catkin qt5.qtbase ];

  meta = {
    description = ''Tile map provides a slippy map style interface for visualizing 
     OpenStreetMap and GooleMap tiles.  A mapviz visualization plug-in is also
     implemented'';
    license = with lib.licenses; [ bsdOriginal ];
  };
}
