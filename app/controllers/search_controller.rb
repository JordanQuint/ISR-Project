class SearchController < ApplicationController
  def search
    #params[:query] is a string that contains the text the user submitted
    #params[:search_for] is what they search for. It can be either "title" or "content"
    
    
    if params[:query].size > 0
      @results = "Search results for '" + params[:query] + "' in the document " + params[:search_for] + "s."
    end
  end

  def view
    
  end
end
