class CreateEvents < ActiveRecord::Migration[5.1]
  def change
    create_table :events, id: :uuid do |t|
      t.belongs_to :webhook, type: :uuid
      t.belongs_to :handler, type: :uuid
      t.json :payload
      t.timestamps
    end
  end
end
