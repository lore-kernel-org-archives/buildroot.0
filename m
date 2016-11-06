From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 6 Nov 2016 23:01:33 +0100
Subject: [Buildroot] [PATCH] olimex_a20_olinuxino_lime_mali: bump u-boot
 to 2016.09.01
In-Reply-To: <1478443131-1912-1-git-send-email-francois.perrad@gadz.org>
References: <1478443131-1912-1-git-send-email-francois.perrad@gadz.org>
Message-ID: <20161106230133.1868c025@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun,  6 Nov 2016 15:38:51 +0100, Francois Perrad wrote:
> U-Boot KConfig allows to take care of CONFIG_OLD_SUNXI_KERNEL_COMPAT
> in order to properly start the kernel (Error: unrecognized/unsupported machine ID)
> 
> Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
> ---
>  configs/olimex_a20_olinuxino_lime_defconfig      | 3 ++-
>  configs/olimex_a20_olinuxino_lime_mali_defconfig | 6 ++++--
>  2 files changed, 6 insertions(+), 3 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
