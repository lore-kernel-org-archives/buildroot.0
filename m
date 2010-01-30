From: Grant Edwards <grant.b.edwards@gmail.com>
Date: Sat, 30 Jan 2010 19:38:52 +0000 (UTC)
Subject: [Buildroot] Buildroot How-To for QEMU/ARM
References: <413172.3712.qm@web44802.mail.sp1.yahoo.com>
	<hjpohq$hh6$1@ger.gmane.org>
	<121365.32593.qm@web44802.mail.sp1.yahoo.com>
Message-ID: <hk21sc$aqe$1@ger.gmane.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 2010-01-30, Jim Thomas <jimthomasembedded@yahoo.com> wrote:
> Hi Grant,
>
>  > Here's the .config file I last used -- AFAIR it was working at
>  > that point:
>
> I tried your .config file and was still unsuccessful with QEMU.
>
> I diffed your .config file against that produced by 'make
> integrator926_defconfig', and there were no signficant
> differences.
>
> Perhaps I am not having a Buildroot issue, but a QEMU
> invocation issue.
>
> Do you recall the qemu-system-arm invocation that worked for
> you with the Linux kernel and RFS created by buildroot-2009.11?

I was using GIT HEAD and not buildroot-2009.11, but the
invokation was pretty much the same as shown on the web pages:

$ qemu-system-arm -kernel <filename> -initrd <filename>

I also played around with a couple Qemu options to enable more
serial ports that you connected to via telnet, and that all
worked the way it says it in the Qemu docs.

-- 
Grant Edwards                   grante             Yow! I want to kill
                                  at               everyone here with a cute
                               visi.com            colorful Hydrogen Bomb!!
