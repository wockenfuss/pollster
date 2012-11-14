class CreatePolls < ActiveRecord::Migration
  def change
    create_table :polls do |t|
      t.string :name
      t.string :admin_link, :uniqueness => true
      t.string :link, :uniqueness => true
      
      t.timestamps
    end
  end
end
