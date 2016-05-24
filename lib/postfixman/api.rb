module Openfire
  class Api
    def initialize(endpoint_url, access_token)
      @endpoint_url = endpoint_url
      @access_token = access_token
    end

    def get_domains
      request = web_request('GET', '/domains', { }, default_headers)
      request[:body].map { |x| Openfire::Domain.new(x) }
    end

    def get_users(domain_id)
      request = web_request('GET', "/domains/#{domain_id}/users", { }, default_headers)
      request[:body].map { |x| Openfire::User.new(x) }
    end

    def create_user(params)
      request = web_request('POST', '/users', params, default_headers)
      Openfire::User.new(request[:body])
    end

    def update_user(user_id, params)
      request = web_request('PUT', "/users/#{user_id}", params, default_headers)
      Openfire::User.new(request[:body])
    end

    def delete_user(user_id)
      request = web_request('DELETE', "/users/#{user_id}", params, default_headers)
      request[:body]['success'] == true
    end

    def get_aliases(domain_id)
      request = web_request('GET', "/domains/#{domain_id}/aliases", { }, default_headers)
      request[:body].map { |x| Openfire::Alias.new(x) }
    end

    def create_alias(params)
      request = web_request('POST', '/aliases', params, default_headers)
      Openfire::User.new(request[:body])
    end

    def update_alias(alias_id, params)
      request = web_request('PUT', "/aliases/#{user_id}", params, default_headers)
      Openfire::User.new(request[:body])
    end

    def delete_alias(alias_id)
      request = web_request('DELETE', "/aliases/#{user_id}", params, default_headers)
      request[:body]['success'] == true
    end

    def get_recipient_bccs
      request = web_request('GET', "/domains/#{domain_id}/recipient_bccs", { }, default_headers)
      request[:body].map { |x| Openfire::RecipientBcc.new(x) }
    end

    def create_recipient_bccs(params)
      request = web_request('POST', '/recipient_bccs', params, default_headers)
      Openfire::User.new(request[:body])
    end

    def update_sender_bccs(sender_bcc_id, params)
      request = web_request('PUT', "/recipient_bccs/#{user_id}", params, default_headers)
      Openfire::User.new(request[:body])
    end

    def delete_recipient_bccs(sender_bcc_id)
      request = web_request('DELETE', "/recipient_bccs/#{user_id}", params, default_headers)
      request[:body]['success'] == true
    end

    def get_sender_bccs
      request = web_request('GET', "/domains/#{domain_id}/sender_bccs", { }, default_headers)
      request[:body].map { |x| Openfire::SenderBcc.new(x) }
    end

    def create_sender_bccs(params)
      request = web_request('POST', '/sender_bccs', params, default_headers)
      Openfire::User.new(request[:body])
    end

    def update_sender_bccs(sender_bcc_id)
      request = web_request('PUT', "/sender_bccs/#{user_id}", params, default_headers)
      Openfire::User.new(request[:body])
    end

    def delete_sender_bccs(sender_bcc_id)
      request = web_request('DELETE', "/sender_bccs/#{user_id}", params, default_headers)
      request[:body]['success'] == true
    end

    def get_user(username)
      request = web_request('GET', "/users/#{username}", { }, default_headers)
      Openfire::User.new(request[:body])
    end

    def create_user(user_data={})
      request = web_request('POST', '/users', user_data.to_json, default_headers)
      (request[:status_code] == 201)
    end

    def update_user(username, user_data={})
      request = web_request('PUT', "/users/#{username}", user_data.to_json, default_headers)
      (request[:status_code] == 200)
    end

    def delete_user(username)
      request = web_request('DELETE', "/users/#{username}", { }, default_headers)
      (request[:status_code] == 200)
    end

    def lock_user(username)
      request = web_request('POST', "/lockouts/#{username}", { }, default_headers)
      (request[:status_code] == 200)
    end

    def unlock_user(username)
      request = web_request('DELETE', "/lockouts/#{username}", { }, default_headers)
      (request[:status_code] == 200)
    end

    def get_user_groups(username)
      request = web_request('GET', "/users/#{username}/groups", { }, default_headers)
      body = request[:body]['groupname']

      body.is_a?(Array) ? body : [body]
    end

    def add_user_to_group(username, groupname)
      request = web_request('POST', "/users/#{username}/groups/#{groupname}", { }, default_headers)

      (request[:status_code] == 201)
    end

    def add_user_to_groups(username, groupnames)
      payload = { groupname: groupnames }.to_json

      request = web_request('POST', "/users/#{username}/groups", payload, default_headers)

      (request[:status_code] == 201)
    end

    def delete_user_from_group(username, groupname)
      request = web_request('DELETE', "/users/#{username}/groups/#{groupname}", { }, default_headers)

      (request[:status_code] == 200)
    end

    def delete_user_from_groups(username, groupnames)
      payload = { groupname: groupnames }.to_json

      request = web_request('DELETE', "/users/#{username}/groups", payload, default_headers)

      (request[:status_code] == 200)
    end

    def get_user_roster(username)
      raise 'not implemented'
    end

    def create_user_roster(username, roster_data={})
      raise 'not implemented'
    end

    def delete_user_roster(username, jid)
      raise 'not implemented'
    end

    def update_user_roster(username, jid, roster_data={})
      raise 'not implemented'
    end

    def get_chatrooms
      raise 'not implemented'
    end

    def get_chatroom(room_name)
      raise 'not implemented'
    end

    def get_chatroom_participants(room_name)
      raise 'not implemented'
    end

    def create_chatroom(room_data={})
      raise 'not implemented'
    end

    def delete_chatroom(room_name)
      raise 'not implemented'
    end

    def update_chatroom(room_name, room_data={})
      raise 'not implemented'
    end

    def add_user_to_chatroom(room_name, username_or_jid, role)
      raise 'not implemented'
    end

    def delete_user_from_chatroom(room_name, username_or_jid, role)
      raise 'not implemented'
    end

    def get_system_properties
      request = web_request('GET', '/system/properties', { }, default_headers)
      request[:body]['property'].map { |x| Openfire::SystemProperty.new(x) }
    end

    def get_system_property(property_name)
      request = web_request('GET', "/system/properties/#{property_name}", { }, default_headers)
      Openfire::SystemProperty.new(request[:body])
    end

    def create_system_property(property_name, value)
      payload = {
        '@key' => property_name,
        '@value' => value
      }.to_json

      request = web_request('POST', '/system/properties', payload, default_headers)
      (request[:status_code] == 201)
    end

    def delete_system_property(property_name)
      request = web_request('DELETE', "/system/properties/#{property_name}", { }, default_headers)
      (request[:status_code] == 200)
    end

    def update_system_property(property_name, value)
      payload = {
        '@key' => property_name,
        '@value' => value
      }.to_json

      request = web_request('PUT', "/system/properties/#{property_name}", payload, default_headers)
      (request[:status_code] == 200)
    end

    def get_concurrent_sessions_count
      request = web_request('GET', '/system/statistics/sessions', { }, default_headers)
      Openfire::SessionsCount.new(request[:body])
    end

    def get_groups
      request = web_request('GET', '/groups', { }, default_headers)
      request[:body]['group'].map { |x| Openfire::Group.new(x) }
    end

    def get_group(groupname)
      request = web_request('GET', "/groups/#{groupname}", { }, default_headers)
      Openfire::Group.new(request[:body])
    end

    def create_group(group_data)
      request = web_request('POST', '/groups', group_data.to_json, default_headers)
      (request[:status_code] == 201)
    end

    def update_group(groupname, group_data={})
      request = web_request('PUT', "/groups/#{groupname}", group_data.to_json, default_headers)
      (request[:status_code] == 200)
    end

    def delete_group(groupname)
      request = web_request('DELETE', "/groups/#{groupname}", { }, default_headers)
      (request[:status_code] == 200)
    end

    def get_sessions
      request = web_request('GET', '/sessions', { }, default_headers)
      data = request[:body]['session']

      if data.is_a?(Array)
        data.map { |x| Openfire::Session.new(x) }
      else
        [Openfire::Session.new(data)]
      end
    end

    def get_user_sessions(username)
      request = web_request('GET', "/sessions/#{username}", { }, default_headers)
      data = request[:body]['session']

      if data.is_a?(Array)
        data.map { |x| Openfire::Session.new(x) }
      else
        [Openfire::Session.new(data)]
      end
    end

    def close_user_sessions(username)
      request = web_request('DELETE', "/sessions/#{username}", { }, default_headers)
      (request[:status_code] == 200)
    end

    def send_broadcast_message(message_text)
      payload = { body: message_text }.to_json

      request = web_request('POST', '/messages/users', payload, default_headers)
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

