#!/usr/bin/env sh

sudo apt -y install wine winetricks msitools

if [ -z "$HYPERCUBING_DIR" ]; then
    HYPERCUBING_DIR="$HOME"/Desktop/HyperCubing
fi
if [ -z "$HYPERCUBING_WINEPREFIX" ]; then
    HYPERCUBING_WINEPREFIX="$HYPERCUBING_DIR"/wine
fi
if [ -z "$DESKTOP_FILES" ]; then
    DESKTOP_FILES="${XDG_DATA_HOME-$HOME/.local/share}"/applications
fi

WINEPREFIX="$HYPERCUBING_WINEPREFIX" WINEARCH=win32 winetricks dotnet20 dotnet35 dotnet40

echo '[Desktop Entry]
Type=Application
Terminal=false' > application.desktop

cd "$HYPER_CUBING_DIR"
mkdir MC4D
cd MC4D
curl -s https://api.github.com/repos/cutelyaware/magiccube4d/releases/latest \
| grep "browser_download_url" \
| cut -d : -f 2,3 \
| tr -d \" \
| wget -qi -
echo '#!/usr/bin/env sh
cd '"$HYPERCUBING_DIR"'/MC4D
java -jar mc4d*.jar' > mc4d
chmod u+x mc4d
cp ../application.desktop "$DESKTOP_FILES"/mc4d.desktop
echo 'Name=Magic Cube 4D
Exec='"$HYPERCUBING_DIR"'/MC4D/mc4d
Icon='"$HYPERCUBING_DIR"'/MC4D/icon.png' >> "$DESKTOP_FILES"/mc4d.desktop
curl -s https://raw.githubusercontent.com/cutelyaware/magiccube4d/master/src/mc4d.png > icon.png


cd "$HYPERCUBING_DIR"
mkdir MC5D
cd MC5D
wget -q http://www.gravitation3d.com/magiccube5d/MagicCube5DInstall.msi
msiextract MagicCube5DInstall.msi
echo '#!/usr/bin/env sh
cd '"$HYPERCUBING_DIR"'/MC5D
WINEPREFIX='"$HYPERCUBING_WINEPREFIX"' wine MagicCube5D.exe' > mc5d
chmod u+x mc5d
cp ../application.desktop "$DESKTOP_FILES"/mc5d.desktop
echo 'Name=Magic Cube 5D
Exec='"$HYPERCUBING_DIR"'/MC5D/mc5d
Icon='"$HYPERCUBING_DIR"'/MC5D/icon.png' >> "$DESKTOP_FILES"/mc5d.desktop
curl -s http://www.gravitation3d.com/magiccube5d/main.png > icon.png

cd "$HYPERCUBING_DIR"
mkdir MC7D
cd MC7D
wget -q https://superliminal.com/andrey/mc7d/MC7D.zip
unzip MC7D.zip
echo '#!/usr/bin/env sh
cd '"$HYPERCUBING_DIR"'/MC7D
MESA_GL_VERSION_OVERRIDE=4.5 WINEPREFIX='"$HYPERCUBING_WINEPREFIX"' wine mc7d.exe' > mc7d
chmod u+x mc7d
cp ../application.desktop "$DESKTOP_FILES"/mc7d.desktop
echo 'Name=Magic Cube 7D
Exec='"$HYPERCUBING_DIR"'/MC7D/mc7d
Icon='"$HYPERCUBING_DIR"'/MC7D/icon.jpg' >> "$DESKTOP_FILES"/mc7d.desktop
curl -s https://superliminal.com/andrey/mc7d/3_7solved.jpg > icon.jpg

