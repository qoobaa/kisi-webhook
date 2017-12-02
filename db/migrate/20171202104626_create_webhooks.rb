class CreateWebhooks < ActiveRecord::Migration[5.1]
  def change
    create_table :webhooks, id: :uuid do |t|
      t.timestamps
    end
  end
end
