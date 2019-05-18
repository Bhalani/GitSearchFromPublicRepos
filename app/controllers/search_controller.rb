class SearchController < ApplicationController

  def index
    client = Octokit::Client.new(:access_token => ENV["GIT_ACCESS_KEY"])
    @repositories = client.search_repositories(params[:q], page: [params[:page].to_i, 1].max, per_page: 10)
    @repositories.total_pages = @repositories.total_count/10
    @repositories.current_page = [params[:page].to_i, 1].max
  end
end
