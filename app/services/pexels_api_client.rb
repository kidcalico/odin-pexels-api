class PexelsApiClient
  include HTTParty
  base_uri "https://api.pexels.com/"

  def initialize
    @options = {
      headers: { "Authorization" => ENV["PEXELS_API_KEY"] }
    }
  end

  def collection(collection_id)
    self.class.get("/v1/collections/#{collection_id}", @options)
  end
end
