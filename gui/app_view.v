module gui

import ui
import presenter

const (
	win_width  = 240
	win_height = 58
)

struct AppView {
mut:
	value_tb &ui.TextBox = 0
	window   &ui.Window = 0
	presenter &presenter.Presenter = 0
}

pub fn (this &AppView) start() {
	ui.run(this.window)
}

pub fn (this &AppView) set_textbox_value(value int) {
	this.value_tb.text = value.str()
}

fn (mut this AppView) init_components() {
	this.value_tb = ui.textbox({
		max_len: 20
		width: 230
		placeholder: 'Value'
	})
	this.window = ui.window({
		width: win_width
		height: win_height
		title: 'MVP sucks'
		user_ptr: this
	}, [
		ui.column({
			spacing: 5
			margin: ui.MarginConfig{5,5,5,5}
		}, [
			this.value_tb,
			ui.row({
				spacing: 6
			}, [
				ui.button({
					width: 112
					text: 'Increment'
					onclick: on_increment_click
				}),
				ui.button({
					width: 112
					text: 'Decrement'
					onclick: on_decrement_click
				})
			])
		])
	])
	this.presenter = presenter.create_presenter(this)
}

fn on_increment_click(mut this AppView, btn &ui.Button) {
	this.presenter.on_increment_click()
}

fn on_decrement_click(mut this AppView, btn &ui.Button) {
	this.presenter.on_decrement_click()
}
