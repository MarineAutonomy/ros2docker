#!/usr/bin/env python3
import rclpy
from rclpy.node import Node

class NumberPublisherNode(Node):
    def __init__(self):
        super().__init__("number_publisher")
        self.number = 4
        self.number_timer = self.create_timer(0.5, self.print_number)
        self.get_logger().info("Number publisher has been started!!")

    def print_number(self):
        self.get_logger().info(str(self.number))

def main(args=None):
    rclpy.init(args=args)  # this line initializes ros2 communications
    node = NumberPublisherNode()
    rclpy.spin(node)
    rclpy.shutdown()


if __name__ == '__main__':
    main()