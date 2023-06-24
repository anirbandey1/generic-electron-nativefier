#!/bin/sh



generate_package_json() {

  
cat << EOF > "package.json"
{
  "name":"${name}",
  "version":"0.1.0",
  "main":"main.js",
  "scripts":{
    "start":"electron .",
    "build":"nativefier --name '${name}' --icon 'desktop/icon.png' '${url}'"
  },
  "dependencies":{
    "electron":"^25.2.0",
    "nativefier":"^50.1.1"}
}
EOF

}

generate_desktop_entry() {



cat << EOF > "desktop/desktop.desktop"
[Desktop Entry]
Version=0.1.0
Type=Application
Terminal=false
Exec=/usr/local/bin/${name}
Name=${fancy_name}
Comment=${fancy_name} Unofficial electron client for Desktop
Icon=/usr/local/share/icons/${name}.png
StartupWMClass=${name}-nativefier-${wm_class_last_digits}
EOF




}



main() {

name="$1"
fancy_name="$2"
url="$3"
wm_class_last_digits="$4"

echo $name
echo $fancy_name
echo $url
echo $wm_class_last_digits


generate_package_json
generate_desktop_entry

}

main "$@"
