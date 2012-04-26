class SearchController < ApplicationController
  def search
    #params[:query] is a string that contains the text the user submitted
    #params[:search_for] is what they search for. It can be either "title" or "content"
    
    if !params[:query].nil? && params[:query].size > 0
      terms = params[:query].split
      term_string = ""

      terms.each { |term|
        term_string += term
      }
      
      query_file = File.dirname(__FILE__) + "/../../../../Medline2012/example_query.txt"
      File.open(query_file, 'w+') { |f| f.write(params[:query]) }
      
      path = File.dirname(__FILE__) + "/../../../../Medline2012/fasterRetrieval.mps < " + query_file
      
      response = `cd /home/mumps/Medline2012 ; mumps /home/mumps/Medline2012/fasterRetrieval.mps < ~/Medline2012/example_query.txt`

      response = response.split("\n\n")
      
      @time_taken = response.last
      
      results = response[2..response.size - 2]
      @results = []
      results.each {|r|
        @results << {:relevancy => r[0..4], :text => r[5..r.size - 1].split("\n")}
      }
      
    end
  end

  def view
    
  end
end
