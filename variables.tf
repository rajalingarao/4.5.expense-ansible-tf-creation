#ec2 variables
variable "instance_names" {
    type = list
    default = ["db","backend","frontend"]
}

variable "instance_type" {
    default ="t3.micro"
    type = string
}
variable "common_tags" {
    default = {
        Project ="Expense"
        Environment ="Dev"
        Terraform = "true"
    }
}
variable "sg_name" {
    type = string
    default = "allow_ssh"
 }
 variable "sg_description" {
    type = string
    default ="allowing port 22"
 }
 variable "ssh_port" {
    type = number
    default =22
 }
variable "protocol"{
    type = string
    default ="tcp"
}
variable "allowed_cidr" {
    type=list(string)
    default =["0.0.0.0/0"]

}
#r53 variables
variable "zone_id" {
    default ="Z012785114HGZTDQ8KSQH"
}
variable "domain_name" {
      default = "lithesh.shop"

}
variable "allow_all" {
   type = string
   default = "sg-088bbd993cbc52b59"
}
variable "ansible_master" {
   default = {
        instance_type  = "t3.micro"
   }
}









