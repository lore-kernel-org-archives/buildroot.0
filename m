From: Ossy <ossy1980@gmx.net>
Date: Mon, 26 Jul 2010 22:31:26 +0200
Subject: [Buildroot] [git commit master 1/1] u-boot: add Marvell
 u-boot.kwb support
In-Reply-To: <20100726141846.1699E8262B@busybox.osuosl.org>
References: <20100726141846.1699E8262B@busybox.osuosl.org>
Message-ID: <4C4DF09E.502@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Am 26.07.2010 16:14, schrieb Peter Korsgaard:
>
> commit: http://git.buildroot.net/buildroot/commit/?id=3cd5174ed796400a9566c0ea52f3551cba52bfe0
> branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master
>
> Marvell boards like the sheevaplug needs a special .kwb image format,
> so add an option for it similar to how we handle zImage/uImage/..
> for the kernel.
>

Just for documentation if someone searches the mailingarchive:
I run a plain vanilla u-boot with a minor patch in bin-format on my 
seagate dockstar (sheevaplug with less memory). But this is chainloaded 
by the proprietary u-boot. So at least for this configuration you are 
not forced to use the .kwb format.


@Peter:
Please note my patch for applying patches to u-boot. The current git 
tree includes a typo. I corrected it and submitted the patch more than 
once to the mailinglist (see attachement).

The solution is rather forward and the patch is tested (only two 
modified lines).

Kind regards,
Marcus
-------------- next part --------------
An embedded message was scrubbed...
From: Ossy <ossy1980@gmx.net>
Subject: [Buildroot] [PATCH] apply custom patches correctly to u-boot
Date: Wed, 07 Jul 2010 22:55:55 +0200
Size: 6342
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20100726/6fc01c14/attachment-0001.mht>
