From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sat, 10 Jan 2015 22:17:19 +0100
Subject: [Buildroot] [PATCH 1/1] package/glmark2: Fix mesa3d dependency
References: <1420917400-6556-1-git-send-email-bernd.kuhls@t-online.de>
 <20150110210259.6bbf4373@free-electrons.com>
Message-ID: <XnsA41EE2BB5304EberndkuhlsPkbjNfxxIA@bernd-kuhls.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas Petazzoni <thomas.petazzoni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8
@public.gmane.org> wrote in news:20150110210259.6bbf4373 at free-electrons.com:

> I don't really understand: this means that we can't use glmark2 with an
> OpenGL implementation other than Mesa3D ?

Hi Thomas,

yes:
http://article.gmane.org/gmane.comp.lib.uclibc.buildroot/65288/
http://article.gmane.org/gmane.comp.lib.uclibc.buildroot/101953/

Small note:
Since mesa3d is currently the only package activating
BR2_PACKAGE_HAS_LIBGL, the part of the patch which contains
BR2_PACKAGE_MESA3D_DRI_DRIVER could be omitted.

Regards, Bernd
