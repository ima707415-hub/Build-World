extends CharacterBody2D

@export var move_speed: float = 190.0
var touch_direction := Vector2.ZERO

func _ready() -> void:
    queue_redraw()

func _physics_process(_delta: float) -> void:
    var direction := Vector2.ZERO
    direction.x = Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left")
    direction.y = Input.get_action_strength("ui_down") - Input.get_action_strength("ui_up")
    if direction.length_squared() > 1.0:
        direction = direction.normalized()
    velocity = direction * move_speed
    move_and_slide()
    queue_redraw()

func _draw() -> void:
    # Simple placeholder character; replace with proper art later.
    draw_circle(Vector2.ZERO, 11.0, Color(0.95, 0.82, 0.52))
    draw_arc(Vector2.ZERO, 11.0, 0.0, TAU, 24, Color(0.18, 0.13, 0.08), 2.0)