cd "$HYPERCUBING_DIR"
mkdir M120C
cd M120C
wget -q http://www.gravitation3d.com/magic120cell/Magic120CellInstall.msi
msiextract Magic120CellInstall.msi
echo '#!/usr/bin/env sh
cd '"$HYPERCUBING_DIR"'/M120C
WINEPREFIX='"$HYPERCUBING_WINEPREFIX"' wine Magic120Cell.exe' > m120c
chmod u+x m120c
cp ../application.desktop "$DESKTOP_FILES"/m120c.desktop
echo 'Name=Magic 120 Cell
Exec='"$HYPERCUBING_DIR"'/M120C/m120c
Icon='"$HYPERCUBING_DIR"'/M120C/icon.jpg' >> "$DESKTOP_FILES"/m120c.desktop
curl -s http://www.gravitation3d.com/magic120cell/pics/4D_Megaminx.jpg > icon.jpg

cd "$HYPERCUBING_DIR"
mkdir MPU
cd MPU
wget -q https://superliminal.com/andrey/mpu/MPUlt.zip
unzip MPUlt.zip
echo '#!/usr/bin/env sh
cd '"$HYPERCUBING_DIR"'/MPU
MESA_GL_VERSION_OVERRIDE=4.5 WINEPREFIX='"$HYPERCUBING_WINEPREFIX"' wine MPUlt_155.exe' > mpu
chmod u+x mpu
cp ../application.desktop "$DESKTOP_FILES"/mpu.desktop
echo 'Name=Magic Puzzle Ultimate
Exec='"$HYPERCUBING_DIR"'/MPU/mpu
Icon='"$HYPERCUBING_DIR"'/MPU/icon.jpg' >> "$DESKTOP_FILES"/mpu.desktop
curl -s https://superliminal.com/andrey/mpu/pic2.jpg > icon.jpg

cd "$HYPERCUBING_DIR"
mkdir MHT
cd MHT
wget -q https://superliminal.com/andrey/mht633/M3dHT633.zip
unzip M3dHT633.zip
echo '#!/usr/bin/env sh
cd '"$HYPERCUBING_DIR"'/MHT
MESA_GL_VERSION_OVERRIDE=4.5 WINEPREFIX='"$HYPERCUBING_WINEPREFIX"' wine m3dht633.exe' > mht
chmod u+x mht
cp ../application.desktop "$DESKTOP_FILES"/mht.desktop
echo 'Name=Magic Hyperbolic Tile
Exec='"$HYPERCUBING_DIR"'/MHT/mht
Icon='"$HYPERCUBING_DIR"'/MHT/icon.jpg' >> "$DESKTOP_FILES"/mht.desktop
curl -s https://superliminal.com/andrey/mht633/pic4.jpg > icon.jpg

cd "$HYPERCUBING_DIR"
mkdir MT
cd MT
wget -q http://roice3.org/magictile/downloads/MagicTile_v2.zip
unzip MagicTile_v2.zip
re='MagicTile_[0-9][0-9]-[0-9][0-9]-[0-9][0-9]'
for dir in *; do
 echo "$dir" | grep "$re" > /dev/null && break
done
echo '#!/usr/bin/env sh
cd '"$HYPERCUBING_DIR"'/MT/'"$dir"'
WINEPREFIX='"$HYPERCUBING_WINEPREFIX"' wine MagicTile.exe' > mt
chmod u+x mt
cp ../application.desktop "$DESKTOP_FILES"/mt.desktop
echo 'Name=Magic Tile
Exec='"$HYPERCUBING_DIR"'/MT/mt
Icon='"$HYPERCUBING_DIR"'/MT/icon.png' >> "$DESKTOP_FILES"/mt.desktop
curl -s https://lh3.googleusercontent.com/pw/AM-JKLUrFyIFR8n6DnRzyJeTDzDTadFqyZXPd--oyxotrIahCMsvmircYLeXzOI2bC_Ix1P7wOMBP2JVcW10Y7KfDTOamVhD_9OcwpXqGFOvUkcBkOcnPu7OIXM7AwoAuc41BYhgFx8qFJmhkSCVUc54BrUJlg=s577-no?authuser=0 > icon.png


rm application.desktop
