# frozen_string_literal: true

require "rails_helper"

# We make sure that the checksum of the file overridden is the same
# as the expected. If this test fails, it means that the overridden
# file should be updated to match any change/bug fix introduced in the core
checksums = [
  {
    package: "decidim-core",
    files: {
      # views
      "/app/views/layouts/decidim/footer/_mini.html.erb" => "ccead2f5f20557ea4db1501de943f82b",
      "/app/views/decidim/account/show.html.erb" => "f13218e2358a2d611996c2a197c0de25",
      # lib
      "/lib/decidim/amendable.rb" => "7db81cc2b9c12cc0d95a4ec481d2100f",
      # models
      "/app/models/decidim/amendment.rb" => "a49c2328f9f612150ce15fd627066996",
      # commands
      "/app/commands/decidim/update_account.rb" => "d24090fdd9358c38e6e15c4607a78e18"
    }
  },
  {
    package: "decidim-proposals",
    files: {
      # views
      "/app/views/decidim/proposals/admin/proposals/index.html.erb" => "159af4c2fa3d759909a647796f474d6c",
      "/app/views/decidim/proposals/admin/proposals/_proposal-tr.html.erb" => "057ee4242479109023a5904c8de55222"
    }
  }
]

describe "Overridden files", type: :view do
  checksums.each do |item|
    spec = Gem::Specification.find_by_name(item[:package])
    item[:files].each do |file, signature|
      next unless spec

      it "#{spec.gem_dir}#{file} matches checksum" do
        expect(md5("#{spec.gem_dir}#{file}")).to eq(signature)
      end
    end
  end

  private

  def md5(file)
    Digest::MD5.hexdigest(File.read(file))
  end
end
