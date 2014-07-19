From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun, 20 Jul 2014 00:46:00 +0200
Subject: [Buildroot] [PATCH 2/2] xapp_xfs: Fix compile errors after
	libXfont 1.5.0 update
References: <1405809671-4609-1-git-send-email-bernd.kuhls@t-online.de>
 <1405809671-4609-2-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <XnsA3707CC5FD76berndkuhlsPkbjNfxxIA@bernd-kuhls.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Bernd Kuhls <bernd.kuhls@t-online.de> wrote in 
news:1405809671-4609-2-git-send-email-bernd.kuhls at t-online.de:

> -XAPP_XFS_VERSION = 1.1.3
> -XAPP_XFS_SOURCE = xfs-$(XAPP_XFS_VERSION).tar.bz2
> -XAPP_XFS_SITE = http://xorg.freedesktop.org/releases/individual/app
> +#XAPP_XFS_VERSION = 1.1.3
> +#XAPP_XFS_SOURCE = xfs-$(XAPP_XFS_VERSION).tar.bz2
> +#XAPP_XFS_SITE = http://xorg.freedesktop.org/releases/individual/app

Hi,

I had to cherry-pick four upstream patches to make 1.1.3 compile so I chose 
to use their git repo, that?s the reason I left the old lines commented out 
so we can easily revert the git code added by this patch. I hope this is ok.

Regards, Bernd
