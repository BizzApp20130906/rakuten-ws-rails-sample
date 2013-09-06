class SearchSupportController < ApplicationController
  def index
    render 'search_support/index'
  end

  def support
    keyword = params['keyword']
    httpClient = HTTPClient.new

    @jsonData = nil
    @cateData = nil
    @errorMeg = nil

    begin
      data = httpClient.get_content('https://app.rakuten.co.jp/services/api/IchibaItem/Search/20130805', {
          'applicationId' => '1046125781907581411',
          'affiliateId'   => '11b23db1.acb56b0a.11b23db2.0c5a2bef',
          'keyword'       => keyword
      })
      @jsonData = JSON.parse data
      #p @jsonData
      @cateData = Hash.new
      @jsonData['Items'].each do |element| 
        key = element['Item']['genreId']
=begin
        genreInfo = JSON.parse httpClient.get_content('https://app.rakuten.co.jp/services/api/IchibaGenre/Search/20130723', {
          'applicationId' => '1046125781907581411',
          'affiliateId'   => '11b23db1.acb56b0a.11b23db2.0c5a2bef',
          'genreId'       => key
         })
        puts "keyInfo は #{keyInfo}"
        #genreKey = genreInfo['current']['genreName']
=end
        genreKey = key
        @cateData[genreKey] = (@cateData[genreKey].nil?)? 1 : @cateData[genreKey] + 1
      end

      rescue HTTPClient::BadResponseError => e
      rescue HTTPClient::TimeoutError => e
    end

    render 'search_support/index'
  end
end
