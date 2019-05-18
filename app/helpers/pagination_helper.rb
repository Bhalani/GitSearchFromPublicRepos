module PaginationHelper
  def paginate(results)
    return unless results.total_pages > 1
    @results = results
    pagniation_html_content = []
    pagniation_html_content.push(previous_page_link) if @results.current_page != 1
    pagniation_html_content.push(current_page)
    pagniation_html_content.push(next_page_link) if @results.current_page < @results.total_pages
    pagniation_html_content.join().html_safe
  end

  def previous_page_link
    '<li class="paginate nav-item btn btn-primary">'+
    link_to(@results.current_page - 1, search_index_path(q: params[:q], page: @results.current_page - 1), remote: true, class: "btn btn-primary px-0 py-0")+
    '</li>'
  end

  def next_page_link
    '<li class="paginate nav-item btn btn-primary">'+
    link_to(@results.current_page + 1, search_index_path(q: params[:q], page: @results.current_page + 1), remote: true, class: "btn btn-primary px-0 py-0")+
    '</li>'
  end

  def current_page
    '<li class="nav-item btn btn-outline-secondary">'+
    "<span> #{@results.current_page} </span>"+
    '</li>'
  end
end
