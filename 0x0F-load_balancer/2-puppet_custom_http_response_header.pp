# Install Nginx and configure a custom header X-Served-By with the hostname

package { 'nginx':
  ensure => installed,
}

service { 'nginx':
  ensure     => running,
  enable     => true,
  require    => Package['nginx'],
}

# Update the Nginx configuration file to add the custom header
file { '/etc/nginx/sites-available/default':
  ensure  => file,
  content => @(EOF),
server {
    listen 80 default_server;
    listen [::]:80 default_server;

    root /var/www/html;
    index index.html;

    location / {
        add_header X-Served-By \$hostname;
    }
}
  | EOF
  notify  => Service['nginx'],
  require => Package['nginx'],
}

