extends Node2D

var main_menu_scene = load("res://scenes/main_menu.tscn")
var editable_world_scene = load("res://scenes/editable_world.tscn")
var player_scene = load("res://scenes/player.tscn")

var main_menu_scene_instance = null
var editable_world_scene_instance = null
var player_scene_instance = null

signal triggered_toggle_main_menu_scene
signal triggered_toggle_editable_world_scene
signal triggered_toggle_player_scene

signal toggled_on_main_menu_scene
signal toggled_on_editable_world_scene
signal toggled_on_player_scene

signal toggled_off_main_menu_scene
signal toggled_off_editable_world_scene
signal toggled_off_player_scene

func _ready():
	triggered_toggle_main_menu_scene.emit()
	triggered_toggle_editable_world_scene.emit()
	triggered_toggle_player_scene.emit()

func _process(_delta):
	if is_instance_valid(main_menu_scene_instance):
		Global.set_main_menu_scene_location(main_menu_scene_instance.position)
	
	if is_instance_valid(player_scene_instance):
		Global.set_player_scene_location(player_scene_instance.position)

func _input(_event):
	if Input.is_action_just_pressed("gameplay_1"):
		triggered_toggle_main_menu_scene.emit()
	else:
		if Input.is_action_just_pressed("gameplay_2"):
			triggered_toggle_editable_world_scene.emit()
		else:
			if Input.is_action_just_pressed("gameplay_3"):
				triggered_toggle_player_scene.emit()

func _on_triggered_toggle_main_menu_scene():
	await get_tree().create_timer(0.2).timeout # Wait 0.2 seconds
	if is_instance_valid(main_menu_scene_instance):
		main_menu_scene_instance.queue_free() # Remove the instance
		toggled_off_main_menu_scene.emit()
	else:
		main_menu_scene_instance = main_menu_scene.instantiate() # Make it so
		add_child(main_menu_scene_instance) # And add it as a child to this node
		toggled_on_main_menu_scene.emit()

func _on_triggered_toggle_editable_world_scene():
	await get_tree().create_timer(0.2).timeout # Wait 0.2 seconds
	if is_instance_valid(editable_world_scene_instance):
		editable_world_scene_instance.queue_free() # Remove the instance
		toggled_off_editable_world_scene.emit()
	else:
		editable_world_scene_instance = editable_world_scene.instantiate() # Make it so
		add_child(editable_world_scene_instance) # And add it as a child to this node
		toggled_on_editable_world_scene.emit()


func _on_triggered_toggle_player_scene():
	await get_tree().create_timer(0.2).timeout # Wait 0.2 seconds
	if is_instance_valid(player_scene_instance):
		player_scene_instance.queue_free() # Remove the instance
		toggled_off_player_scene.emit()
	else:
		player_scene_instance = player_scene.instantiate() # Make it so
		add_child(player_scene_instance) # And add it as a child to this node
		toggled_on_player_scene.emit()
