$.fn.helperText = function() {
	return this.focus(function() {
		if (this.value == this.defaultValue) {
			this.value = '';
		}
	}).blur(function() {
		if (!this.value.length) {
			this.value = this.defaultValue;
		}
	});
};

$(document).ready(function(){
	$("#address").helperText();
});