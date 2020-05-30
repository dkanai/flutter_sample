.SILENT:

# test #######################
ut:
	flutter test --coverage
e2e-no-build:
	flutter drive --target=test_driver/e2e.dart --no-build --keep-app-running | egrep -v "dart:async|package:stack_trace|package:test_api|dart:isolate-patch|asynchronous gap"
e2e:
	flutter drive --target=test_driver/e2e.dart --keep-app-running | egrep -v "dart:async|package:stack_trace|package:test_api|dart:isolate-patch|asynchronous gap"
verify:
	make ut && make e2e && make smell

# setup #######################
install-web:
	flutter channel beta && flutter upgrade && flutter config --enable-web

# build #######################
flutter-devices:
	flutter emulators
run-android:
	flutter emulators --launch Pixel_3a_XL_API_R && flutter run
run-ios:
	open -a Simulator && flutter run
run-web:
	flutter run -d chrome
deploy:
	make ut && flutter build web && cd build/web && surge . pdcarnet.surge.sh

# metrics #######################
cov-num:
	genhtml coverage/lcov.info -o coverage/
	sh cov.sh
cov:
	genhtml coverage/lcov.info -o coverage/html && open coverage/html/index.html
smell:
	make big-file && make metric && make dependency-warning
big-file:
	find lib -type f | xargs wc -l | sort -r | grep -v total | egrep [0-9]{3} || echo 'No Big File'
metric:
	metrics --lines-of-code=30 --cyclomatic-complexity=10 --number-of-arguments=2 lib/
cov-e2e:
	echo '#screen' && make number-of-screen && echo '#e2e' && make number-of-e2e
number-of-screen:
	find lib -type f | egrep  "screen" | wc -l
number-of-e2e:
	cat test_driver/e2e_test.dart | egrep "test\('it" | wc -l
