# frozen_string_literal: true

Rails.application.configure do
  config.good_job.preserve_job_records = true
  config.good_job.cleanup_discarded_jobs = false
end
