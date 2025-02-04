# frozen_string_literal: true

module Decidim
    module Proposals
      # A proposal can include many amendments
      class ProposalAmendment < ApplicationRecord
        belongs_to :proposal, foreign_key: "decidim_proposal_id", class_name: "Decidim::Proposals::Proposal"
        has_many :emendations, through: :proposals, source: :emendations
  
        validates :proposal, uniqueness: { scope: :author }
        validate :author_and_proposal_same_organization
        validate :proposal_not_rejected
  
        after_save :update_proposal_amendments_count
        after_destroy :update_proposal_amendments_count

        def self.temporary
          where(temporary: true)
        end
  
        # Final amendments are amendments that will be taken into account, that is, they are
        # not temporary.
        def self.final
          where(temporary: false)
        end
  
        private
  
        def update_proposal_amendments_count
          proposal.update_amendments_count
        end
  
        def proposal_not_rejected
          return unless proposal
  
          errors.add(:proposal, :invalid) if proposal.rejected?
        end
      end
    end
  end