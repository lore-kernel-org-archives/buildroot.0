From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 28 May 2016 19:17:59 +0200
Subject: [Buildroot] [PATCH] configs: zynq: revive
 BR2_LINUX_KERNEL_UIMAGE
In-Reply-To: <1464442602-24726-1-git-send-email-yamada.masahiro@socionext.com>
References: <1464442602-24726-1-git-send-email-yamada.masahiro@socionext.com>
Message-ID: <20160528191759.7d830bd1@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sat, 28 May 2016 22:36:42 +0900, Masahiro Yamada wrote:
> Commit 5c67cb1d0445 ("linux: use zImage by default on ARM") changed
> the default kernel image, but missed to update Zynq defconfigs.
> 
> U-Boot on Zynq boards still loads uImage, so BR2_LINUX_KERNEL_UIMAGE
> should be defined to generate uImage.
> 
> Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
> ---
>  configs/zynq_microzed_defconfig | 1 +
>  configs/zynq_zc706_defconfig    | 1 +
>  configs/zynq_zed_defconfig      | 1 +
>  3 files changed, 3 insertions(+)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
