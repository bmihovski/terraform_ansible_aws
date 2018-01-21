provider "aws" {
  region = "${var.aws_region}"
  profile = "${var.aws_profile}"
}

#IAM
#S3_access

#VPC
resource "aws_vpc" "vpc" {
  cidr_block = "10.1.0.0/16"
}
#Internet Gateway
resource "aws_internet_gateway" "internet_gateway" {
  vpc_id = "${aws_vpc.vpc.id}"
}
#Public route table
resource "aws_route_table" "public" {
  vpc_id = "${aws_vpc.vpc.is}"
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = "${aws_internet_gateway.internet_gateway.id}"
  }
  tags {
    Name = "public"
  }
}
#Private route
resource "aws_default_route_table" "private" {
  default_route_table_id = "${aws_vpc.vpc.default_route_table_id}"
  tags {
    Name = "private"
  }
}
#Subnets
#public
resource "aws_subnet" "public" {
  vpc_id = "${aws_vpc.vpc.id}"
  cidr_block = "10.1.1.0/24"
  map_public_ip_on_launch = true
  availability_zone = "us-east-1d"
  
  tags {
    Name = "public"
  }
}

#private 1
resource "aws_subnet" "private1" {
  vpc_id = "${aws_vpc.vpc.id}"
  cidr_block = "10.1.2.0/24"
  map_public_ip_on_launch = false
  availability_zone = "us-east-1a"
  
  tags {
    Name = "private1"
  }
}
#private 2
resource "aws_subnet" "private2" {
  vpc_id = "${aws_vpc.vpc.id}"
  cidr_block = "10.1.3.0/24"
  map_public_ip_on_launch = false
  availability_zone = "us-east-1b"
  tags {
    Name = "private2"
  }
}
#RDS1
resource "aws_subnet" "rds1" {
  vpc_id = "${aws_vpc.vpc.id}"
  cidr_block = "10.1.4.0/24"
  map_public_ip_on_launch = false
  availability_zone = "us-east-1a"
  
  tags {
    Name = "rds1"
  }
}
#RDS2
resource "aws_subnet" "rds2" {
  vpc_id = "${aws_vpc.vpc.id}"
  cidr_block = "10.1.5.0/24"
  map_public_ip_on_launch = false
  availability_zone = "us-east-1c"
  
  tags {
    Name = "rds2"
  }
}
#RDS3
resource "aws_subnet" "rds3" {
  vpc_id = "${aws_vpc.vpc.id}"
  cidr_block = "10.1.6.0/24"
  map_public_ip_on_launch = false
  availability_zone = "us-east-1d"
  
  tags {
    Name = "rds3"
  }
}
#Security groups

#Private
#Public
#RDS

#S3 code bucket

#compute
#key pair
#dev server
  #ansible play
#load balancer
#AMI
#launch
#ASG

#Route53
#primary zone
#www
#dev
#db