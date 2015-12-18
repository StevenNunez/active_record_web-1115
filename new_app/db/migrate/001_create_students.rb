class CreateStudents < ActiveRecord::Migration
  def change
    create_table :students do |t|
      t.string :name
      t.string :hobby
      t.string :favorite_ruby_method
    end
  end
end
