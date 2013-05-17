class AddColumnToPunchcards < ActiveRecord::Migration
  def change
    add_column :punchcards, :client, :string
  end
end
