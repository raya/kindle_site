class CreateEbooks < ActiveRecord::Migration
  def change
    create_table :ebooks do |t|
      t.string :location
      t.string :status

      t.timestamps
    end
  end
end
