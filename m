From: Kelvin Cheung <keguang.zhang@gmail.com>
Date: Tue, 17 Nov 2009 09:20:36 +0800
Subject: [Buildroot] ldd disappearing from rootfs
In-Reply-To: <4B01CC01.2000907@free.fr>
References: <4B01CC01.2000907@free.fr>
Message-ID: <48ab7e010911161720s40f6f5fey694e1f9271e336b7@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The same thing happened to me.

2009/11/17 Julien Boibessot <julien.boibessot@free.fr>

> Hi,
>
> While searching why ldd disappeared from the /usr/bin/ of my target
> since I updated my Buildroot, I found that the rule installing it was
> commented by this commit:
>
> http://git.buildroot.net/buildroot/commit/?id=cb815ae003d40cc971d6e214415c10e9a160ba82
> (last chunk of the commit)
>
> Yes, I know, it's quite old now, but the ldd disappearing is on my TODO
> list since ages :-)
> Do somebody recall why this line was commented out ? (I don't see the
> link with the commit title)
>
> I have put Ivan (the author of the commit) in copy.
>
> Regards,
> Julien
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
>
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20091117/418b111b/attachment.htm>
