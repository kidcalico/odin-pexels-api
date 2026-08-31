class StaticPagesController < ApplicationController
  def home
    connection = PexelsApiClient.new
    @collection = connection.collection(params[:id])
    @photos = @collection["media"].map do |photo|
      photo["src"]["medium"]
    end
  end
end
