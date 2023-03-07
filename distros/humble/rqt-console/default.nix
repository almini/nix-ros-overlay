
# Copyright 2022 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchgit, writeText, ament-index-python, python-qt-binding, rcl-interfaces, rclpy, rqt-gui, rqt-gui-py, rqt-py-common, qos-best-effort ? false }:
buildRosPackage {
  pname = "ros-humble-rqt-console";
  version = "2.1.1";

  src = fetchgit {
    url = "https://github.com/ros-visualization/rqt_console.git";
    rev = "7b4797c29746ea1f39b05beac63d836a5ded8cd3";
    hash = "sha256-afdhFwll4Y44GpmZIXLZmYztFt8RnvvVJFPRCxKGcGM=";
  };

  patchFlags = "-p1 -l";
  patches = if qos-best-effort then [
    (writeText "use_best_effort.patch" ''
      diff --git a/src/rqt_console/console.py b/src/rqt_console/console.py
      index 04177a2..e285f2d 100644
      --- a/src/rqt_console/console.py
      +++ b/src/rqt_console/console.py
      @@ -80,7 +80,7 @@ class Console(Plugin):
              self._timer.timeout.connect(self.insert_messages)
              self._timer.start(100)
              self._qos = QoSProfile(
      -            reliability=QoSReliabilityPolicy.RELIABLE,
      +            reliability=QoSReliabilityPolicy.BEST_EFFORT,
                  durability=QoSDurabilityPolicy.TRANSIENT_LOCAL,
                  history=QoSHistoryPolicy.SYSTEM_DEFAULT,
                  liveliness=QoSLivelinessPolicy.AUTOMATIC,
    '')
  ] else [];

  buildType = "ament_python";
  propagatedBuildInputs = [ ament-index-python python-qt-binding rcl-interfaces rclpy rqt-gui rqt-gui-py rqt-py-common ];

  meta = {
    description = ''rqt_console provides a GUI plugin for displaying and filtering ROS messages.'';
    license = with lib.licenses; [ bsdOriginal ];
  };
}
