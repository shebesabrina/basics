require "rails_helper"

describe "user sees all students" do
  describe "they visit /students" do
    it "displays all students" do

      student_1 = Student.create!(name: 'Ian')
      student_2 = Student.create!(name: 'Dione')

      visit students_path

      expect(current_path).to eq(students_path)
      # save_and_open_page
      expect(current_path).to have_content(student_1.name)
      expect(current_path).to have_content(student_2.name)
    end
  end
end
