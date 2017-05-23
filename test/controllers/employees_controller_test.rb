require 'test_helper'

class EmployeesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @employee = employees(:one)
  end

  test "should get index" do
    get employees_url
    assert_response :success
  end

  test "should get new" do
    get new_employee_url
    assert_response :success
  end

  test "should create employee" do
    assert_difference('Employee.count') do
      post employees_url, params: { employee: { date_of_birth: @employee.date_of_birth, department_url: @employee.department_url, employee_id: @employee.employee_id, employee_type: @employee.employee_type, gender: @employee.gender, manager: @employee.manager, personal_email: @employee.personal_email, personal_phone: @employee.personal_phone, photo_thumbnail_url: @employee.photo_thumbnail_url, preferred_name: @employee.preferred_name, status: @employee.status, subordinates_url: @employee.subordinates_url, title: @employee.title, work_email: @employee.work_email, work_phone: @employee.work_phone } }
    end

    assert_redirected_to employee_url(Employee.last)
  end

  test "should show employee" do
    get employee_url(@employee)
    assert_response :success
  end

  test "should get edit" do
    get edit_employee_url(@employee)
    assert_response :success
  end

  test "should update employee" do
    patch employee_url(@employee), params: { employee: { date_of_birth: @employee.date_of_birth, department_url: @employee.department_url, employee_id: @employee.employee_id, employee_type: @employee.employee_type, gender: @employee.gender, manager: @employee.manager, personal_email: @employee.personal_email, personal_phone: @employee.personal_phone, photo_thumbnail_url: @employee.photo_thumbnail_url, preferred_name: @employee.preferred_name, status: @employee.status, subordinates_url: @employee.subordinates_url, title: @employee.title, work_email: @employee.work_email, work_phone: @employee.work_phone } }
    assert_redirected_to employee_url(@employee)
  end

  test "should destroy employee" do
    assert_difference('Employee.count', -1) do
      delete employee_url(@employee)
    end

    assert_redirected_to employees_url
  end
end
