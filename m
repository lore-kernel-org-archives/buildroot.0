From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 29 Jul 2014 23:39:59 +0200
Subject: [Buildroot] [PATCH 0/2] xdriver_xf86-video-intel: Bump version
 to 2.99.914, add DRI3 support
In-Reply-To: <1406669656-15300-1-git-send-email-bernd.kuhls@t-online.de>
References: <1406669656-15300-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <20140729233959.35c8c511@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Bernd Kuhls,

Adding Ben in Cc.

On Tue, 29 Jul 2014 23:34:14 +0200, Bernd Kuhls wrote:

> this small series bumps xdriver_xf86-video-intel to the latest version.
> While being at it, add DRI3 support to X.org server so the intel driver
> can pick it up. The patch for xdriver_xf86-video-intel should be one
> commit, although addressing various topics, because it would otherwise
> fail at configure stage because of newly introduced DRI checks.

[...]

> Bernd Kuhls (2):
>   xserver_xorg-server: Add support for DRI3
>   xdriver_xf86-video-intel: Bump version to 2.99.914

Thanks, both patches applied.

Ben, can you test the latest Buildroot master, and see if it works for
you?

Thanks a lot!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
