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
      "/app/views/decidim/account/show.html.erb" => "f13218e2358a2d611996c2a197c0de25",
      # lib
      "/lib/decidim/amendable.rb" => "d99bba17a759557e146711191e80db9e",
      # models
      "/app/models/decidim/amendment.rb" => "a49c2328f9f612150ce15fd627066996",
      # commands
      "/app/commands/decidim/update_account.rb" => "f6c1fbdfd2e2c38bd9b6a43b335df975",
      # cells
      "/app/cells/decidim/diff_cell.rb" => "30c499b4b3eed47aae0cf69318842533"
    }
  },
  {
    package: "decidim-proposals",
    files: {
      # views
      "/app/views/decidim/proposals/admin/proposals/_proposals-thead.html.erb" => "b455b9302388011e6ee190478e3bd430",
      "/app/views/decidim/proposals/admin/proposals/_proposal-tr.html.erb" => "4fdf708691596e6e52a6aa427303b0a6"
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
