
variable "projectcode" {
    default = "8675309"
}
data "http" "example" {
  url = "https://4rpwd825o5.execute-api.us-west-2.amazonaws.com/test/tdd_ddb_query"

  # Optional request headers
  request_headers {
    "accept" = "application/json"
    "querytext"  = "${terraform.workspace}-${var.projectcode}"
  }
}

output "response" {
    value = "${data.http.example.body.Subnets}"
}