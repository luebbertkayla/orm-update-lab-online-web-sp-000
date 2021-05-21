require_relative "../config/environment.rb"

class Student

  attr_accessor :name, :grade, :id
  
  def initialize(name, grade, id = nil)
    @name = name 
    @grade = grade
    @id = nil 
  end 
  
  def self.create_table 
    sql = <<-SQL
      CREATE TABLE IF NOT EXISTS students (
        id INTEGER PRIMARY KEY,
        name TEXT, 
        grade INTEGER
        )
      SQL
    DB[:conn].execute(sql)
  end 

  def self.drop_table
    sql = "DROP TABLE IF EXISTS students"
    DB[:conn].execute(sql)
  end 
  
  def save 
    sql = <<-SQL
      INSERT INTO students 
      VALUES (?, ?)
    SQL
    
    DB[:conn].execute(sql, self.name, self.grade)
    @id = DB[:conn].excute("SELECT LAST INSERT ROW ID")
  end 
      

end
