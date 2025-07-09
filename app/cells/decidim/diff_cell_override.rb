# frozen_string_literal: true

module Decidim
  module DiffCellOverride
    extend ActiveSupport::Concern

    included do
      def unified_mode?
        @unified_mode ||= begin
          mode = params["diff-mode"]
          mode.nil? ? false : mode != "split" #
        end
      end

      def current_diff_mode
        params["diff-mode"] || "split"
      end

      def mode_options
        dropdown_options_for_select(%w(unified split), current_diff_mode)
      end
    end
  end
end
