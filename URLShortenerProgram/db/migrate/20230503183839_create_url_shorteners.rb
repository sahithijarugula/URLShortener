class CreateUrlShorteners < ActiveRecord::Migration[7.0]
  def change
    create_table :url_shorteners do |t|
      t.string :long
      t.string :short

      t.timestamps
    end
  end
end
