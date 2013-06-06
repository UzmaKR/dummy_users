class Url < ActiveRecord::Base
  # Remember to create a migration!
  before_save :generate_short_url, unless: :id
  validates_presence_of :url
  validates_format_of :url, :with => URI::regexp
  belongs_to :user
  
  def generate_short_url 
    unique_string = (0..1).map {(rand(26) + 65).chr + "#{rand(26)}"}.join 
    self.short_url = unique_string
  end


end
