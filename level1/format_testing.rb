/Testing formatting /

module Zoom
  class ApiService
    def get(method)
      url = base_url + method
      response = RestClient.get(url, authorization_header)
      JSON.parse(response)
    end

    def post(method, payload = {})
      url = base_url + method
      headers = authorization_header.merge(content_type: :json)
      RestClient.post(url, payload.to_json, headers)
    end
  end
end
