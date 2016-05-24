module Postfixman
  class Api
    def initialize(endpoint_url, access_token)
      @endpoint_url = endpoint_url
      @access_token = access_token
    end

    def get_domains
      request = web_request('GET', '/domains', { }, default_headers)
      request[:body].map { |x| Postfixman::Domain.new(x) }
    end

    def get_users(domain_id)
      request = web_request('GET', "/domains/#{domain_id}/users", { }, default_headers)
      request[:body].map { |x| Postfixman::User.new(x) }
    end

    def create_user(params)
      request = web_request('POST', '/users', params, default_headers)
      Postfixman::User.new(request[:body])
    end

    def update_user(user_id, params)
      request = web_request('PUT', "/users/#{user_id}", params, default_headers)
      Postfixman::User.new(request[:body])
    end

    def delete_user(user_id)
      request = web_request('DELETE', "/users/#{user_id}", params, default_headers)
      request[:body]['success'] == true
    end

    def get_aliases(domain_id)
      request = web_request('GET', "/domains/#{domain_id}/aliases", { }, default_headers)
      request[:body].map { |x| Postfixman::Alias.new(x) }
    end

    def create_alias(params)
      request = web_request('POST', '/aliases', params, default_headers)
      Postfixman::User.new(request[:body])
    end

    def update_alias(alias_id, params)
      request = web_request('PUT', "/aliases/#{user_id}", params, default_headers)
      Postfixman::User.new(request[:body])
    end

    def delete_alias(alias_id)
      request = web_request('DELETE', "/aliases/#{user_id}", params, default_headers)
      request[:body]['success'] == true
    end

    def get_recipient_bccs
      request = web_request('GET', "/domains/#{domain_id}/recipient_bccs", { }, default_headers)
      request[:body].map { |x| Postfixman::RecipientBcc.new(x) }
    end

    def create_recipient_bccs(params)
      request = web_request('POST', '/recipient_bccs', params, default_headers)
      Postfixman::User.new(request[:body])
    end

    def update_sender_bccs(sender_bcc_id, params)
      request = web_request('PUT', "/recipient_bccs/#{user_id}", params, default_headers)
      Postfixman::User.new(request[:body])
    end

    def delete_recipient_bccs(sender_bcc_id)
      request = web_request('DELETE', "/recipient_bccs/#{user_id}", params, default_headers)
      request[:body]['success'] == true
    end

    def get_sender_bccs
      request = web_request('GET', "/domains/#{domain_id}/sender_bccs", { }, default_headers)
      request[:body].map { |x| Postfixman::SenderBcc.new(x) }
    end

    def create_sender_bccs(params)
      request = web_request('POST', '/sender_bccs', params, default_headers)
      Postfixman::User.new(request[:body])
    end

    def update_sender_bccs(sender_bcc_id)
      request = web_request('PUT', "/sender_bccs/#{user_id}", params, default_headers)
      Postfixman::User.new(request[:body])
    end

    def delete_sender_bccs(sender_bcc_id)
      request = web_request('DELETE', "/sender_bccs/#{user_id}", params, default_headers)
      request[:body]['success'] == true
    end

    private

    def default_headers
      {
        content_type: :json,
        accept: :json,
        authorization: "Token token=\"#{@access_token}\""
      }
    end

    def web_request(uri_method, action, params={}, headers={})
      begin
        parse_response(RestClient::Request.execute({
          method: uri_method,
          url: "#{@endpoint_url}#{action}",
          payload: params,
          headers: headers
        }))
      rescue => e
        parse_response(e.response)
      end
    end

    def parse_response(response)
      result = {
        headers: response.headers,
        body: (JSON.parse(response.body) rescue response.body),
        status_code: response.code
      }

      result
    end
  end
end

