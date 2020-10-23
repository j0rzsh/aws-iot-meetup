### IoT Thing ###
output "poc_iot_certificate_arn_sensor" {
  value     = module.sensor.*.iot_certificate_arn
  sensitive = true
}
output "poc_iot_certificate_pem_sensor" {
  value     = module.sensor.*.iot_certificate_pem
  sensitive = true
}
output "poc_iot_certificate_public_key_sensor" {
  value     = module.sensor.*.iot_certificate_public_key
  sensitive = true
}
output "poc_iot_certificate_private_key_sensor" {
  value     = module.sensor.*.iot_certificate_private_key
  sensitive = true
}
