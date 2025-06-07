// ************** VPC CIDR BLOCK **************** //

variable "vpc_cidr" {
    default     = "10.0.0.0/16"
    type        = string
}
// ****** PRESENTATION TIER CIDR BLOCK 1  ******* //

variable "public_web_subnet-1-cidr" {
    default     = "10.0.1.0/24"
    description = "public_web_subnet1"
    type        = string 
}
// ****** PRESENTATION TIER CIDR BLOCK 2  ******* //  

variable "public_web_subnet-2-cidr"{
    default     = "10.0.2.0/24"
    description = "public_web_subnet2"
    type        = string 
}
variable "privat_app_subnet-1-cidr" {
    default     = "10.0.3.0/24"
    description = "private_app_subnet1"
    type        = string
}
// *********** APP TIER CIDR BLOCK 2  *********** //

variable "private_app_subnet-2-cidr" {
    default     = "10.0.4.0/24"
    description = "public_web_subnet1"
    type        = string  
}
// ************** DB CIDR BLOCK 1  ************** //

variable "priavte_db_subnet-1-cidr" {
    default     = "10.0.5.0/24"
    description = "priavte_db_subnet1"
    type        = string   
}
// ************** DB CIDR BLOCK 2  ************** //

variable "private_db_subnet-2-cidr" {
    default     = "10.0.6.0/24"
    description = "priavte_db_subnet2"
    type        = string
}
// ********* APP TIER SECURITY GROUP  ********** //

variable "ssh_locate" {
    default     = "152.58.30.23/32" # your device IP + /32
    description = "ip_address"
    type        = string 
}
// ***************  DB INSTANCE  *************** //

variable "database_instance_class" {
    default     = "db.t3.micro"
    description = "The Database Instance Type"
    type        = string
}
// ****************  MULTI AZ  **************** //

variable "multi_az_deployment" {
    default     = false
    description = "Create a standby DB Instance"
    type        = bool
}