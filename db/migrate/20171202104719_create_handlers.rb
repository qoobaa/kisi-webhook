class CreateHandlers < ActiveRecord::Migration[5.1]
  def change
    create_table :handlers, id: :uuid do |t|
      t.belongs_to :webhook, type: :uuid
      t.json :conditions
      t.string :recipient
      t.text :message
      t.string :name
      t.timestamps
    end
  end
end
