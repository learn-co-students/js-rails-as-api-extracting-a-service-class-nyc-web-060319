#Here is where we will make our serializer.
#It actually doesn't need to inherit anything! :D
#When making a serializer, be sure to restart the server for it to be recognized!
class SightingSerializer
    #First use def initialize
    # to set up instance variables
   def initialize(sighting_object)
        @sighting = sighting_object
    end
    #When doing SightingSerializer.new,
    #it will require an argument of 
    #sighting_object, which we will
    #then save as an instance variable.

    #The second method will utilize
    #this instance variable
    #and include a lot of the messy logic
    #that was previously present in the controller
def to_serialized_json
    # @sighting.to_json(:include => {
    # :bird => {:only => [:name, :species]},
    # :location => {:only => [:latitude, :longitude]}
    # }, :except => [:updated_at])

# This is still super messy, we could choose to leave it at this point
# and work with controller (OPTON GO TO CONTROLLER)
# or we can continue and rework this code
#To do that, we can create a hash called options
#This hash will say:
#"Include the bird and location I am tied with, only list specific things about each of them"
#Also, for me, the sighting object, don't send over the updated_at
options = {
    include: {
      bird: {
        only: [:name, :species]
      },
      location: {
        only: [:latitude, :longitude]
      }
    },
    except: [:updated_at],
  }
  @sighting.to_json(options)
  #This looks way cleaner, and does exactly what it did before
  #GO BACK TO CONTROLLER

end


end