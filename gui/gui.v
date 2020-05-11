module gui

import view

pub fn create_app_view() &AppView {
	mut view := &AppView{}
	view.init_components()
	return view
}
