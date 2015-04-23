module ApplicationHelper
  def url_for_page page
    path = if page.slug.present?
      page.slug
    else
      "pages/#{page.id}"
    end

    root_path + path
  end
end
