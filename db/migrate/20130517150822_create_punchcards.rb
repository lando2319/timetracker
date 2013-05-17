class CreatePunchcards < ActiveRecord::Migration
  def change
    create_table :punchcards do |t|
      t.datetime :timein
      t.datetime :timeout

      t.timestamps
    end
  end
end
