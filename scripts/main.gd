extends Node2D

const WORLD_SCRIPT := preload("res://scripts/world.gd")

func _ready() -> void:
    var world := Node2D.new()
    world.name = "GeneratedWorld"
    world.set_script(WORLD_SCRIPT)
    add_child(world)
    world.generate_world()
