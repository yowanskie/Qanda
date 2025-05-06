class CreateQuestions < ActiveRecord::Migration[8.0]
  def change
    create_table :questions do |t|
      t.string :title
      t.text :body
      t.references :user, null: false, foreign_key: true
      t.integer :upvotes

      t.timestamps
    end
  end
end
