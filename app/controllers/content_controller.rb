class ContentController < ApplicationController
  before_filter :set_theme
  before_filter :retrieve_menus

  def set_theme
    theme = "default"
    prepend_view_path "app/themes/#{theme}"
    self.class.layout "../../themes/#{theme}/layout"
  end

  def retrieve_menus
    @menus = Menu.all
  end
end
