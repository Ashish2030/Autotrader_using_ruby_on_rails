class GalleryController < ApplicationController
  # before_action :authenticate_user!

  def index
    @gallery = Old.all
  end
  def checkout
    if request.post?
      logger.info "---------------------------------------------------------"
      amount = session[:amount]
      ActiveMerchant::Billing::Base.mode = :test

      # Create a new credit card object
      credit_card = ActiveMerchant::Billing::CreditCard.new(
        :number     => params[:number],
        :month      => params[:month],
        :year       => params[:year],
        :first_name => params[:first_name],
        :last_name  => params[:last_name],
        :verification_value  => params[:verification_value]
      )

      if credit_card.valid?
        logger.info "---------------------------------------------------------"
        # Create a gateway object to the TrustCommerce service
        gateway = ActiveMerchant::Billing::TrustCommerceGateway.new(
          :login    => 'TestMerchant',
          :password => 'password'
        )

        # Authorize for $10 dollars (1000 cents)
        response = gateway.authorize(amount.to_i, credit_card)

        if response.success?
          # Capture the money
          session[:cart] = nil
          gateway.capture(amount.to_i, response.authorization)
          puts "-------------------------------------------------------------------------------"
          logger.info("Done");
          redirect_to :action => :purchase_complete
        else
          flash[:notice] = "Invalid credit cart details. Give the correct inputs!"
          render :action => :checkout
        end
      end
      logger.info "--------------------------end----------------------"
    end
  end
  def search
    keyword="%" + params[:search].to_s + "%"
    @gallery = Old.find_by_sql ["SELECT * FROM olds WHERE name LIKE ? ",keyword]
    puts "--------@gallery------------"
    puts @gallery.inspect
    puts "--------@gallery------------"
    render  :action => :search
  end
end
