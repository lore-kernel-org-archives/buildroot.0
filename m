From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 28 Oct 2014 22:02:24 +0100
Subject: [Buildroot] [PATCH v3 3/7] package/tvheadend: Needs iconv()
In-Reply-To: <1413311309-30811-3-git-send-email-bernd.kuhls@t-online.de>
References: <1413311309-30811-1-git-send-email-bernd.kuhls@t-online.de>
 <1413311309-30811-3-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <20141028220224.1d4af140@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Bernd Kuhls,

On Tue, 14 Oct 2014 20:28:25 +0200, Bernd Kuhls wrote:
> Fixes
> CC              src/intlconv.o
> src/intlconv.c:1:19: fatal error: iconv.h: No such file or directory
>  #include <iconv.h>
> 
> with this defconfig
> 
> BR2_arm=y
> BR2_cortex_a15=y
> BR2_TOOLCHAIN_BUILDROOT_LARGEFILE=y
> BR2_TOOLCHAIN_BUILDROOT_INET_IPV6=y
> BR2_TOOLCHAIN_BUILDROOT_INET_RPC=y
> BR2_TOOLCHAIN_BUILDROOT_WCHAR=y
> BR2_TOOLCHAIN_BUILDROOT_CXX=y
> BR2_PACKAGE_TVHEADEND=y
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>

Applied, thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
