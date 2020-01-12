module view

import ui
import gx
import presenter

const (
	WindowWidth = 240
	WindowHeight = 200
)

pub struct View {
mut:
	value_tb  &ui.TextBox
	window    &ui.Window
	presenter &presenter.Presenter
}

pub fn create_view() View {
	mut view := &View{}
	view.init_components()

	return view
}

pub fn (this View) run() {
	ui.run(this.window)
}

pub fn (this mut View) set_value(value int) {
	this.value_tb.text = value.str()
}

/*
 * Private functions.
 */

fn (this mut View) init_components() {
	window := ui.new_window(ui.WindowConfig{
		width: WindowWidth
		height: WindowHeight
		title: 'MVP sucks'
		user_ptr: this
		draw_fn: draw
	})
	this.value_tb = ui.new_textbox(ui.TextBoxConfig{
		max_len: 20
		x: 20
		y: 20
		width: 200
		placeholder: 'Value'
		parent: window
	})
	ui.new_button(ui.ButtonConfig{
		x: 20
		y: 60
		parent: window
		text: 'Increment'
		onclick: on_increment_click
	})
	ui.new_button(ui.ButtonConfig{
		x: 130
		y: 60
		parent: window
		text: 'Decrement'
		onclick: on_decrement_click
	})
	this.window = window
	this.presenter = presenter.create_presenter(mut this)
}

fn on_increment_click(this mut View) {
	this.presenter.on_increment_click()
}

fn on_decrement_click(this mut View) {
	this.presenter.on_decrement_click()
}

fn draw(view mut View) {
	// Do nothing
}
