class CreateQuestions < ActiveRecord::Migration
  def change
    create_table :questions do |t|
    	t.references :poll
      t.string :question, :unique => true
      t.timestamps
    end
  end
end
