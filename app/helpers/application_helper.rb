module ApplicationHelper

  def logo
    logo = image_tag("logo.png", :alt => "Sample App", :class => "round")
    link_to logo, root_path
  end
  # Return a title on a per-page basis.
  def title
    base_title = "A rede social do MTAI"
    if @title.nil?
      base_title
    else
      "#{base_title} | #{@title}"
    end
  end
end

