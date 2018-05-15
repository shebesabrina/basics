require "rails_helper"

describe 'user sees one student' do
  describe 'they visit/student/:id' do
    it 'displays one student' do

      student = Student.create!(name: 'Ian')

      visit student_path(student)

      expect(page).to have_content(student.name)
    end
  end
end

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
