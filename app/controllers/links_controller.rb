class LinksController < ApplicationController
  def index
    @my_links = Link.all
    render json: @my_links
  end

  def create
    @link = Link.new(link_params)
    @link.short_url = 'http://localhost:3000/' + @link.generate_short_url
    @link.original_url = @link.sanitize
    @link.views_count = 1
    @link.save
  end

  def destroy
    @link = Links.find(params[:id])
    @link.destroy
  end

  def link_params
    params.require(:link).permit(:original_url)
  end
end
