From: Gilles Chanteperdrix <gilles.chanteperdrix@xenomai.org>
Date: Thu, 24 Mar 2016 11:30:00 +0100
Subject: [Buildroot] syslinux using host compiler.
Message-ID: <20160324103000.GK22286@hermes.click-hack.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

I am new to buildroot, and have been working for about two weeks
with it, and everything seems to be working fine so far.

I have a question however: why is syslinux (and grub2 for that
matter, I guess) built with the host toolchain? I can understand
that some tools (such as isohybrid) need to be executed on the host,
but the final binaries are for the target. So, does not that call
for having a separate host-syslinux and syslinux packages like other
packages do? 

The current setup only works if the host is x86.

I am using an x86_64 toolchain generated with ct-ng, did not enable
multilib, and syslinux seems to have no problem compiling with that
toolchain, which seems normal, since the boot code should not be
using the libc anyway.

So, what am I missing?

Thanks in advance.
Regards.

-- 
					    Gilles.
https://click-hack.org
