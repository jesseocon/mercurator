class PagesController < ApplicationController
  def index
    
  end

  def new
    
  end

  def create
  end

  def edit

  end

  def update

  end

  def show
    @page = Page.find(params[:id])

    puts @page.content
    @snippets = @page.snippets
    snip_tag = @page.content.match(/\[snippet_.*\]/).to_a.collect { |x| x.gsub(/[\[|\]]/, '').split('/')[0] }
    puts "THESE ARE THE SNIP TAGS: #{snip_tag}"
  end

  def destroy

  end

  def mercury_update
    @page = Page.find(params[:id])
    @page.content = params[:content][:primary][:value]
    @composite_page = CompositePage.new(
      page: @page, fragments: params[:content][:primary][:snippets])
    puts @composite_page.inspect
    @composite_page.submit
    # @page.save! 
    render text: ''
  end
end
