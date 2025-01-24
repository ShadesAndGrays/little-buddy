@tool
extends EditorPlugin

@export var speed = 1
var little_buddy:Control = preload("res://addons/LittleBuddy/Scenes/LittleBuddy.tscn").instantiate()
var little_buddy_sprite:AnimatedSprite2D
var frame:float = 0;
func _enter_tree() -> void:
    print('little buddy is up')
    little_buddy_sprite = little_buddy.get_node('CenterContainer/TextureRect/AnimatedSprite2D')
    add_control_to_dock(EditorPlugin.DOCK_SLOT_RIGHT_BL,little_buddy)

func _process(delta: float) -> void:
    if little_buddy_sprite:
        frame += 24.0/100 * delta * 60
        little_buddy_sprite.frame = int(frame) % 9
    pass

func _exit_tree() -> void:
    print('little buddy is going to sleep')

    remove_control_from_docks(little_buddy)
    little_buddy.queue_free()
