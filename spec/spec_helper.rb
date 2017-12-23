require 'bundler/setup'
require 'rsyslibs'
require 'json'

def project_packages
  [double(name: 'gem1'), double(name: 'gem2'), double(name: 'gem3')]
end

def success_syslibs
  double(code: 200, body:
          [
            { 'id' => 6, 'name' => 'libmysql-ruby', 'version' => nil, 'os' => 'darwin16',
              'os_bits' => 64, 'os_vendor' => 'apple',
              'project_dependencies' => [{ 'id' => 4, 'name' => 'mysql2', 'version' => '0.4.10',
              'github_url' => 'https://github.com/brianmario/mysql2', 'website' => nil, 'owner_name' => nil }]
            }
          ]
        )
end

def failure_syslibs
  double(code: 500, body: 'Internal server error')
end

RSpec.configure do |config|
  # Enable flags like --only-failures and --next-failure
  config.example_status_persistence_file_path = '.rspec_status'

  # Disable RSpec exposing methods globally on `Module` and `main`
  config.disable_monkey_patching!

  config.expect_with :rspec do |c|
    c.syntax = :expect
  end
end
