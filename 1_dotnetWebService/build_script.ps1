$buildFolder="publish";
$appFolder="QdasTraceabilityWebApp";
$docFolder="..\instructionDocs";
$instructionFolder ="wwwroot\instructions\";
$dbscriptFileLocation = "..\DatabaseSript.sql"
rm -r $appFolder ;
mkdir $appFolder ;
dotnet publish -c Release -r win-x64 -p:PublishSingleFile=true --self-contained true -o $buildFolder ;
#dotnet publish -c Release -r linux-x64 --self-contained true -o $buildFolder; #not working
mv $buildFolder\* $appFolder ;
#update Database script
#cp -Force $dbscriptFileLocation ..\installationSupportItems
#prepare the docs 
#cd $docFolder;
#hugo
#cp public/* ..\dotnetWebService\$instructionFolder -Force
#rm -r public/*
#cd ..\dotnetWebService
# collect all items for creating the package
#cp -r wwwroot $appFolder;
#cp -r DataStorage $appFolder;
#cp ServerConfig.json $appFolder;
#cp QdasConfig.toml $appFolder;
Compress-Archive -Path $appFolder , 
                StartUpScript.cmd `
                -DestinationPath $appFolder".zip";
rm -r $appFolder\* ;