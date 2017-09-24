class Student
  attr_accessor :name, :grade
  attr_reader :id
  # Remember, you can access your database connection anywhere in this class
  #  with DB[:conn]

  def initialize

  end

  def self.create_table
    sql = <<-SQL
    CREATE TABLE IF NOT EXISTS students (
    id INTEGER PRIMARY KEY,
    name TEXT,
    grade INTEGER
    )
    SQL

    db[:conn].execture(sql)
  end

  def self.drop_table
    sql = <<-SQL
    DROP TABLE students
    SQL

    db[:conn].execture(sql)
  end

  def save(name:, grade:)
    sql = <<-SQL
    INSERT INTO students(name, grade)
    VALUES (?, ?)
    SQL

    db[:conn].execture(sql, name, grade)
  end


end
