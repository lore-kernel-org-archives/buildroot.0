From: Guillaume Dargaud <dargaud@lpsc.in2p3.fr>
Date: Fri, 25 Apr 2008 10:25:57 +0200
Subject: [Buildroot] [buildroot 0001615]: Can not build?
References: <d9108c1a28f74978335988de086eeb18@busybox.net>
Message-ID: <08f001c8a6ad$ff56a2c0$ad289e86@LPSC0173W>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

I've had this eabi problem too when trying to use the Xilinx compilers and 
toolchain from .../xilinx/edk/gnu/powerpc-eabi/lin/bin/
I exchanged some messages with tech support that kind of hinted that I 
wouldn't be able to compile a kernel with it (I have no idea why). So I did 
it with the buildroot toolchain instead and haven't looked back.

I also noticed those ARM keywords at the time, I think they go away if you 
"make ARCH=ppc".
-- 
Guillaume Dargaud
http://www.gdargaud.net/ 
