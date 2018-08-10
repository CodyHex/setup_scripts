Tester

```python
import tf
import numpy as np
import rospkg
from nav_msgs.msg import Odometry
from geometry_msgs.msg import Point, Pose, Quaternion, Twist, Vector3
from sensor_msgs.msg import JointState, Imu

from gazebo_msgs.msg import ModelStates, LinkStates


class GazeboOdom:

  def __init__(self):


    # Publishers
    self.odom_pub = rospy.Publisher("odom", Odometry, queue_size=50)
    self.wheel_odom_pub = rospy.Publisher("wheel_odom", Odometry, queue_size=50)
    self.tag_odom_pub = rospy.Publisher("tag_odom", Odometry, queue_size=50)
    self.wheel_state_pub = rospy.Publisher("firmware/feedback/wheel_state", WheelState, queue_size=50)

    # Subscribers
    self.model_state_sub = rospy.Subscriber("gazebo/model_states", ModelStates, self.model_state_cb)
    self.joint_state_sub = rospy.Subscriber("joint_states", JointState, self.joint_state_cb)

    # rospy.logerr("%s",self.tags['loc'])
    self.use_sim_wheel_state = rospy.get_param('/use_sim_wheel_state', True)
    

    return
```

```xml
<?xml version="1.0"?>
<launch>


    <!-- RUN MAP SERVER -->
    <node name="map_server" pkg="map_server" type="map_server" args="$(find beta_tugger_navigation)/maps/wh_floor_6-7-18.yaml"/>
    

    <node pkg="rosbag" type="play" name="player" output="screen" args="--clock $(find beta_tugger_navigation)/bags/push_into_trailer_7-26/2018-07-26-13-04-45.bag"/>

    
      
    <!-- RUN RVIZ -->
    <include file="$(find beta_tugger_bringup)/launch/base_controller.launch"/>

    
</launch>
```

```yaml
obstacle_range: 12
raytrace_range: 12

plugins: 
    - {name: static_map,       type: "costmap_2d::StaticLayer"}
    - {name: inflation,        type: "costmap_2d::InflationLayer"}
    - {name: costmap_prohibition_layer,       type: "costmap_prohibition_layer_namespace::CostmapProhibitionLayer"}
    - {name: social,        type: "social_navigation_layers::ProxemicLayer"}

    
costmap_prohibition_layer/prohibition_areas:
# First bay region
 - [[30.8, 89], [36.896, 89], [36.896, 53.43], [30.8, 53.43]]
 - [[41.7728, 89], [47.8688, 89], [47.8688, 53.43], [41.7728, 53.43]]
```
