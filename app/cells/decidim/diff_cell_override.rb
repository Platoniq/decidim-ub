# frozen_string_literal: true

# diff_cell_override.rb
module Decidim
  module DiffCellOverride
    extend ActiveSupport::Concern

    included do
      # Override the unified_mode? method to change default behavior
      def unified_mode?
        @unified_mode ||= begin
          mode = params["diff-mode"]
          mode.nil? ? false : mode != "split" # Default to false (split mode) when nil
        end
      end

      # Add your custom method
      def current_diff_mode
        params["diff-mode"] || "split" # Default to split instead of unified
      end

      # Override mode_options if you want to change the default selection
      def mode_options
        dropdown_options_for_select(%w(unified split), current_diff_mode)
      end
    end
  end
end
