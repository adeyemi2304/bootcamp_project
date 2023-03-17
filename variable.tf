variable "region" {

  description = "Region of Cloud Resources "
  type        = map(string)
  default = {
    "1" = "us-east-1"
    "2" = "us-east-2"
  }
}