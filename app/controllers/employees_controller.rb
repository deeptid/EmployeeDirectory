class EmployeesController < ApplicationController
  before_action :set_employee, only: [:show, :edit, :update, :destroy]

  # GET /employees
  # GET /employees.json
  def index
      # @employees = Employee.all
      if params[:search] 
        @employees = Employee.search(params[:search]).order("created_at DESC").paginate(:per_page => 10, :page => params[:page])
      else
         @employees = Employee.all.paginate(:per_page => 10, :page => params[:page])
      end
      if(Admin.count > 0)
        params[:admin_email] = Admin.first.email
      end
  end

  # GET /employees/1
  # GET /employees/1.json
  def show
  end

  # GET /employees/new
  def new
      @employee = Employee.new
  end

  # GET /employees/1/edit
  def edit
  end

  # POST /employees
  # POST /employees.json
  def create
      @employee = Employee.new(employee_params)
      respond_to do |format|
          if @employee.save
            format.html { redirect_to @employee, notice: 'Employee was successfully created.' }
            format.json { render :show, status: :created, location: @employee }
          else
            format.html { render :new }
            format.json { render json: @employee.errors, status: :unprocessable_entity }
          end
      end
  end

  # PATCH/PUT /employees/1
  # PATCH/PUT /employees/1.json
  def update
      respond_to do |format|
          if @employee.update(employee_params)
            format.html { redirect_to @employee, notice: 'Employee was successfully updated.' }
            format.json { render :show, status: :ok, location: @employee }
          else
            format.html { render :edit }
            format.json { render json: @employee.errors, status: :unprocessable_entity }
          end
    end
  end

  # DELETE /employees/1
  # DELETE /employees/1.json
  def destroy
      @employee.destroy
      respond_to do |format|
        format.html { redirect_to employees_url, notice: 'Employee was successfully destroyed.' }
        format.json { head :no_content }
      end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_employee
        @employee = Employee.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def employee_params
        params.require(:employee).permit(:employee_id, 
                                         :first_name, 
                                         :last_name, 
                                         :preferred_name, 
                                         :title, 
                                         :work_phone, 
                                         :personal_email, 
                                         :date_of_birth, 
                                         :department_url, 
                                         :employee_type, 
                                         :status, 
                                         :subordinates_url, 
                                         :photo_thumbnail_url, 
                                         :personal_phone, 
                                         :work_email, 
                                         :gender, 
                                         :manager, 
                                         :salary, 
                                         :location)
    end
end
