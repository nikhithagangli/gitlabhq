FactoryGirl.define do
  factory :file_uploader do
    project
    secret nil

    transient do
      fixture { 'rails_sample.jpg' }
      path { File.join(Rails.root, 'spec/fixtures', fixture) }
      file { Rack::Test::UploadedFile.new(path) }
    end

    after(:build) do |uploader, evaluator|
      uploader.store!(evaluator.file)
    end

    initialize_with do
      new(project, secret)
    end
  end
end
