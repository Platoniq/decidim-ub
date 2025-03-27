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
      "/app/views/decidim/account/show.html.erb" => "a0647f1740d696018f73ec8db8c7587a",
      # lib
      "/lib/decidim/amendable.rb" => "62ea0c200eec2ac8cbc41fbb785c2bd8",
      # models
      "/app/models/decidim/amendment.rb" => "a49c2328f9f612150ce15fd627066996",
      # commands
      "/app/commands/decidim/update_account.rb" => "363872116fb99372c046b7394d618333"
    }
  },
  {
    package: "decidim-proposals",
    files: {
      # views
      "/app/views/decidim/proposals/admin/proposals/index.html.erb" => "0022a47b73b6274a2e1f9e90e322eb6b",
      "/app/views/decidim/proposals/admin/proposals/_proposal-tr.html.erb" => "cb5926ce45a6e8b0d676bb2392bb84f7"
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
