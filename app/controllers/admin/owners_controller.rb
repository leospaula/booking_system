class Admin::OwnersController < ApplicationController
  before_action :set_owner, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @owners = Owner.all
    respond_with(@owners)
  end

  def show
    respond_with(@owner)
  end

  def new
    @owner = Owner.new
    respond_with(@owner)
  end

  def edit
  end

  def create
    @owner = Owner.new(owner_params)
    @owner.save
    respond_with(@owner)
  end

  def update
    @owner.update(owner_params)
    respond_with(@owner)
  end

  def destroy
    @owner.destroy
    respond_with(@owner)
  end

  private
    def set_owner
      @owner = Owner.find(params[:id])
    end

    def owner_params
      params[:owner]
    end
end
