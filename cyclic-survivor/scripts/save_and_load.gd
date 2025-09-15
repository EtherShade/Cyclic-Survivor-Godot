extends Node

const PATH : String = "user://"
var save_name : String = "save"
const PATH_EXTEND : String = ".json"


var contents_to_save: Dictionary = {
	"player_name" = "defaultname"
}

func _new() -> void:
	contents_to_save = {
		"player_name" = "name1"
	}

func _save():
	var access = FileAccess.open(PATH + save_name + PATH_EXTEND, FileAccess.WRITE)
	access.store_string(JSON.stringify(contents_to_save))
	access.close()

func _load():
	if FileAccess.file_exists(PATH + save_name + PATH_EXTEND):
		var access = FileAccess.open(PATH + save_name + PATH_EXTEND, FileAccess.READ)
		var data = JSON.parse_string(access.get_as_text())
		access.close()
