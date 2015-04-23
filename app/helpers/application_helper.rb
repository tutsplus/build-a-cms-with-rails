module ApplicationHelper
  def url_for_page page
    path = if page.slug.present?
      page.slug
    else
      "pages/#{page.id}"
    end

    root_path + path
  end

  def url_for_menu_item menu_item
    if menu_item.url.match /:\/\// # http://, ftp://, etc.
      menu_item.url
    else
      root_path + menu_item.url
    end
  end
end
