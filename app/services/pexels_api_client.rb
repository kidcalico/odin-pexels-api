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

  def search(search_term)
    @options[:query] = { query: search_term, per_page: 5 }
    self.class.get("/v1/search", @options)
  end
end
