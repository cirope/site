require 'cuba/test'
require './app'

scope do
  test 'homepage' do
    get '/'
    assert last_response.ok?
    assert last_response.body.include?('Cirope')
  end
end
