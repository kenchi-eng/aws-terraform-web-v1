#!/bin/bash
set -euxo pipefail

dnf install -y httpd
systemctl enable --now httpd

cat <<'EOF' > /var/www/html/index.html
<!DOCTYPE html>
<html lang="ja">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>AWS Portfolio</title>
</head>
<body>
  <h1>AWS Portfolio Web Server</h1>
  <p>Deployed on Amazon EC2 with Terraform.</p>
</body>
</html>
EOF
