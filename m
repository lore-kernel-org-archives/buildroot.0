From: Guillaume Dargaud <dargaud@lpsc.in2p3.fr>
Date: Fri, 4 Apr 2008 18:00:00 +0200
Subject: [Buildroot] ARCH=ppc vs powerpc
References: <87ve2xubdp.fsf@macbook.be.48ers.dk>
	<0f4a01c8964f$bbc064b0$f52f9e86@LPSC0173W>
	<20080404141058.GA30388@mx.loc>
Message-ID: <0f8401c8966c$f30cb5f0$f52f9e86@LPSC0173W>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>> Ok. I don't have such an old GCC on my system so I cannot test. Maybe
>>> you will have more luck if you select GCC 3.4.6 in buildroot instead?

OK, big system upgrade, I'm now at gcc 4.1.2 and I seem to be able to 
compile so far (haven't tried the kernel yet).

One thing to note: changing options in menuconfig is often poorly reflected 
in the 'makes' underneath and no amount of 'make clean' or 'make distclean' 
can make it right. Restarting from a clean svn and copying the .config file 
works though, but that's rather a big waste of time like in the case of 
strip/sstrip/none for instance.


Side question: where to best learn how to make a bootable ACE file for the 
Xilinx architecture from a kernel and, I assume, a bootloader ? Or in other 
words, how do I use the U-Boot option of buildroot ?
-- 
Guillaume Dargaud
http://www.gdargaud.net/
