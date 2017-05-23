class CreateEmployees < ActiveRecord::Migration[5.1]
  def change
    create_table :employees do |t|
      t.integer :employee_id
      t.string :preferred_name
      t.string :title
      t.string :work_phone
      t.string :personal_email
      t.string :date_of_birth
      t.string :department_url
      t.string :employee_type
      t.string :status
      t.string :subordinates_url
      t.string :photo_thumbnail_url
      t.string :personal_phone
      t.string :work_email
      t.string :gender
      t.string :manager

      t.timestamps
    end
  end
end
