# frozen_string_literal: true

# This migration comes from decidim (originally 20201010224433)
# This file has been modified by `decidim upgrade:migrations` task on 2026-03-12 14:10:30 UTC
class AddSuspensionFieldsToDecidimUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :decidim_users, :suspended, :boolean, default: false, null: false
    add_column :decidim_users, :suspended_at, :datetime
  end
end
