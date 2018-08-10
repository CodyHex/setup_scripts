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

