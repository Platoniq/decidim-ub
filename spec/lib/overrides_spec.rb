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
      "/app/views/layouts/decidim/footer/_mini.html.erb" => "c67cc97db27cdcf926f60682e399f688",
      "/app/views/decidim/account/show.html.erb" => "1c230c5c6bc02e0bb22e1ea92b0da96c",
      # lib
      "/lib/decidim/amendable.rb" => "51b3c86026f806b444b604fd1881a00e",
      # models
      "/app/models/decidim/amendment.rb" => "3c8133bb6800312aab3f06c46eceaeb6",
      # commands
      "/app/commands/decidim/update_account.rb" => "2c4f0e5a693b4b46a8e39e12dd9ecb2a",
      # cells
      "/app/cells/decidim/diff_cell.rb" => "30c499b4b3eed47aae0cf69318842533"
    }
  },
  {
    package: "decidim-proposals",
    files: {
      # views
      "/app/views/decidim/proposals/admin/proposals/_proposals-thead.html.erb" => "24c74e018ea4ac719652dd4c5acd4a29",
      "/app/views/decidim/proposals/admin/proposals/_proposal-tr.html.erb" => "608af89f7bfa800fe2e3c853f8e2ace0"
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
