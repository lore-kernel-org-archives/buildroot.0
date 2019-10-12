From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sat, 12 Oct 2019 16:04:04 +0200
Subject: [Buildroot] [PATCH v2 3/4] package/mesa3d: add xlib_libXv
 dependency to mesa3d xvmc
References: <20191005094818.1956334-1-romain.naour@gmail.com>
 <20191005094818.1956334-3-romain.naour@gmail.com>
Message-ID: <k3397gx8vh.ln2@ID-313208.user.individual.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Am Sat, 05 Oct 2019 11:48:17 +0200 schrieb Romain Naour:

>  .../0004-meson-Link-xvmc-with-libxv.patch     | 78 +++++++++++++++++++

Hi Romain,

when mesa3d is bumped to 19.2.1[1] it is not needed anymore to add patch 
0004.

Regards, Bernd

[1] http://patchwork.ozlabs.org/patch/1175718/
