From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 15 Mar 2019 21:38:08 +0100
Subject: [Buildroot] [PATCH 1/1] package/mesa3d: bump version to 19.0.0
In-Reply-To: <20190315180659.21182-1-bernd.kuhls@t-online.de>
References: <20190315180659.21182-1-bernd.kuhls@t-online.de>
Message-ID: <20190315213808.39ada044@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri, 15 Mar 2019 19:06:59 +0100
Bernd Kuhls <bernd.kuhls@t-online.de> wrote:

> We keep using autotools and switch to meson in a later patch after
> upstream deprecated autotools:
> https://lists.freedesktop.org/archives/mesa-announce/2019-March/000501.html
> 
> Imx winsys was removed:
> https://cgit.freedesktop.org/mesa/mesa/commit/?h=19.0&id=41a0acd6a149ec9f47ea527ad08a2b29bf1ee6b2
> 
> Patch 0004 removed, applied upstream.
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
>  package/mesa3d-headers/mesa3d-headers.mk      |  2 +-
>  ...sing-include-stddef.h-in-egldevice.h.patch | 47 -------------------
>  package/mesa3d/mesa3d.hash                    | 10 ++--
>  package/mesa3d/mesa3d.mk                      |  7 ++-
>  4 files changed, 11 insertions(+), 55 deletions(-)
>  delete mode 100644 package/mesa3d/0004-egl-add-missing-include-stddef.h-in-egldevice.h.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
