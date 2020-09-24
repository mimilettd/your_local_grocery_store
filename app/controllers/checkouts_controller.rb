class CheckoutsController < ActionController::Base
  def new; end

  def create
    if receipt
      redirect_to receipt_path(receipt.id)
    else
      flash.now[:notice] = 'Failed to checkout'
      render :new
    end

  end

  def receipt
    ReceiptWriter.call(params["items"])
  end

  def checkout_params
    params.permit(:items)
  end
end
