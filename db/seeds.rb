# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

    5.times do |index|
      Course.create(name: "Curso #{index}", description: "Descrição do Curso #{index}", status: 1)
    end

    15.times do |index|
      Student.create(name: "Estudante #{index}", register_number: "#{index}", status: 1)
    end

    Student.all.each do |student|
      Course.all.each do |course|
        Classroom.create(student: student, course: course)
      end
    end
