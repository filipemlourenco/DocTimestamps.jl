using DocTimestamps
using Test

@testset "Object instantiation" begin
    ts = Timestamp()
    @test !isnothing(ts.created_at)
    @test isnothing(ts.created_by)
    @test isnothing(ts.updated_at)
    @test isnothing(ts.updated_by)

    ts = Timestamp("username")
    @test !isnothing(ts.created_at)
    @test ts.created_by == "username"
    @test isnothing(ts.updated_at)
    @test isnothing(ts.updated_by)

    ts = Timestamp(created_by = "username", updated_by = "username")
    @test ts.created_by == "username"
    @test ts.updated_by == "username"

end

@testset "Object update" begin

    ts  = Timestamp()
    DocTimestamps.created_by!(ts, "username")
    @test ts.created_by == "username"
    @test isnothing(ts.updated_at)
    @test isnothing(ts.updated_by)

    @test_throws AssertionError DocTimestamps.created_by!(ts, "newusername")

    DocTimestamps.update!(ts, "username2")
    @test ts.created_by == "username"
    @test ts.updated_by == "username2"
    @test !isnothing(ts.created_at)
    @test !isnothing(ts.updated_at)

end