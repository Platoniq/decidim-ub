# frozen_string_literal: true

# This migration comes from decidim (originally 20200525184143)
# This file has been modified by `decidim upgrade:migrations` task on 2026-03-12 14:10:30 UTC
class AddEnableMachineTranslationToDecidimOrganizations < ActiveRecord::Migration[5.2]
  def change
    add_column :decidim_organizations, :enable_machine_translations, :boolean, default: false
  end
end
