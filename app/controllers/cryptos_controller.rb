class CryptosController < ApplicationController
  def index

  end

  def show

     research = crypto_params[:name]
     if research.empty?
      flash.now[:danger] ="Entrez une recherche valide !"
      render "index"
     else
       @crypto = ScrapCryp.new(research).perform
         unless @crypto
           flash.now[:danger] ="Cryptomonaies introuvable, réessayez svp !"
           render "index"
        end
     end


  end



  private

  def crypto_params
    params.require(:crypto).permit(:name)
  end
end
