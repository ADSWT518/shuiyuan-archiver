APP_NAME="水源社区存档工具"

help:
	@echo "osx|win|clean"
osx:
	cargo build --release --target x86_64-apple-darwin
	cargo build --release --target aarch64-apple-darwin
	mkdir -p dist/bundle/${APP_NAME}.app
	cp platforms/mac/* dist/bundle/${APP_NAME}.app/
	lipo -create -output dist/bundle/${APP_NAME}.app/shuiyuan-archiver target/x86_64-apple-darwin/release/shuiyuan-archiver target/aarch64-apple-darwin/release/shuiyuan-archiver
	ln -s /Applications dist/bundle/Applications
	hdiutil create -volname ${APP_NAME} -srcfolder dist/bundle -o dist/${APP_NAME}.dmg
win:
	cargo build --release --target x86_64-pc-windows-msvc
	mkdir -p dist
	cp target/x86_64-pc-windows-msvc/release/shuiyuan-archiver.exe dist/${APP_NAME}.exe
clean:
	rm -rf dist
	cargo clean