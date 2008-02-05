From: Ivan Kuten <ivan.kuten@promwad.com>
Date: Tue, 05 Feb 2008 14:00:47 +0200
Subject: [Buildroot] X11R7 on ARM
In-Reply-To: <b47ad75d0802050226u65a6f337i11fe7df4e7b3cc25@mail.gmail.com>
References: <b47ad75d0802050226u65a6f337i11fe7df4e7b3cc25@mail.gmail.com>
Message-ID: <47A84FEF.2010702@promwad.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Gernot Kvas wrote:
> Hello,
> 
> The version of X11R7 (Release 7.2) fails to work properly on ARM.
> Reason for this is some missing defines that have been fixed years ago
> for xfree86 [1]. Are there plans to pump the version to 7.3? I
> compared xserver code (1.2.0 and 1.4) and 1.4 includes these fixes.
> Anyone working on a more recent X11R7 package in buildroot?
> 
> As a sidenote, has anyone successfully tried to mate a PCI-card with
> an ARM and X11?
> 
> Cheers,
> 
> Gernot
> 
> [1] http://www.mail-archive.com/debian-x at lists.debian.org/msg31585.html
> _______________________________________________
> buildroot mailing list
> buildroot at uclibc.org
> http://busybox.net/mailman/listinfo/buildroot


Hi,

Actually I tried only framebuffer on ARM - with a little handwork X11R7 7.2 is working.
As far as I know there no such plans because X11R7 7.2 is not stabilized.
Your patches are welcome.

Regards,
Ivan
