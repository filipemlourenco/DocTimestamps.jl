module DocTimestamps

export Timestamp

using Dates

Base.@kwdef mutable struct Timestamp
    created_by :: Union{String, Nothing}    = nothing
    created_at :: DateTime                  = Dates.now()
    updated_by :: Union{String, Nothing}    = nothing
    updated_at :: Union{DateTime, Nothing}  = nothing
end
Timestamp(user::String) = Timestamp(user, Dates.now(), nothing, nothing)

function created_by!(ts::Timestamp, user::String)
    @assert isnothing(ts.created_by) "Created by field already defined"
    ts.created_by = user
end

function update!(ts::Timestamp, user::Union{String, Nothing} = nothing, date::DateTime = Dates.now())
    @assert date > ts.created_at "Update date should be older thand the creation date"
    ts.updated_by = user
    ts.updated_at = date
end

end # module DocTimestamps