# frozen_string_literal: true

Rails.application.config.to_prepare do
  Decidim::Amendable.include(Decidim::Overrides::AmendableOverride)
  Decidim::Amendment.include(Decidim::AmendmentOverride)
  Decidim::UpdateAccount.include(Decidim::UpdateAccountOverride)
end
