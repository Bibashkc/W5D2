class CorrectSpellingDescription < ActiveRecord::Migration[5.2]
  def change
    rename_column :subs, :descripiton, :description
  end
end
