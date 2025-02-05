# frozen_string_literal: true

module Decidim
  module Overrides
    module AmendableOverride
      extend ActiveSupport::Concern

      included do
        has_many :amendments,
                 as: :amendable,
                 foreign_key: "decidim_amendable_id",
                 foreign_type: "decidim_amendable_type",
                 class_name: "Decidim::Amendment",
                 counter_cache: "amendments_count"
      end
    end
  end
end
