class StaticPagesController < ApplicationController
  def home
    connection = PexelsApiClient.new
    if params[:id]
      @collection = connection.collection(params[:id])
      if @collection.success?
        @photos = @collection["media"].map do |photo|
          photo["src"]["medium"]
        end
      else
        @photos = []
      end
    end
  end
end
