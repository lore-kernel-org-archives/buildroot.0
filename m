From: Michael Trimarchi <trimarchimichael@yahoo.it>
Date: Fri, 26 Dec 2008 19:24:12 +0000 (GMT)
Subject: [Buildroot] R:  AT91SAM9G20 build .config for linux-2.6.26
In-Reply-To: <49552B28.5040203@soft-in.com>
Message-ID: <787962.90753.qm@web23507.mail.ird.yahoo.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

--- Ven 26/12/08, Mauro Condarelli <mcondarelli@soft-in.com> ha scritto:

> Da: Mauro Condarelli <mcondarelli@soft-in.com>
> Oggetto: [Buildroot] AT91SAM9G20 build .config for linux-2.6.26
> A: buildroot at uclibc.org
> Data: Venerd? 26 dicembre 2008, 20:06
> Hi,
> I've been trying to build the whole kernel+rootfs
> system for my
> AT91SAM9G20-EK Rev.B EVA board several times now and always
> failing, for
> one reason or the other.
> 
> I tried both the straight instructions from
> buildroot.uclibc.org and
> those from www.linux4sam.org.
> 
> I have a working set bootstrap+uboot+linux-2.6.25+rootfs
> BINARY ONLY!
> 
> I am (for the time being) happy with the first two steps
> and I'm trying
> to setup a net boot with tftp+nfs.
> I have been able to set-up a server with working tftpd+nfsd
> that will
> boot the original stuff.
> 

The rootfs is one thing. The kernel is another one. You can compile
the kernel outside the buildroot project using the same toolchain, start
from the config file of 2.6.25 distribuition.

Michael



      
