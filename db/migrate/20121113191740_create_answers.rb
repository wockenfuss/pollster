class CreateAnswers < ActiveRecord::Migration
  def change
    create_table :answers do |t|
      t.text :answer, :unique => true
      t.belongs_to :question
      t.timestamps
    end
  end
end
