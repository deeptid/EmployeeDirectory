json.extract! employee, :id, :employee_id, :preferred_name, :title, :work_phone, :personal_email, :date_of_birth, :department_url, :employee_type, :status, :subordinates_url, :photo_thumbnail_url, :personal_phone, :work_email, :gender, :manager, :created_at, :updated_at
json.url employee_url(employee, format: :json)
