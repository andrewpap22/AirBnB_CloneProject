class RenameSeasonToSeasonId < ActiveRecord::Migration
  def change
    rename_column :reviews, :reservations_id, :reservation_id
  end
end