module Admin
  class MenusController < ApplicationController
    def index
      @menus = Menu.all
    end

    def new
      @menu = Menu.new
      10.times { @menu.menu_items.build }
    end

    def create
      @menu = Menu.new menu_params
      if @menu.save
        redirect_to admin_menus_path, notice: "Menu created."
      else
        render :new
      end
    end

    def update
      @menu = Menu.find params[:id]
      if @menu.update_attributes menu_params
        redirect_to admin_menus_path, notice: "Menu updated."
      else
        render :edit
      end
    end

    def edit
      @menu = Menu.find params[:id]
      10.times { @menu.menu_items.build }
    end

    def destroy
      @menu = Menu.find params[:id]
      if @menu.destroy
        redirect_to admin_menus_path, notice: "Menu deleted."
      else
        redirect_to admin_menus_path, alert: "Menu was not deleted."
      end
    end

    protected

    def menu_params
      params.require(:menu).permit(:name, :menu_items_attributes => [ :title, :url, :id] )
    end
  end
end
