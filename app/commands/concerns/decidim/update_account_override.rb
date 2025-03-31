# frozen_string_literal: true

module Decidim
  module UpdateAccountOverride
    extend ActiveSupport::Concern

    included do
      # Avoid edition of name and nickname fields
      def update_personal_data
        current_user.locale = @form.locale
        current_user.email = @form.email
        current_user.personal_url = @form.personal_url
        current_user.about = @form.about
      end
    end
  end
end
