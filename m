From: Ruud Commandeur <RCommandeur@clb.nl>
Date: Fri, 13 Sep 2013 09:00:19 +0200
Subject: [Buildroot] C++ Compiling
Message-ID: <15AE5A936F5E3A42A9144E66875A0A8934DC07@server1-derijp.CLB-Benelux.lokaal>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Everyone,
 
This week I tried build my 1st aplication using boost. Adding the boost
part was easy from buildroot, but when trying to build the application,
I get "Relocations in generic ELF" and "could not read symbols: File in
wrong format".
 
Obviously, this has to do with cross-compiling. When compiling a
C-source, it uses arm-none-linux-gnueabi-gcc. But for a cpp it uses g++,
resulting in an Intel 80386 object file. Looking at the internet, I read
about an otion called "Toolchain has C++ support?". This must be the one
to use, but I can't find it. Neither in the Toolchain section nor the
System configuration.
 
I am using Buildroot 2013.02 with CodeSourcery (Sourcery Codebench) for
ARM 2012.03.
 
Can anyone tell me how to configure this?
 
Thanks,
 
Ruud
 
