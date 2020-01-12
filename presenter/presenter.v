module presenter

import model

pub struct Presenter {
pub:
	model &model.Number
	view &view.View
}

pub fn create_presenter(view mut &view.View) &Presenter {
	model := &model.Number { 2 }

	view.set_value(model.value)

	return &Presenter { model, view }
}

pub fn (this mut Presenter) on_increment_click() {
	this.model.increment()
	this.view.set_value(this.model.value)
}

pub fn (this mut Presenter) on_decrement_click() {
	this.model.decrement()
	this.view.set_value(this.model.value)
}
