class Gallows
  attr_reader :turns

  def initialize
  	@turns = -1 # to compensate for initial draw
    @man =  [
	    %q{
	       _____
	       |    | 
	            |
	            |
	            |
	            |
	      ========  
	    },

	    %q{
	       _____
	       |    | 
	       0    |
	            |
	            |
	            |
	      ========  
	    },

	    %q{
	       _____
	       |    | 
	       0    |
	       |    |
	            |
	            |
	      ========  
	    },

	    %q{
	       _____
	       |    | 
	      \0    |
	       |    |
	            |
	            |
	      ========  
	    },

	    %q{
	       _____
	       |    | 
	      \0/   |
	       |    |
	            |
	            |
	      ========  
	    },

	    %q{
	       _____
	       |    | 
	      \0/   |
	       |    |
	      /     |
	            |
	      ========  
	    },

	    %q{
	       _____
	       |    | 
	      \0/   |
	       |    |
	      / \   |
	            |
	      ========  
	    }
    ]
  end

  public
  def draw_self(results)
  	if results[:is_correct] == false
  	  @turns += 1
  	end
  	print @man[@turns]
  end
end