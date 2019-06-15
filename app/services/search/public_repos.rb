# frozen_string_literal: true

module Search
  class PublicRepos
    DEFAULT_RESULTS_PER_PAGE = 10

    def initialize(query, page: 1, per_page: nil)
      @client = Octokit::Client.new(access_token: ENV['GIT_ACCESS_KEY'])
      @query = query
      @current_page = page
      @limit_value = per_page || DEFAULT_RESULTS_PER_PAGE
      @result = nil
    end

    def execute
      @result = client.search_repositories(
        query, page: current_page, per_page: limit_value
      )
    end

    def items
      result.items
    end

    def total_pages
      result.total_count / DEFAULT_RESULTS_PER_PAGE
    end

    attr_accessor :query, :client, :result, :current_page, :limit_value
  end
end
