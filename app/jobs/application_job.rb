class ApplicationJob < ActiveJob::Base
 queue_as :proxy_messenger
end
