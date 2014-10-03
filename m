From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Fri, 03 Oct 2014 14:52:12 +0200
Subject: [Buildroot] [PATCH 01/11] mesa3d: Fix package requirements
References: <1412340212-3089-1-git-send-email-jezz@sysmic.org>
 <1412340212-3089-2-git-send-email-jezz@sysmic.org>
Message-ID: <XnsA3BB97440D8C9berndkuhlsPkbjNfxxIA@bernd-kuhls.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

=?UTF-8?q?J=C3=A9r=C3=B4me=20Pouiller?= <jezz-
kPcTzGkeZgAdnm+yROfE0A@public.gmane.org> wrote in news:1412340212-3089-2-git-
send-email-jezz at sysmic.org:

> +     select BR2_PACKAGE_XPROTO_DRI3PROTO if BR2_PACKAGE_XORG7

Hi,

nack, dri3 is an optional dependency.

Also having dri3 support in mesa3d breaks xbmc on intel systems:
https://github.com/OpenELEC/OpenELEC.tv/commit/b574ad91fe9c7b9fcf627df0d5e3c7
7e262a1f85

Regards, Bernd
