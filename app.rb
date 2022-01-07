# frozen_string_literal: true

require 'dotenv/load'
require 'base64'
require 'faraday'
require 'json'

API_ENDPOINT = 'https://api.track.toggl.com/reports/api/v2'
USER_AGENT = 'toggl-sync-status-check (https://github.com/ytkg/toggl-sync-status-check)'

url = "#{API_ENDPOINT}/summary"
params = {
  user_agent: USER_AGENT,
  workspace_id: ENV['TOGGL_WORKSPACE_ID'],
  since: Date.today - 2,
  until: Date.today
}
headers = { 'Authorization' => "Basic #{Base64.encode64("#{ENV['TOGGL_API_TOKEN']}:api_token")}" }
response = Faraday.get(url, params, headers)

raise 'No data.' if JSON.parse(response.body, symbolize_names: true)[:data].empty?

p :ok
