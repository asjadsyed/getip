getip is a simple tool to retrieve your external ip address from the router  

 
getip relies on two things:   
* that your router supports UPnP  
* that you have a CLR (Common Language Runtime) installed, such as the .NET Framework for Windows, or Mono for Linux/Mac OS X/Windows. <br />


on linux, you can just install the package <code>mono-runtime</code> to install mono  
<code>
$ sudo apt-get install mono-runtime  
</code><br />
mono is also downloadable from their website:  
* <a href="http://www.mono-project.com/download/#download-mac">download for mac</a>
* <a href="http://www.mono-project.com/download/#download-lin">download for linux</a>
* <a href="http://www.mono-project.com/download/#download-win">download for windows</a>

to download and run getip: 
  <pre><code>
  open a terminal<br />
  $ cd Downloads<br />
  $ wget https://github.com/asjadsyed/getip/archive/master.zip -O getip.zip<br />
  $ unzip getip.zip<br />
  $ rm getip.zip<br />
  $ cd getip-master/Linux/<br />
  $ mono getip<br />
  </code></pre>

getip will now search for routers until it finds one  
if it doesn't, you either:  
  * can't access the internet, or  
  * your router doesn't support the UPnP Protocol  

to install getip so that you can run it from any folder:  
<code>
sudo cp getip /usr/bin/
</code>

to download and compile getip:  
* first, make sure you have the <code>mono-devel</code> package  
<code>
$ sudo apt-get install mono-devel  
</code><br />
* then download and prepare to compile
<pre><code>
$ cd Downloads<br />
$ wget https://github.com/asjadsyed/getip/archive/master.zip -O getip.zip<br />
$ unzip getip.zip<br />
$ rm getip.zip<br />
$ cd getip-master/Source/<br />
</code></pre>
* compile<br />
<pre><code>
$ mcs GetIP.cs -r:Mono.Nat.dll -out:getip<br />
</code></pre>
you now have a binary named getip, but it needs to have the Mono.Nat.dll file in the same directory as it.  
you can merge the binary so that it is standalone and contains Mono.Nat within it using <a href="https://github.com/gluck/il-repack">ILRepack</a>, but this has alreday been done for you in the Linux/ folder

getip relies on <a href="https://github.com/mono/Mono.Nat">Mono.Nat</a>, a UPnP library, to communicate with your router  
you do not need to install anything for this  
for the linux binary, Mono.Nat has been combined into the original binary using <a href="https://github.com/gluck/il-repack">ILRepack</a>  
on windows, you need to make sure the Mono.Nat.dll file stays in the same folder as GetIP.exe  
  
