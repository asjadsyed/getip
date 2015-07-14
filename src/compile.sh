#!/bin/bash

if [ ! -f nuget.exe ]; then
	echo Downloading nuget
	wget -c https://nuget.org/nuget.exe
fi

if [ ! -d Mono.Nat.* ]; then
	echo Downloading Mono.Nat
	mono nuget.exe install mono.nat
fi
mononat=$(echo Mono.Nat.* | cut -f 1 -d ' ')
echo Compiling getexip
mcs -r:$mononat/lib/net40/Mono.Nat.dll getexip.cs -out:../bin/getexip
echo Compiling getinip
mcs -r:$mononat/lib/net40/Mono.Nat.dll getinip.cs -out:../bin/getinip
echo Compiling lspf
mcs -r:$mononat/lib/net40/Mono.Nat.dll lspf.cs -out:../bin/lspf
#mcs -r:$mononat/lib/net40/Mono.Nat.dll lspf.cs
#mcs -r:$mononat/lib/net40/Mono.Nat.dll lspf.cs
#mcs -r:$mononat/lib/net40/Mono.Nat.dll lspf.cs

if [ ! -d ILRepack.* ]; then
	echo Downloading ILRepack
	mono nuget.exe install ilrepack
fi
ilrepack=$(echo ILRepack.* | cut -f 1 -d ' ')
echo Repacking getexip
mono $ilrepack/tools/ILRepack.exe -out:../bin/getexip ../bin/getexip $mononat/lib/net40/Mono.Nat.dll
echo Repacking getinip
mono $ilrepack/tools/ILRepack.exe -out:../bin/getinip ../bin/getinip $mononat/lib/net40/Mono.Nat.dll
echo Repacking lspf
mono $ilrepack/tools/ILRepack.exe -out:../bin/lspf ../bin/lspf $mononat/lib/net40/Mono.Nat.dll
#echo Repacking getexip
#mono $ilrepack/tools/ILRepack.exe -out:../bin/getexip getexip $mononat/lib/net40/Mono.Nat.dll
#echo Repacking getexip
#mono $ilrepack/tools/ILRepack.exe -out:../bin/getexip getexip $mononat/lib/net40/Mono.Nat.dll
#echo Repacking getexip
#mono $ilrepack/tools/ILRepack.exe -out:../bin/getexip getexip $mononat/lib/net40/Mono.Nat.dll

echo Installing to /usr/bin/
echo Copying getexip
sudo cp ../bin/getexip /usr/bin/
echo Copying getinip
sudo cp ../bin/getinip /usr/bin/
echo Copying lspf
sudo cp ../bin/lspf /usr/bin/



