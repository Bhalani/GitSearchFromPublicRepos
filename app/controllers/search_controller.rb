# frozen_string_literal: true

class SearchController < ApplicationController
  def index
    @search = Github::Client.new(params[:q], page: params[:page]&.to_i || 1)
    @search.search_repositories
  end
end
