From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 5 Sep 2016 17:45:32 +0200
Subject: [Buildroot] [PATCH 1/1] package/mesa3d: bump version to 12.0.2
In-Reply-To: <20160905153739.30453-1-bernd.kuhls@t-online.de>
References: <20160905153739.30453-1-bernd.kuhls@t-online.de>
Message-ID: <20160905174532.702aaf92@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon,  5 Sep 2016 17:37:39 +0200, Bernd Kuhls wrote:
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
>  package/mesa3d/mesa3d.hash | 4 ++--
>  package/mesa3d/mesa3d.mk   | 2 +-
>  2 files changed, 3 insertions(+), 3 deletions(-)

You forgot the mesa3d-headers update.

>  # When updating the version, please also update mesa3d-headers

^^^ see here :-)

> -MESA3D_VERSION = 12.0.1
> +MESA3D_VERSION = 12.0.2
>  MESA3D_SOURCE = mesa-$(MESA3D_VERSION).tar.xz
>  MESA3D_SITE = ftp://ftp.freedesktop.org/pub/mesa/$(MESA3D_VERSION)
>  MESA3D_LICENSE = MIT, SGI, Khronos

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
