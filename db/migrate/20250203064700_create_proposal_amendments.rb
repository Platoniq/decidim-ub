# frozen_string_literal: true

class CreateProposalAmendments < ActiveRecord::Migration[5.0]
    def change
      create_table :decidim_proposals_proposal_amendments do |t|
        t.references :decidim_proposal, null: false, index: { name: "decidim_proposals_proposal_amendment_proposal" }
  
        t.timestamps
      end
    end
  end