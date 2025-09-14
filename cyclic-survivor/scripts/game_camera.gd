extends Camera2D

@onready var camera_variable = get_node("/root/game/game_camera")

var main_menu_scene_group = "MainMenuGroup"
var player_scene_group = "PlayerGroup"

var main_menu_scene_toggle_state = null
var player_scene_toggle_state = null

var camera_position_owner = null

func _physics_process(_delta):
	if Global.get_main_menu_scene_location() != null:
		if main_menu_scene_toggle_state == 1:
			camera_variable.position = Global.get_main_menu_scene_location()
		else:
			if Global.get_player_scene_location() != null:
				if player_scene_toggle_state == 1:
					camera_variable.position = Global.get_player_scene_location()
				else:
					camera_variable.position.x = 0
					camera_variable.position.y = 0

func _on_game_toggled_off_main_menu_scene():
	main_menu_scene_toggle_state = null

func _on_game_toggled_on_main_menu_scene():
	main_menu_scene_toggle_state = 1

func _on_game_toggled_off_player_scene():
	player_scene_toggle_state = null

func _on_game_toggled_on_player_scene():
	player_scene_toggle_state = 1
