module Api
  class TransactionsController < BaseController
    def index
      @transactions = Transaction.all

      respond_with @transactions
    end

    def show
      @transaction = Transaction.find(transaction_id)

      respond_with @transaction
    end

    def create
      @transaction = Transaction.new(transaction_params)

      @transaction.save

      respond_with @transaction
    end

    def update
      @transaction = Transaction.find(transaction_id)

      @transaction.update(transaction_params)

      respond_with @transaction
    end

    def destroy
      @transaction = Transaction.find(transaction_id)

      @transaction.destroy

      respond_with @transaction
    end

    def import
      @account = Account.find(account_id)

      @transactions = Transaction.import(file, @account)

      respond_with @transactions
    end

    private

    def transaction_id
      params[:id].to_s
    end

    def account_id
      params[:account_id].to_s
    end

    def transaction_params
      params.permit(:amount, :fit_id, :memo, :name, :payee, :posted_at, :ref_number, :type, :account_id)
    end

    def file
      params[:file]
    end
  end
end