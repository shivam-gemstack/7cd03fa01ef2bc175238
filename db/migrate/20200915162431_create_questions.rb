class CreateQuestions < ActiveRecord::Migration[6.0]
  def change
    create_table :questions do |t|
    	t.string :name
    	t.integer :topic_id
    	t.integer :user_id
      t.timestamps
    end
  end
end
