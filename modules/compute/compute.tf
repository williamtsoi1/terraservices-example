resource "aws_autoscaling_group" "cluster" {
  vpc_zone_identifier  = ["${var.subnets}"]
  max_size             = "${var.cluster_max_size}"
  min_size             = "${var.cluster_min_size}"
  desired_capacity     = "${var.cluster_desired_size}"
  launch_configuration = "${aws_launch_configuration.cluster.name}"
}

resource "aws_launch_configuration" "cluster" {
  image_id      = "${data.aws_ami.ubuntu.id}"
  instance_type = "${var.instance_type}"
}


data "aws_ami" "ubuntu" {
  most_recent = true
  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-trusty-14.04-amd64-server-*"]
  }
  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }
  owners = ["099720109477"] # Canonical
}

