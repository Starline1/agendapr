class CreateContacts < ActiveRecord::Migration
  def change
    create_table :contacts do |t|
      t.string :nombre
      t.string :telefono
      t.string :direccion
      t.string :email

      t.timestamps null: false
    end
  end
end
