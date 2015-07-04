From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 4 Jul 2015 14:14:07 +0200
Subject: [Buildroot] [PATCH 1/1] package/libdrm: fix building if GCC's C
 standard is not gnu99
In-Reply-To: <1435860302-16176-1-git-send-email-bernd.kuhls@t-online.de>
References: <1435860302-16176-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <20150704141407.5384f7e0@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Bernd Kuhls,

On Thu,  2 Jul 2015 20:05:02 +0200, Bernd Kuhls wrote:
> Fixes
> checking for /home/fli4l/buildroot/output/host/usr/bin/i586-buildroot-linux-uclibc-gcc option to accept ISO C99... unsupported
> configure: error: Building libdrm requires C99 enabled compiler
> 
> using this defconfig
> BR2_KERNEL_HEADERS_4_0=y
> BR2_BINUTILS_VERSION_2_25=y
> BR2_TOOLCHAIN_BUILDROOT_CXX=y
> BR2_PACKAGE_LIBDRM=y
> 
> Patch inspired by
> http://git.buildroot.net/buildroot/commit/?id=5cf5b390385fb6325485e37dc9d38e1e3ac1f091
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
>  package/libdrm/libdrm.mk |    2 ++
>  1 file changed, 2 insertions(+)

Applied, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
