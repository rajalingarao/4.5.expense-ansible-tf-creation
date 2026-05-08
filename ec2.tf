#resource <resource-type> <resource-name>
resource "aws_instance" "expense" {
  count = length(var.instance_names)
  ami           = data.aws_ami.ami_info.id
  vpc_security_group_ids = [aws_security_group.allow_ssh.id]
  instance_type = var.instance_names[count.index] == "db" ? "t3.small": "t3.micro"

  tags = merge (
    var.common_tags, {
       Name = var.instance_names[count.index]
       Module = var.instance_names[count.index]
    }
 )
}
resource "aws_security_group" "allow_ssh" {
  name        = var.sg_name
  description = var.sg_description
    ingress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = var.allowed_cidr
    }
  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = var.allowed_cidr
  }
  tags = {
    Name = "allow_ssh"
    Createdby="Lingaiah"
  }
}
resource "aws_instance" "ansible_master" {
    ami           = data.aws_ami.ami_info.id
    instance_type = var.ansible_master.instance_type
    vpc_security_group_ids = [var.allow_all]
    user_data = file("${path.module}/ansible_install.sh")
    tags = {
        Name = "ansible-master"
    }
    depends_on = [aws_instance.expense]

    
}
resource "aws_route53_record" "ansible_r53" {
    zone_id = var.zone_id
    name    = "ansible.${var.domain_name}"
    type    = "A"
    ttl     = 1
    records = [aws_instance.ansible_master.public_ip]
    allow_overwrite = true
}