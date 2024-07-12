# frozen_string_literal: true

every 1.day, at: "1:30 am" do
  rake "db:sessions:trim"
end
