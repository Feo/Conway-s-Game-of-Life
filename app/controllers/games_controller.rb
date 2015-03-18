class GamesController < ApplicationController
  def show
    if params[:id] 
      @game = Game.find(params[:id])
      @rows = @game.gamedata.to_s.scan(/.{#{@game.width}}/)
      @grid = []
      @rows.each do |row|
        row = row.split(//)
        newrow = row.collect do |item|
          item.to_i
        end
        @grid << newrow
      end
      @grid = ActiveSupport::JSON.encode(@grid)
    else
      @game = Game.new
      @game.width = 90
      @game.height = 45
      @grid = false
    end
    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @game }
    end
  end
end
