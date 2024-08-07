# DocTimestamps.jl

DocTimestamps.jl provides a timestamp object that can be added to a record object.

## Setup

```julia
using Pkg
Pkg.add("https://github.com/filipemlourenco/DocTimestamps.jl")
using DocTimestamps
```

## Usage

#### Default timestamp instantiation

```julia
ts = Timestamp("username");

ts
Timestamp("username", Dates.DateTime("2024-08-07T00:00:00.000"), nothing, nothing)
```

#### Anonymous timestamp

```julia
ts = Timestamp();

ts
Timestamp(nothing, Dates.DateTime("2024-08-07T00:00:00.000"), nothing, nothing)
```

#### Add created by username

```julia
ts = Timestamp();
DocTimestamps.created_by!(ts, "username")

ts
Timestamp("username", Dates.DateTime("2024-08-07T00:00:00.000"), nothing, nothing)
```

#### Timestamp update

```julia
ts = Timestamp("username1");
DocTimestamps.update!(ts, "username2")

ts
Timestamp("username1", Dates.DateTime("2024-08-07T00:00:00.000"), "username2", Dates.DateTime("2024-08-08T00:00:00.000"))
```

#### Basic usage

```julia
mutable struct MyRecord
    name::String
    age::Int64
    ts::Timestamp
end

# record creation
rec = MyRecord("name", 18, Timestamp("username"))

# on record update
DocTimestamps.update!(rec.ts, "username2")
```
