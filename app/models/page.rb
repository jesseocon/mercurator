class Page < ActiveRecord::Base
  has_many :snippets
  attr_accessible :name, :content
  
  PARM_MAP =  {
    :content =>  {
      :primary => {
        :value => :content
      }
    },
    :name => :name
  }

  ALLOWABLE_PARAMS = [
    :content, 
    :name
  ]
  


  def self.sanitize_params(params)
    params = params.slice(*ALLOWABLE_PARAMS)

  end

  def map_keys(params) 
    hash = {}
    params.each do |key, value|
      ALLOWABLE_PARAMS.include?(key)
    end
  end


end
