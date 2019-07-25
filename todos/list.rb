# frozen_string_literal: true

require 'aws-sdk-dynamodb'

def handler(event:, context:)
  client = Aws::DynamoDB::Client.new(endpoint: 'http://localhost:8000')
  resp = client.scan(table_name: ENV['DYNAMODB_TABLE'])

  puts resp.items

  { statusCode: 200, body: JSON.dump(resp.items) }
end
