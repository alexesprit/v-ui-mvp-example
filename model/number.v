module model

pub struct Number {
pub mut:
	value int
}

pub fn (this mut Number) increment() {
	this.value++
}

pub fn (this mut Number) decrement() {
	this.value--
}
