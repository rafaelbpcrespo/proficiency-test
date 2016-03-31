class StudentStatus < EnumerateIt::Base

  associate_values(
    active: 1,
    inactive: 0
  )

end