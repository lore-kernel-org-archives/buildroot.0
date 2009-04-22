From: Will Moore <will.moore@beran.co.uk>
Date: Wed, 22 Apr 2009 16:32:54 +0100
Subject: [Buildroot] How to incorporate linux kernel patch correctly
In-Reply-To: <87zle8oiz4.fsf@macbook.be.48ers.dk>
References: <49CB469A.5080404@eclis.ch><20090422124829.GA28316@cbg.dyndns.org>
	<1240404749.7072.1.camel@sven><49EF2669.7010607@eclis.ch>
	<87zle8oiz4.fsf@macbook.be.48ers.dk>
Message-ID: <066C96D66D20444B9FCC41A62BC2BA97@AP366>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Is there a buildroot user mail list where I might get assistance but not
disturb the developers?  I looked but could not find so, apologies ...

I am using buildroot 2009.02 release and have successfully produced a linux
kernel, rootfs and cross tool kit for a 486 SX PC104 PC104 CPU.  I need to
apply a patch to the 2.6.24 kernel and have initially used a kernel .config
provided by the PC104 manufacturer which I did by manually applying the
patch in project_build_486/uclibc/linux-2.6.24 and copying the kernel
.config there too.  I can see that there is support in the buildroot menu
Kernel->Patches for Additional patch to apply (from $(DL_DIR)) but when I
put the kernel patch file in /dl and entered the filename in the menu
configuration buildroot complained:

Make: *** No rule to make target 'patch-2.4.6-DMP', needed by
'../project_build_i486/uclibc/linux-2.6.24/.patched'.  Stop.

Your assistance to better understand how to get buildroot to automatically
apply a kernel patch would be appreciated.

Regards


Will
