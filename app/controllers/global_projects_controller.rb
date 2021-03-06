class GlobalProjectsController < ApplicationController
  layout "global_projects"

  def index
    if q = params[:q]
      @projects = Project.solr_search do
        fulltext q.split.map{|word| "\"#{word}\""}.join " AND "
      end.results
    else
      @projects = Project.order "updated_at DESC"
    end
  end
end
