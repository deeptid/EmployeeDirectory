class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :ensure_success

  def ensure_success
  	if session[:is_db_initialized] == nil
  		init_employee_db
  		session[:is_db_initialized] = true
    end
  end

  def init_employee_db
      Employee.delete_all
      base_uri = Rails.application.secrets.base_uri
      auth = Rails.application.secrets.auth
      r = HTTParty.get base_uri + '/core/companies/131592/people', headers: { "Authorization" => auth} 
      # v = JSON.parse(r)
      json = JSON.parse(r.body)
      if json['status'] == 200
      	 data = json['data']
      	 puts data['data'].length
      	 data['data'].each do |v|
      	 	dep = v['department']
      	 	unless dep['url'].nil?
      	 		dep_url = HTTParty.get dep['url'], headers: { "Authorization" => auth} 
      	 		dep_name = dep_url['data']
      	 	else
      	 		dep_name = ""
      	 	end
      	 	sub = v['subordinates']
      	 	unless sub['url'].nil?
      	 		sub_url = HTTParty.get sub['url'], headers: { "Authorization" => auth} 
      	 		sub_name = sub_url['data']
      	 	else
      	 		sub_name = ""
      	 	end

      	 	man_url = v['manager']
      	 	unless man_url['url'].nil?
      	 		manager = HTTParty.get man_url['url'], headers: { "Authorization" => auth}
      	 	    manager_name = manager['data']
      	 	else
      	 		manager_name = ""
      	 	end
      	 	
      	 	company = v['company']
      	 	employments = v['employments']
      	 	Employee.create(employee_id: v['id'], first_name: v['first_name'], last_name: v['last_name'], preferred_name: v['preferred_name'] , work_phone: v['work_phone'] , personal_email: v['personal_email'], date_of_birth: v['date_of_birth'], department_url: dep_name['name'], employee_type: v['type'], status: v['status'], subordinates_url: sub_name['name'], photo_thumbnail_url: v['photo_thumbnail_url'], personal_phone: v['personal_phone'], work_email: v['work_email'], gender: v['gender'], manager: manager_name['name'])
      	 end	
      end
  end
end
