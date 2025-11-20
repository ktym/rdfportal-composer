# Number of worker processes
workers 2

# Number of threads per worker
threads_count = ENV.fetch("RAILS_MAX_THREADS") { 5 }
threads threads_count, threads_count

APP_BIND = ENV.fetch("RDFPORTAL_COMPOSER_BIND", "0.0.0.0")   # REST bind
APP_PORT = Integer(ENV.fetch("RDFPORTAL_COMPOSER_PORT", 8080))

# Port to listen on
bind "tcp://0.0.0.0:#{APP_PORT}"

# Timeout for worker processes
worker_timeout 3600

# Logging
stdout_redirect 'puma.log', 'puma.err', true

# Preload application
preload_app!

# PID file for process management
pidfile 'puma.pid'

# State file for restarts
state_path 'puma.state'

