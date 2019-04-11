From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 11 Apr 2019 14:22:57 +0200
Subject: [Buildroot] [PATCH] package/libselinux: bump version to 2.9
In-Reply-To: <20190408185013.71465-3-aduskett@gmail.com>
References: <20190408185013.71465-1-aduskett@gmail.com>
 <20190408185013.71465-3-aduskett@gmail.com>
Message-ID: <20190411142257.34f4dcd7@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon,  8 Apr 2019 14:50:06 -0400
aduskett at gmail.com wrote:

> From: Adam Duskett <Aduskett@gmail.com>
> 
> Other changes:
>  - Remove upstream patch
>  - Add PYTHON=$(LIBSELINUX_PYLIBVER) to LIBSELINUX_MAKE_OPTS
>  - Add PYTHON=$(HOST_LIBSELINUX_PYLIBVER) to HOST_LIBSELINUX_MAKE_OPTS
> 
> The python changes are necessary because libselinux python tools now defaults
> to python3.
> 
> Signed-off-by: Adam Duskett <Aduskett@gmail.com>
> ---
>  ...-break-around-__atomic_-with-GCC-4.7.patch | 70 -------------------
>  package/libselinux/libselinux.hash            |  2 +-
>  package/libselinux/libselinux.mk              |  6 +-
>  3 files changed, 5 insertions(+), 73 deletions(-)
>  delete mode 100644 package/libselinux/0003-Fix-build-break-around-__atomic_-with-GCC-4.7.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
