From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 25 Oct 2019 20:10:55 +0200
Subject: [Buildroot] [PATCH 3/3] package/x11r7/xserver_xorg-server:
 switch to virtual opengl provider
In-Reply-To: <20191023062220.5646-3-bernd.kuhls@t-online.de>
References: <20191023062220.5646-1-bernd.kuhls@t-online.de>
 <20191023062220.5646-3-bernd.kuhls@t-online.de>
Message-ID: <20191025201055.7e357348@windsurf.dhcp.lyon.intranet>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, 23 Oct 2019 08:22:20 +0200
Bernd Kuhls <bernd.kuhls@t-online.de> wrote:

> This allows to use xserver_xorg-server without mesa3d.
> 
> Build-tested using this defconfig:
> 
> BR2_TOOLCHAIN_BUILDROOT_GLIBC=y
> BR2_TOOLCHAIN_BUILDROOT_CXX=y
> BR2_PACKAGE_XORG7=y
> BR2_PACKAGE_XSERVER_XORG_SERVER=y
> BR2_PACKAGE_NVIDIA_DRIVER=y
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
>  package/x11r7/xserver_xorg-server/xserver_xorg-server.mk | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
