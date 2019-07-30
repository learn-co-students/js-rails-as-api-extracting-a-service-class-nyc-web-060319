class SightingsController < ApplicationController
    def show
        # @sighting = Sighting.find(params[:id])
        
        #     render json: sighting.to_json(:include => {
        #       :bird => {:only => [:name, :species]},
        #       :location => {:only => [:latitude, :longitude]}
        #     }, :except => [:updated_at])
# This is a messy way to try and get data about
# the bird and location objs associated with this sighting
# We are trying to get the objects and return specific data
#It works but is almost undreadable. 
#Also controllers shouldn't be doing this much work,
# their purpose is to just return rendered JSON
#To make the controllers simpler, we can create a service class
#TO make one, let's make a folder called services and continue from in there  
 #GO TO SERIALIZER FILE   
# Now that serializer has been created, we can refer to it
#and tidy up this method
  render json: SightingSerializer.new(sighting).to_serialized_json

#   We make a new serializer and give it sighting as an argument
# In the serializer, @sighting is set to sighting
#The .to_serialized_json method we created is called on it
#Therefore, we take the sighting with a specific id
#Create a new Serializer which takes this specific object,
#sets it as a class variable, and then
#uses the class variable for a class method which makes a json
#out of the specific sighting object
#with only certain parameters
#Then, we render it
end
end
