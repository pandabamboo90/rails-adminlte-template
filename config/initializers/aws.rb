require "dynamoid"
Dynamoid.configure do |config|
  config.access_key = "DUMMYIDEXAMPLE"
  config.secret_key = "DUMMYEXAMPLEKEY"
  config.region = "eu-west-1"

  # To namespace tables created by Dynamoid from other tables you might have.
  # Set to nil to avoid namespacing.
  config.namespace = nil

  # [Optional]. If provided, it communicates with the DB listening at the endpoint.
  # This is useful for testing with [DynamoDB Local] (http://docs.aws.amazon.com/amazondynamodb/latest/developerguide/Tools.DynamoDBLocal.html).
  config.endpoint = "http://dynamodb-local:8000"
end
