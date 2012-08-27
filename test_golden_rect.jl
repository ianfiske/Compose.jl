
load("compose.jl")

const phi = (1 + sqrt(5)) / 2

function golden_rect(n::Int)
    if n == 0; return nothing; end
    compose!(Canvas(),
             {Rectangle(), Fill(LCHuv(90, 70, 35 + 15n))},
             {Canvas(0, -1/phi, 1h, 1/phi, Rotation(pi/2, 0, 1)),
              golden_rect(n - 1)})
end

@upon SVG("golden_rect.svg", phi * 4inch, 4inch) begin
    draw(compose!(
        pad!(golden_rect(15), 1mm), Fill(nothing), LineWidth(0.1mm)))
end
