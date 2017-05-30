namespace :rake_employees do
  desc "Save json employees data to db"
  task :index => :environment do
    Employee.init_employee_db
  end
end