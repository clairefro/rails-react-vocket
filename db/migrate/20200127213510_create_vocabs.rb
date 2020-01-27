class CreateVocabs < ActiveRecord::Migration[6.0]
  def change
    create_table :vocabs do |t|
      t.string :french
      t.string :english
      t.boolean :starred

      t.timestamps
    end
  end
end
