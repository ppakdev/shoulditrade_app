class TradesController < ApplicationController

  before_action :authenticate, only: [:new, :create, :destroy]

  def index
    @trade = Trade.all.sample
  end

  def show
    @trade = Trade.find(params[:id])
  end

  def new
    @trade = Trade.new
    @trade.user_id = session[:current_user]
    @trade.packages = [Package.new, Package.new]
    @qb = Player.where(position: "QB")
    @rb = Player.where(position: "RB")
    @wr = Player.where(position: "WR")
    @te = Player.where(position: "TE")
    @kicker = Player.where(position: "K")
  end

  def create
    trade = Trade.new
    package1 = Package.new
    package2 = Package.new
    trade.user_id = session[:current_user]
    params["trade"]["packages_attributes"]["0"]["players"].each do |id|
      if !id.blank?
        package1.players << Player.find(id)
      end
    end
    params["trade"]["packages_attributes"]["1"]["players"].each do |id|
      if !id.blank?
        package2.players << Player.find(id)
      end
    end
    package1.save
    package2.save
    trade.packages = [package1, package2]
    if trade.save
      redirect_to trade_path(trade)
    else
      render :new
    end
  end

  def upvote
    @trade = Trade.find(params[:id])
    @trade.up_from current_user
    redirect_to trade_path(@trade)
  end

  def downvote
    @trade = Trade.find(params[:id])
    @trade.down_from current_user
    redirect_to trade_path(@trade)
  end

  def destroy
    @trade = Trade.find(params[:id])
    @trade.destroy
    user = user.find(session[:current_user])
    redirect_to user_path(user)
  end


end
