class ContractsController < ApplicationController
  before_action :set_contract, only: [:show, :edit, :update, :destroy]

  def index
    @contracts = Contract.created_at_desc.page(params[:page])
  end

  def show
  end

  def new
    @contract = Contract.new
  end

  def create
    @contract = Contract.new(contract_params)
    if @contract.save
      redirect_to ({ action: :index }), notice: "Амжилттай үүсгэлээ"
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @contract.update_attributes(contract_params)
      redirect_to ({ action: :index }), notice: "Амжилттай заслаа"
    else
      render :edit
    end
  end

  def destroy
    @contract.destroy!
    redirect_to ({ action: :index }), notice: "Амжилттай устгагдлаа"
  end

  private

  def contract_params
    params.require(:contract).permit(:number, :lastname, :firstname, :register, :address, :document)
  end

  def set_contract
    @contract = Contract.find(params[:id])
  end
end