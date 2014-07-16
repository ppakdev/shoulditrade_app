class TradesController < ApplicationController

  before_action :authenticate, only: [:new, :create, :destroy]

  # show random trade
  def index
    @trade = Trade.all.sample
  end

  # show specific trade
  def show
    @trade = Trade.find(params[:id])
  end

  # new trade form
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

  # create trade
  def create
    trade = Trade.new
    package1 = package("0")
    package2 = package("1")
    trade.user_id = session[:current_user]
    package1.save
    package2.save
    trade.packages = [package1, package2]
    if trade.save
      redirect_to trade_path(trade)
    else
      render :new
    end
  end

  # vote yes
  def upvote
    @trade = Trade.find(params[:id])
    @trade.up_from current_user
    redirect_to trade_path(@trade)
  end

  # vote no
  def downvote
    @trade = Trade.find(params[:id])
    @trade.down_from current_user
    redirect_to trade_path(@trade)
  end

  #destroys trades
  def destroy
    @trade = Trade.find(params[:id])
    @trade.destroy
    user = user.find(session[:current_user])
    redirect_to user_path(user)
  end

  # creates a package
  def package(index)
    package = Package.new
    params["trade"]["packages_attributes"][index]["players"].each do |id|
      if !id.blank?
        package.players << Player.find(id)
      end
    end
    return package
  end


end
