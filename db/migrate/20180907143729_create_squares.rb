class CreateSquares < ActiveRecord::Migration[5.2]
  def change
    create_table :squares do |t|
      t.references :color, foreign_key: true
      t.references :user, foreign_key: true
      t.string :username

      t.timestamps
    end

    400.times do
      Square.new.save(validate: false)
    end
  end
end
