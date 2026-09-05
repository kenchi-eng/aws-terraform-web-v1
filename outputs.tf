output "web_public_ip" {
  description = "Public IPv4 address of the web server"
  value       = aws_instance.web.public_ip
}

output "web_url" {
  description = "HTTP URL of the portfolio web server"
  value       = "http://${aws_instance.web.public_ip}"
}
