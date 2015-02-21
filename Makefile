min:
	@ ./node_modules/uglify-js/bin/uglifyjs google-drive-picker.js --mangle --comments -o google-drive-picker.min.js

.PHONY: min
