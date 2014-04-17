From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 17 Apr 2014 23:02:52 +0200
Subject: [Buildroot] [PATCH 0/14 v3] Add virtual package for full-openGL
 (branch yem/opengl)
In-Reply-To: <cover.1397750571.git.yann.morin.1998@free.fr>
References: <cover.1397750571.git.yann.morin.1998@free.fr>
Message-ID: <20140417230252.487fea1c@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Yann E. MORIN,

On Thu, 17 Apr 2014 18:04:21 +0200, Yann E. MORIN wrote:

> Yann E. MORIN (13):
>       package/libdrm: radeon does not depend on x86
>       package/xdriver_xf86-video-ati: only select libdrm if the DRI driver is enabled
>       package/x11-video-drivers: do not select, but depends on mesa3d
>       package/mesa3d: re-arrange menu items
>       package/mesa3d: DRI drivers depend on X.org
>       package/mesa3d: add comment for when OpenGL EGL is not available
>       package/mesa3d: simplify the code enabling full-OpenGL
>       package/mesa3d: only enable full OpenGL when a DRI driver is enabled
>       package/xorg-server: do not force-select xf86driproto for mesa3d
>       package/libgl: introduce as a new virtual package for full-openGL providers
>       package/mesa3d: with a DRI driver, is a full OpenGL provider
>       package/libevas: switch dependency from mesa3d to _HAS_LIBGL
>       package/vlc: depends on the virtual package libgl

Series applied, thanks. I'll make a few comments on some of the
patches, as there might be some additional followup patches needed.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
