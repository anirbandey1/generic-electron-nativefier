name="leetcode-electron"
command_name="leetcode-electron"
fancy_name="Leetcode"
url="https://leetcode.com/problemset/all"
wm_class_last_digits="9c6b9a"

prepare :
	./script.sh "${name}" "${command_name}" "${fancy_name}" "${url}" "${wm_class_last_digits}"
	npm install
	npm run build

install :
	mkdir -pv /opt/${name}
	cp -rv ${name}-linux-x64 /opt/${name}
	mkdir -pv /usr/local/share/applications
	mkdir -pv /usr/local/share/icons
	cp ./desktop/desktop.desktop /usr/local/share/applications/${name}.desktop
	cp ./desktop/icon.png /usr/local/share/icons/${name}.png
	ln -sv /opt/${name}/${name}-linux-x64/${name} /usr/local/bin/${command_name}


clean :
	rm -rfv /opt/${name}
	rm -fv /usr/local/share/applications/${name}.desktop
	rm -fv /usr/local/share/icons/${name}.png
	unlink /usr/local/bin/${command_name}
	
