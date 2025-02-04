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

      def self.temporary
        where(temporary: true)
      end

      # Final amendments are amendments that will be taken into account, that is, they are
      # not temporary.
      def self.final
        where(temporary: false)
      end

      private

      def proposal_not_rejected
        return unless proposal

        errors.add(:proposal, :invalid) if proposal.rejected?
      end
    end
  end
end
