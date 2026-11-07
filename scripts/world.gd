extends Node2D

@export var world_width: int = 60
@export var world_height: int = 40
@export var tile_size: int = 32
@export var seed_value: int = 0

var rng := RandomNumberGenerator.new()
var terrain: Array[Array] = []

func generate_world() -> void:
    rng.seed = seed_value if seed_value != 0 else int(Time.get_unix_time_from_system())
    terrain.clear()
    for y in range(world_height):
        var row: Array = []
        for x in range(world_width):
            var roll := rng.randf()
            var kind := 0
            if roll < 0.08:
                kind = 1 # trees / dense vegetation
            elif roll > 0.94:
                kind = 2 # stones
            row.append(kind)
        terrain.append(row)
    queue_redraw()

func _draw() -> void:
    for y in range(terrain.size()):
        for x in range(terrain[y].size()):
            var kind: int = terrain[y][x]
            var rect := Rect2(x * tile_size, y * tile_size, tile_size, tile_size)
            var color := Color(0.30, 0.57, 0.27)
            if kind == 1:
                color = Color(0.15, 0.38, 0.18)
            elif kind == 2:
                color = Color(0.48, 0.48, 0.46)
            draw_rect(rect, color)
            draw_rect(rect, Color(0.10, 0.18, 0.10, 0.18), false, 1.0)
