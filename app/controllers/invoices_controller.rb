class InvoicesController < ApplicationController
  def new
    @invoice = Invoice.new
  end

  def create
    @invoice = Invoice.new(invoice_params)

    if @invoice.save
      redirect_to categories_path, notice: "Invoice uploaded successfully."
    else
      flash.now[:alert] = "Failed to upload invoice."
      @categories = Category.all
      render 'categories/index'
    end
  end

  private

  def invoice_params
    params.require(:invoice).permit(:pdf_file)
  end
end
