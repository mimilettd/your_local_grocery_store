class ReceiptsController < ActionController::Base
  def show
    @receipt = Receipt.find(params["id"])
  end
end
