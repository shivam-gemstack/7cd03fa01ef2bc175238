class CreateTopicFollowers < ActiveRecord::Migration[6.0]
  def change
    create_table :topic_followers do |t|
      t.references :user
      t.references :topic
      t.timestamps
    end
  end
end
