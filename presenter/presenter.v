module presenter

import model
import view

pub struct Presenter {
pub:
	model &model.Number
	view &view.IAppView
}

pub fn create_presenter(view &view.IAppView) &Presenter {
	model := &model.Number { 2 }
	view.set_textbox_value(model.value)

	return &Presenter { model: model, view: view }
}

pub fn (this mut Presenter) on_increment_click() {
	this.model.increment()
	this.view.set_textbox_value(this.model.value)
}

pub fn (this mut Presenter) on_decrement_click() {
	this.model.decrement()
	this.view.set_textbox_value(this.model.value)
}
