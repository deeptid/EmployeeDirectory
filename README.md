# EmployeeDirectory

This project is built using the Ruby on Rails web framework.

* First clone this repository.

   ```bash
   $ git clone https://github.com/deeptid/EmployeeDirectory.git
   $ cd EmployeeDirectory
   ```

* Install the dependencies.

   ```bash
   $ bundle install
   ```

* Create the database and run migrations.
   ```bash
   $ rake db:create
   $ rake db:migrate
   ```

* Initialize db: It'll fetch json data from uri and store it in db
   ```bash
   $ rake rake_employees:index
   ```


* Start the server.

   ```bash
   $ rails s
   ```

Open any browser and visit http://localhost:3000. You can see the welcome page





