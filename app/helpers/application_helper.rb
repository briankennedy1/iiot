module ApplicationHelper
  def full_title(page_title)
    base_title = 'Is It On Tonight?'
    page_title.empty? ? base_title : "#{page_title}"
  end
end
