extends Node

signal current_form_changed(new_form)
var _current_form = 0 # Value dependent on whether you're in grinch or santa form
					 # 0 = Grinch | 1 = Santa

var current_form: int:
	get:
		return _current_form
	set(value):
		if _current_form != value:
			_current_form = value
			current_form_changed.emit(value)
