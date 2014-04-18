class CompositePage
  attr_accessor :page, :snippets, :fragments

  def initialize(attributes = {})
    @snippets ||= [] 
    attributes.each do |name, value|
      send("#{name}=", value)
    end
    self.push_snippets(attributes[:fragments])
  end
  
  def push_snippets(snippets)
    snippets.each do |snippet|
      hash = snippet[1]
      snipper =  Snippet.new(
        name: hash[:name],
        page_id: self.page.id,
        options: hash[:options],
        gsub_hook: snippet[0]
      ) 
      self.snippets << snipper
    end
  end

  def submit
    self.page.save!
    self.snippets.each do |snippet|
      snippet.save!
    end
  end
end
