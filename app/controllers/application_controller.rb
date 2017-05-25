class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :ensure_success
  
 


  def ensure_success
  	if session[:is_db_initialized] == nil
       # init_employee_db
       session[:is_db_initialized] = true  
       Thread.start {init_employee_db}
    end
  end


  def init_employee_db
      base_uri = Rails.application.secrets.base_uri
      auth = Rails.application.secrets.auth
      r = HTTParty.get base_uri + '/core/companies/131592/people', headers: { "Authorization" => auth} 
      # v = JSON.parse(r)
      json = JSON.parse(r.body)
      data = json['data']
      #As I have removed Admin from the list
      # if Employee.count !=  data['data'].length - 1 
          if json['status'] == 200
             Employee.delete_all

          	 puts data['data'].length
          	 data['data'].each do |v|

              if v['type'] == "admin"
                is_admin = true
                params[:admin_email] = v['work_email']
              else
                is_admin = false
              end
          	 
              if !is_admin
     
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
              	
                 	manager = v['manager']
              	 	unless manager['url'].nil?
              	 		manager_detail = HTTParty.get manager['url'], headers: { "Authorization" => auth}
              	 	    manager_name = manager_detail['data']
              	 	else
              	 		manager_name = ""
              	 	end

              	 	company = v['company']
              	 	
                  salary = ""
                  employment = v['employments']
                  unless employment['url'].nil?
                      employment_detail = HTTParty.get employment['url'], headers: { "Authorization" => auth}
                      if employment_detail['status'] == 200    
                          employments_data = employment_detail['data']
                          employment = employments_data['data']
                          unless  employment.first['annual_salary'].nil?
                            salary = employment.first['annual_salary']
                          end
                      end
                  end
                  
                  location_name = ""
                  location = v['location']
                  unless location['url'].nil?
                      location_detail = HTTParty.get location['url'], headers: { "Authorization" => auth}
                      location_data = location_detail['data'] 
                      unless location_data['name'].nil?
                        location_name = location_data['name']
                      end
                  end

             
                  Employee.create(employee_id: v['id'], 
                                  first_name: v['first_name'], 
                                  last_name: v['last_name'], 
                                  preferred_name: v['preferred_name'] , 
                                  title: v['title'], 
                                  work_phone: v['work_phone'] , 
                                  personal_email: v['personal_email'], 
                                  date_of_birth: v['date_of_birth'], 
                                  department_url: dep_name['name'], 
                                  employee_type: v['type'], 
                                  status: v['status'], 
                                  subordinates_url: sub_name['name'], 
                                  photo_thumbnail_url: v['photo_thumbnail_url'], 
                                  personal_phone: v['personal_phone'], 
                                  work_email: v['work_email'], 
                                  gender: v['gender'], 
                                  manager: "#{manager_name['first_name']} #{manager_name['last_name']}", 
                                  salary: salary, 
                                  location: location_name)
                end
              end #end of each employee
            end #end of if
          # end
  end # end of method
end
