
# Copyright 2022 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, catkin, cv-bridge, graphviz, gtk3, pythonPackages, rostest, smach-msgs, smach-ros, xdot }:
buildRosPackage {
  pname = "ros-melodic-smach-viewer";
  version = "4.0.1-r1";

  src = fetchurl {
    url = "https://github.com/jbohren/executive_smach_visualization-release/archive/release/melodic/smach_viewer/4.0.1-1.tar.gz";
    name = "4.0.1-1.tar.gz";
    sha256 = "9a5187a9b246fe0c1ecdf782fdd31c78902c28d5d041f84424b12eea8c954d26";
  };

  buildType = "catkin";
  buildInputs = [ catkin rostest ];
  propagatedBuildInputs = [ cv-bridge graphviz gtk3 pythonPackages.pygobject3 pythonPackages.pyqt5 pythonPackages.rospkg pythonPackages.wxPython smach-msgs smach-ros xdot ];
  nativeBuildInputs = [ catkin ];

  meta = {
    description = ''The smach viewer is a GUI that shows the state of hierarchical
    SMACH state machines. It can visualize the possible transitions
    between states, as well as the currently active state and the
    values of user data that is passed around between states. The
    smach viewer uses the SMACH debugging interface based on
    the <a href="http://www.ros.org/wiki/smach_msgs">smach
    messages</a> to gather information from running state machines.'';
    license = with lib.licenses; [ bsdOriginal ];
  };
}
