# frozen_string_literal: true

require 'aws-sdk-dynamodb'

def handler(event:, context:)
  client = Aws::DynamoDB::Client.new(endpoint: 'http://localhost:8000')

  params = {
    table_name: ENV['DYNAMODB_TABLE'],
    item: {
      id: SecureRandom.uuid,
      text: event['body']
    }
  }
  resp = client.put_item(params)

  { statusCode: 200, body: JSON.dump(resp.attributes) }
end
