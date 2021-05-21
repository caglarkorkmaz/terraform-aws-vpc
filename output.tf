output region {
    value = var.region
}
output "AZ" {
    value = data.aws_availability_zones.available.names
}

output "vpc" {
    value = aws_vpc.main.id
}
output "public_subnets" {
    value = [
        aws_subnet.public_subnet1.id,
        aws_subnet.public_subnet2.id,
        aws_subnet.public_subnet3.id,
    ]
}
output "private_subnets" {
    value = [
        aws_subnet.private_subnet1.id,
        aws_subnet.private_subnet2.id,
        aws_subnet.private_subnet3.id,
    ]
}