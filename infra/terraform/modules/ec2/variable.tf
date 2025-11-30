variable "tags" {
  type = map(string)
  description = "A map of tags to assign to resources"
}

# variable "sg_id" {
#   type = string
# }

variable "pub_sg_id" {
    type = list(string) 
}

variable "epicbook_pubsub_id" {
    type = string  
}


variable "aws_region" {
}


variable "ami" {
    type = string  
}

variable "ec2_key_path" {
    type = string 
    
    validation {
    condition = can(regex("^(ssh-(rsa|ed25519|dss)|ecdsa-sha2-)", trimspace(replace(replace(var.ec2_key_path, "\r", ""), "\n", " "))))
    error_message = "ec2_key_path must be an OpenSSH public key string (starts with ssh-ed25519, ssh-rsa, ecdsa-sha2-, etc.) after trimming whitespace/newlines."
  }
}

# variable "public_ip" {
#     type = string  
# }
variable "ssh_private_key_path" {
  default = "~/.ssh/id_ed25519"
  type = string
}

variable "projectname" {
  type = string
}