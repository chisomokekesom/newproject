provider "aws" {
 region = var.region 
 profile = "terraform"
}


module "vpc" {
    source =  "/Users/chisom/Documents/my_project/modules/vpc"
    region                        = var.region
    project_name                  = var.project_name
    vpc_cidr                      = var.vpc_cidr
    public-subnet-1-cidr        = var.public-subnet-1-cidr
    public-subnet-2-cidr        = var.public-subnet-2-cidr
    private-app-subnet-1-cidr   = var.private-app-subnet-1-cidr
    private-app-subnet-2-cidr   = var.private-app-subnet-2-cidr
    private-data-subnet-1-cidr  = var.private-data-subnet-1-cidr
    private-data-subnet-2-cidr  = var.private-data-subnet-2-cidr
    environment                 = var.environment

}



#create nat-gateway

module "nat-gateway" {
    source                     = "/Users/chisom/Documents/my_project/modules/nat-gateway"
    public_subnet_az1_id       = module.vpc.public_subnet_az1_id
    internet_gateway           = module.vpc.internet_gateway
    public_subnet_az2_id       = module.vpc.public_subnet_az2_id
    vpc_id                     = module.vpc.vpc_id
    private_app_subnet_az1_id  = module.vpc.private_app_subnet_az1_id
    private_data_subnet_az1_id = module.vpc.private_data_subnet_az1_id
    private_app_subnet_az2_id  = module.vpc.private_app_subnet_az2_id
    private_data_subnet_az2_id = module.vpc.private_data_subnet_az2_id


}
module "security-grooup" {
    source = "/Users/chisom/Documents/my_project/modules/security-group"
    vpc_id = module.vpc.vpc_id
}