# frozen_string_literal: true

module Decidim
  module AmendmentOverride
    extend ActiveSupport::Concern

    included do
      belongs_to :amendable, foreign_key: "decidim_amendable_id", foreign_type: "decidim_amendable_type", polymorphic: true, counter_cache: true
    end
  end
end
