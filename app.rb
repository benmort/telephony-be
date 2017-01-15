require 'sinatra'
require 'json'

post '/permutations' do
	content_type :json
	headers \
		"Access-Control-Allow-Origin" => "*"
 	response = request.body.read
	if response.is_a? String
		data = JSON.parse(response)
	end
	telephone_number = data['telephone_number'].split(',').map(&:to_i)
	if telephone_number.is_a? Array
		permutations = Telephony.permutations(telephone_number)
		permutations.to_json
	end
end

require_relative './models/telephony'
