From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Fri, 03 Oct 2014 16:45:12 +0200
Subject: [Buildroot] [PATCH 01/11] mesa3d: Fix package requirements
References: <1412340212-3089-1-git-send-email-jezz@sysmic.org>
 <XnsA3BB97440D8C9berndkuhlsPkbjNfxxIA@bernd-kuhls.de>
 <3045501.26YYGqRTnd@sagittea> <1923213.bFy6dBPsRI@sagittea>
Message-ID: <XnsA3BBAA6C3899DberndkuhlsPkbjNfxxIA@bernd-kuhls.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

J?r?me Pouiller <jezz@sysmic.org> wrote in
news:1923213.bFy6dBPsRI at sagittea: 

> Arf, this was fixed by d0edceb ("mesa3d: fix build without dri
> drivers"), but this breaks xdriver_xf86-video-imx DRI support.

Hi,

what about adding

depends on BR2_PACKAGE_XPROTO_DRI3PROTO

to package/x11r7/xdriver_xf86-video-imx-viv/Config.in?

Regards, Bernd
