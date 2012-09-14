# encoding: utf-8

require 'cuba/test'
require './app'

scope do
  test 'homepage' do
    get '/'
    assert last_response.ok?
    assert last_response.body.include?('Cirope')
  end

  test 'app sites' do
    sites = { mawidabp: 'bp', mawidaqa: 'qa', libreduca: 'Libreduca' }

    sites.each do |site, expected|
      get "/#{site}"
      assert last_response.ok?
       assert last_response.body.include?(expected)
    end
  end
end
