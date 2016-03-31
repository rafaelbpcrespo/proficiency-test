class CourseStatus < EnumerateIt::Base

  associate_values(
    closed: 0,
    opened: 1
  )

end