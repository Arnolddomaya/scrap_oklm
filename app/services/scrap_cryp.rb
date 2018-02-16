require 'rubygems'
require 'nokogiri'
require 'open-uri'


class ScrapCryp
  attr_accessor :research
  attr_accessor :crypto


  def initialize(research)
    @research = research
  end


  def parse_criptomonies()
    res = []
    page = Nokogiri::HTML(open("https://coinmarketcap.com/all/views/all/"))
    #on recupère le tableau qui contient tout les cryptomonaies dans un tableau
    cryptomonaies = page.css("#currencies-all > tbody:nth-child(2) tr")
    #pour tout les cryptomonaie du tableau on recupère le nom et le cours : price
    cryptomonaies.each do |cryptomonaie|
      nom = cryptomonaie.css("a.currency-name-container").text
      price = cryptomonaie.css("a.price").text
      res << {:name =>nom , :price=>price }
    end
    res
  end


  def perform
    search_crypto
  end

  def search_crypto
    res = false
    parse_criptomonies().each do |crypt|
      if crypt[:name].downcase == @research.downcase
        res = crypt
      end
    end
    res
  end


end
