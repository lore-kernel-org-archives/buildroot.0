From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 1 Nov 2020 10:02:01 +0100
Subject: [Buildroot] [PATCH 1/1] package/mesa3d: bump version to 20.2.1
In-Reply-To: <20201101084657.755734-1-bernd.kuhls@t-online.de>
References: <20201101084657.755734-1-bernd.kuhls@t-online.de>
Message-ID: <20201101100201.5ca827d0@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sun,  1 Nov 2020 09:46:57 +0100
Bernd Kuhls <bernd.kuhls@t-online.de> wrote:

> Rebased patch 0002 & 0003, added patch 0004 to fix build error.
> 
> Switched license file to license.rst due to upstream commit
> https://cgit.freedesktop.org/mesa/mesa/commit/?id=4d066836e3cf307431a74eafcc8a404ce5ccea69
> "No modification to the generated results have been done."
> 
> Switched true/false configure option values to enabled/disabled due to
> upstream commit:
> https://cgit.freedesktop.org/mesa/mesa/commit/?id=138c003d22739b0d1e6860ed398dd511a44cde04
> 
> Remove "MESA3D_PLATFORMS += drm", this platform is now automatically
> selected:
> https://cgit.freedesktop.org/mesa/mesa/commit/?id=e00adef34a5ce485e2c9216a268ca05e89a5fc98
> 
> Remove "MESA3D_PLATFORMS += surfaceless", this platform is now
> automatically selected:
> https://cgit.freedesktop.org/mesa/mesa/commit/?id=a38e21d6683aeecb51aea4f933a77c6e7f1a6179
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
>  package/mesa3d-headers/mesa3d-headers.mk      |  2 +-
>  ...t-proper-value-for-LIBCLC_INCLUDEDIR.patch | 14 +--
>  ...tion-to-disable-optional-neon-suppor.patch |  8 +-
>  ...r-Include-stddef.h-to-fix-build-erro.patch | 40 +++++++++
>  package/mesa3d/mesa3d.hash                    |  8 +-
>  package/mesa3d/mesa3d.mk                      | 86 +++++++------------
>  6 files changed, 90 insertions(+), 68 deletions(-)
>  create mode 100644 package/mesa3d/0004-src-util-rand_xor-Include-stddef.h-to-fix-build-erro.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
