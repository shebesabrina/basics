require "rails_helper"

# As a user
# When I visit `/students/:id`
# I see the name of a student

describe 'user sees one student' do
  describe 'they visit/student/:id' do
    it 'displays one student' do

      student = Student.create!(name: 'Ian')

      visit student_path(student)

      expect(page).to have_content(student.name)
    end
  end
end

# As a user
# When I visit `/students`
# I see a list of student names

describe "user sees all students" do
  describe "they visit /students" do
    it "displays all students" do

      student_1 = Student.create!(name: 'Ian')
      student_2 = Student.create!(name: 'Dione')

      visit students_path

      expect(current_path).to eq(students_path)
      expect(current_path).to have_content(student_1.name)
      expect(current_path).to have_content(student_2.name)
    end
  end
end

# As a user
# When I visit `/students/new`
# And I fill in name
# And I click submit
# I am on the student show page
# And I see that student's name

describe 'when user visits /students/new' do
  describe 'they fill in a name and click submit' do
    describe 'user sees their name on student show page' do
      it "displays new student name" do
          student_1 = Student.create!(name: 'Ian')
          student_2 = Student.create!(name: 'Dione')

          new_name = 'Sabrina'

          visit new_student_path

          expect(current_path).to eq(new_student_path)

          fill_in 'student[name]', with: new_name

          click_on 'Create Student'

          expect(current_path).to eq(student_path)
          expect(page).to have_content(new_name)
          expect(page).to not_have_content(student_1.name)
          expect(page).to not_have_content(student_2.name)
      end
    end
  end
end
