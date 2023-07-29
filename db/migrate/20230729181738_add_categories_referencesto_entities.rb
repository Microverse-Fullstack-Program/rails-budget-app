class AddCategoriesReferencestoEntities < ActiveRecord::Migration[7.0]
  def change
    add_reference :entities, :category, foreign_key: { to_table: :categories } do
    end
  end
end
