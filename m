From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 4 Oct 2015 16:19:05 +0100
Subject: [Buildroot] [PATCH v2 1/4] toolchain-external: Remove
 BLACKFIN_UCLINUX_2012R2
In-Reply-To: <1443901828-11390-1-git-send-email-maxime.hadjinlian@gmail.com>
References: <1443901828-11390-1-git-send-email-maxime.hadjinlian@gmail.com>
Message-ID: <20151004161905.60263d38@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Maxime Hadjinlian,

On Sat,  3 Oct 2015 21:50:25 +0200, Maxime Hadjinlian wrote:
> Signed-off-by: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
> ---
>  toolchain/toolchain-external/Config.in             | 19 -------------------
>  toolchain/toolchain-external/toolchain-external.mk |  8 ++------
>  2 files changed, 2 insertions(+), 25 deletions(-)

Patches 1 to 3 applied. However patch 4 not applied since the "select
BR2_PACKAGE_LIBTIRPC" is not needed and the same change should be done
in mpd (and possibly other reverse dependencies of libnfs, if any other
than kodi and mpd).

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
