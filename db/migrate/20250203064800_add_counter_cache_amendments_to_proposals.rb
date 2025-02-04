# frozen_string_literal: true

class AddCounterCacheAmendmentsToProposals < ActiveRecord::Migration[5.0]
  def change
    add_column :decidim_proposals_proposals, :proposal_amendments_count, :integer, null: false, default: 0
  end
end