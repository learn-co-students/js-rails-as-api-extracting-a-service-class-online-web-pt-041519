class SightingSerializer

    def initialize(sighting)
        @sighting = sighting
    end

    def to_json
        return {message: "Sighting not found"} if @sighting.nil?
        opts = {include: {
            bird: {
                only: [:name, :species]
            },
            location: {
                only: [:latitude, :longitude]
            }
        }, except: [:updated_at]}
        @sighting.to_json(opts)
    end

end