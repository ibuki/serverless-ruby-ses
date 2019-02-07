# frozen_string_literal: true

require 'json'
require 'aws-sdk'

def mail(event:, context:)
  ses = Aws::SES::Client.new
  ses.send_email(
    destination: {
      to_addresses: [ENV['TO_ADDRESS']]
    },
    message: {
      subject: {
        data: 'subject',
        charset: 'UTF-8'
      },
      body: {
        text: {
          data: 'body',
          charset: 'UTF-8'
        }
      }
    },
    source: ENV['FROM_ADDRESS']
  )

  {
    statusCode: 200,
    headers: {
      "Access-Control-Allow-Origin": '*',
      "Access-Control-Allow-Credentials": true
    },
    body: 'success'.to_json
  }
end
