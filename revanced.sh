# Drive id
id="put id here"
cli="cli version"
patches="patches version"
integrations="integrations version"
# Update
echo "Updating"
apt update -y
apt -q install -y git wget nano python3 pip
apt upgrade -y
sleep 3

# Check Java version
sudo apt install -y openjdk-17-jdk
java --version

# Creating Directories
echo "Creating Directories...."
mkdir R_V
cd R_V
sleep 3

# Wget time
echo "wgetttt"

# revanced integrations
wget https://github.com/revanced/revanced-integrations/releases/download/v$integrations/app-release-unsigned.apk

# revanced Patches
wget https://github.com/revanced/revanced-patches/releases/download/v$patches/revanced-patches-$patches.jar

# revanced CLI
wget https://github.com/revanced/revanced-cli/releases/download/v$cli/revanced-cli-$cli-all.jar

sleep 4

# id=input("Enter the file id from Google drive : ")

echo $id
sleep 2
gdown $id

# Renaming files..

echo "Renaming Files.."

mv app-release-unsigned.apk revanced-integrations.apk
mv revanced-cli-$cli-all.jar revanced-cli.jar
mv revanced-patches-$patches.jar revanced-patches.jar

sleep 4

# building
echo "building"
java -jar revanced-cli.jar -a youtube.apk -c -o revanced.apk -b revanced-patches.jar -m revanced-integrations.apk -e hide-infocard-suggestions -e hide-autoplay-button -e disable-create-button -e hide-shorts-button -e hide-cast-button
cd ..
pwd
echo "SucessFull, check if revanced.apk is in the folder 'R_V'"

