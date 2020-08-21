class Link < ApplicationRecord
  validates :original_url, presence: true
  before_create :generate_short_url, :sanitize

  def generate_short_url
    rand(36**8).to_s(36)
  end

  def sanitize
    original_url.strip!
    sanitize_url = self.original_url.downcase.gsub(/(https?:\/\/)|(www\.)/,"")
    "http://#{sanitize_url}"
  end

end

