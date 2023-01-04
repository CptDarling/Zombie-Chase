extends PopupPanel

signal quit_application_requested
signal api_example_requested

func _on_quit_button_pressed() -> void:
	print_debug("_on_quit_button_pressed")
	emit_signal("quit_application_requested")


func _on_api_button_pressed() -> void:
	print_debug("_on_api_button_pressed")
	emit_signal("api_example_requested")
