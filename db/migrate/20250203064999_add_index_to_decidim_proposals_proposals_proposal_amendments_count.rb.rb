# frozen_string_literal: true

class AddIndexToDecidimProposalsProposalsProposalAmendmentsCount < ActiveRecord::Migration[5.0]
  def change
    add_index :decidim_proposals_proposals, :proposal_amendments_count
    add_index :decidim_proposals_proposals, :state
  end
end