From: IaMaPlAyEr <iamaplayer@gmail.com>
Date: Wed, 15 Apr 2009 14:43:29 +0800
Subject: [Buildroot] problems about some bin utilities(with unknown
	capability)
Message-ID: <2ae8403e0904142343s2afe5044n80a6c68d652849d5@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi All,


Recently I find a strange thing when i use buildroot.
after several reconfigure the component of buildroot, i make it again and
again.


at a time I examine the file gdbserver:
~/src/buildroot_0411/project_build_mipsel/uclibc/root/usr/bin$ file
gdbserver
gdbserver: ELF 32-bit LSB executable, MIPS, MIPS32 version 1 (SYSV),
dynamically linked (uses shared libs), with unknown capability 0xf41 =
0x756e6700, stripped

but I really remembered that I examine before, there is no things like
this:  *with unknown capability 0xf41 = 0x756e6700*.
before this time, I copied this file "gdbserver" to another place, so, I
check it:

$ file gdbserver
gdbserver: ELF 32-bit LSB executable, MIPS, MIPS32 version 1 (SYSV),
dynamically linked (uses shared libs), stripped




and now I remved all directory related to my build, and rebuild it again
with no .config changed to confirm this problem.


thanks.

-- 
--
Sincerly,

HaveF
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20090415/9b3a5d0b/attachment-0001.htm>
