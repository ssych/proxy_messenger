require 'sidekiq/api'

Sidekiq.default_worker_options = { retry: 0, backtrace: true }
