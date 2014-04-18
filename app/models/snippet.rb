class Snippet < ActiveRecord::Base
  belongs_to :page
  attr_accessible :name, :options, :page_id, :gsub_hook

end
