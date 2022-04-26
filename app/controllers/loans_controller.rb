class LoansController < ActionController::API
  rescue_from ActiveRecord::RecordNotFound do |exception|
    render json: 'not_found', status: :not_found
  end

  def index
    render json: Loan.all
  end

  def show
    loan = Loan.find(params[:id])
    remaining_loan = loan.remaining_amount

    render json: { funded_amount: loan.funded_amount, outstanding_balance: remaining_loan }
  end
end
