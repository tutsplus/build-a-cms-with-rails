class Admin::SettingsController < ApplicationController
  def index
    @settings = Setting.all
    @themes = get_themes
  end

  def update
    setting_params.each do |key, value|
      Setting.where(key: key).first.update_attribute :value, value
    end

    Rails.application.reload_routes!
    redirect_to admin_settings_path, notice: "Settings saved."
  end

  private

  def setting_params
    params.require(:settings).permit(:homepage, :theme)
  end

  def get_themes
    themes_directory = File.join(Rails.root, "app/themes/")
    theme_folders = Dir.entries(themes_directory).select do |item|
      !%w(. ..).include?(item)
    end.map do |folder|
      OpenStruct.new((YAML.load_file File.join(themes_directory, folder, "info.yaml")).merge id: folder)
    end
  end
end
