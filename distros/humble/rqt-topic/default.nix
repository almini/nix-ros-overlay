
# Copyright 2022 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchgit, writeText, ament-flake8, ament-xmllint, python-qt-binding, rqt-gui, rqt-gui-py, rqt-py-common, qos-best-effort ? false }:
buildRosPackage {
  pname = "ros-humble-rqt-topic";
  version = "1.5.0";

  src = fetchgit {
    url = "https://github.com/ros-visualization/rqt_topic.git";
    rev = "19141d759cfa35515182677f9d4e60a898e86c74";
    hash = "sha256-KaZgmQR/rs+Wytag9UQRfsxLPllN9Oy6pP/THQ9C4CA=";
  };

  patchFlags = "-p1 -l";
  patches = if qos-best-effort then [
    (writeText "use_best_effort.patch" ''
      diff --git a/src/rqt_topic/topic_info.py b/src/rqt_topic/topic_info.py
      index f2c2d18..6578e35 100644
      --- a/src/rqt_topic/topic_info.py
      +++ b/src/rqt_topic/topic_info.py
      @@ -38,6 +38,7 @@
       from python_qt_binding.QtCore import qWarning
       from ros2topic.verb.hz import ROSTopicHz
       from rqt_py_common.message_helpers import get_message_class
      +from rclpy.qos import QoSProfile, QoSReliabilityPolicy, QoSHistoryPolicy, QoSLivelinessPolicy, QoSDurabilityPolicy
       
       
       class TopicInfo(ROSTopicHz):
      @@ -78,9 +79,16 @@ class TopicInfo(ROSTopicHz):
           def start_monitoring(self):
               if self.message_class is not None:
                   self.monitoring = True
      +            self._qos = QoSProfile(
      +                reliability=QoSReliabilityPolicy.BEST_EFFORT,
      +                durability=QoSDurabilityPolicy.TRANSIENT_LOCAL,
      +                history=QoSHistoryPolicy.SYSTEM_DEFAULT,
      +                liveliness=QoSLivelinessPolicy.AUTOMATIC,
      +                depth=10
      +            )
                   self._subscriber = self._node.create_subscription(
                       self.message_class, self._topic_name, self.message_callback,
      -                qos_profile=10)
      +                qos_profile=self._qos)
       
           def stop_monitoring(self):
               self.monitoring = False
    '')
  ] else [];

  buildType = "ament_python";
  checkInputs = [ ament-flake8 ament-xmllint ];
  propagatedBuildInputs = [ python-qt-binding rqt-gui rqt-gui-py rqt-py-common ];

  meta = {
    description = ''rqt_topic provides a GUI plugin for displaying debug information about ROS topics including publishers, subscribers, publishing rate, and ROS Messages.'';
    license = with lib.licenses; [ bsdOriginal asl20 ];
  };
}
