extends Node

@onready var pause_menu: PopupPanel = $PauseMenu
@onready var scene_tree = get_tree()

var paused:bool = false : set = _set_paused


func quit_application() -> void:
	get_tree().quit();


func _ready() -> void:
	pause_menu.quit_application_requested.connect(quit_application)
	self.paused = true


func _process(delta: float) -> void:
	if Input.is_action_just_pressed("ui_cancel") && !paused:
		self.paused = true


func _on_pause_menu_popup_hide() -> void:
	print_debug("_on_pause_menu_popup_hide")
	self.paused = false


func _set_paused(value:bool):
	paused = value

	# Stop or start the game loop, UI loop continues.
	get_tree().paused = paused

	if paused:
		# Show the pause menu
		pause_menu.popup_centered()
