From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 28 Nov 2015 14:31:57 +0100
Subject: [Buildroot] [PATCH v2/next 1/1] package/swig: bump version to
 3.0.7
In-Reply-To: <1448711539-24295-1-git-send-email-bernd.kuhls@t-online.de>
References: <1448711539-24295-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <20151128143157.439059ac@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Bernd Kuhls,

On Sat, 28 Nov 2015 12:52:19 +0100, Bernd Kuhls wrote:
> This patch bumps the swig package to the current major release, the
> comment about the CMake fix was also updated to reflect the version
> bump. Swig 3.0.7 was positively tested using this defconfig:
> 
> BR2_TOOLCHAIN_BUILDROOT_INET_RPC=y
> BR2_TOOLCHAIN_BUILDROOT_LOCALE=y
> BR2_TOOLCHAIN_BUILDROOT_CXX=y
> BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_EUDEV=y
> BR2_PACKAGE_KODI=y
> BR2_PACKAGE_KODI_LIBCEC=y
> BR2_PACKAGE_TRACE_CMD=y
> BR2_PACKAGE_MESA3D=y
> BR2_PACKAGE_MESA3D_DRI_DRIVER_I965=y
> BR2_PACKAGE_XORG7=y
> BR2_PACKAGE_LIBFTDI1=y
> BR2_PACKAGE_LIBFTDI1_PYTHON_BINDINGS=y
> BR2_PACKAGE_LIBSEMANAGE=y
> BR2_PACKAGE_GNURADIO=y
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
>  package/swig/swig.hash |  2 +-
>  package/swig/swig.mk   | 21 +++++++++++----------
>  2 files changed, 12 insertions(+), 11 deletions(-)

Applied to next, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
