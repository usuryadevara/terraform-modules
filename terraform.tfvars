env_type = "iac"
vpcid = "vpc-0d599274590dd068f"
### S3 Bucket Policies ###
epor_esmd_policy = "files/s3_bucket_policy/iac-epor-esmd-bucket_policy.json"
esmd_epor_policy = "files/s3_bucket_policy/iac-esmd-epor-bucket_policy.json"
esmd_payload_policy = "files/s3_bucket_policy/iac-esmd-payload-bucket_policy.json"
esmd_qurantine_policy = "files/s3_bucket_policy/iac-esmd-qurantine-bucket_policy.json"
## Security groups ##
dz_trusted_ip_subnets = ["10.0.101.0/24", "10.0.102.0/24"]
az_trusted_ip_subnets = ["10.0.101.0/24", "10.0.102.0/24"]
pz_trusted_ip_subnets = ["10.0.101.0/24", "10.0.102.0/24"]
greenfield_epor_az1_az2 = ["10.0.101.0/24", "10.0.102.0/24"]
greenfield_epor_az3 = ["10.0.101.0/24"]
greenfield_legacy = ["10.0.102.0/24"]
vpc_cidr1_2 = ["10.0.101.0/24", "10.0.102.0/24"]