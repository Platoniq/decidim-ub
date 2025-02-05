class AddCounterCacheAmendmentsToProposals < ActiveRecord::Migration[6.1]
  def change
    add_column :decidim_proposals_proposals, :amendments_count, :integer, null: false, default: 0
    add_index :decidim_proposals_proposals, :amendments_count, name: "idx_decidim_proposals_proposals_on_amendments_count"
  end
end
