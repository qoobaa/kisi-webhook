class CreateEvents < ActiveRecord::Migration[5.1]
  def change
    create_table :events, id: :uuid do |t|
      t.belongs_to :webhook
      t.belongs_to :handler
      t.json :payload
      t.timestamps
    end
  end
end
