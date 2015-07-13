getip is a simple tool to retrieve your external ip address from the router  
  
getip relies on two things:   
  that your router supports UPnP  
  that you can run it in a CLR (Common Language Runtime), such as the .NET Framework on Windows, or Mono on Linux  
    as long as you have either one installed, you can run getip  
    on linux, you can install the package mono-runtime to install mono  
    $ sudo apt-get install mono-runtime  
  
to run getip as if you have only downloaded the zip file:  
  open a terminal  
  $ cd Downloads  
  $ unzip getip-master.zip  
  $ cd getip-master/Linux/  
  $ mono getip  
  
getip will now search for routers until it finds one  
if it doesn't, you either:  
  can't access the internet, or  
  your router doesn't support the UPnP Protocol  
    
getip relies on Mono.Nat, a UPnP library, to communicate with your router  
you do not need to install anything for this  
for the linux binary, Mono.Nat has been combined into the original binary using ILRepack  
on windows, you need to make sure the Mono.Nat.dll file stays in the same folder as GetIP.exe  
  
