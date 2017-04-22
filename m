From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 22 Apr 2017 15:05:55 +0200
Subject: [Buildroot] [PATCH 1/1] uboot: fix target uboot defconfig
 warning
In-Reply-To: <20170421195707.5238-1-christian@paral.in>
References: <20170421195707.5238-1-christian@paral.in>
Message-ID: <20170422150555.4fc487ab@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri, 21 Apr 2017 15:57:07 -0400, Christian Stewart wrote:
> The warning currently reads:
> 
>   No board defconfig name specified, check your
>   BR2_TARGET_UBOOT_DEFCONFIG setting.
> 
> It should read:
> 
>   No board defconfig name specified, check your
>   BR2_TARGET_UBOOT_BOARD_DEFCONFIG setting.
> 
> Signed-off-by: Christian Stewart <christian@paral.in>
> ---
>  boot/uboot/uboot.mk | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
