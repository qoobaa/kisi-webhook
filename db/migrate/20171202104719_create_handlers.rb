class CreateHandlers < ActiveRecord::Migration[5.1]
  def change
    create_table :handlers, id: :uuid do |t|
      t.belongs_to :webhook
      t.json :conditions
      t.string :recipients, array: true
      t.text :message
      t.timestamps
    end
  end
end
