From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 18 Jul 2015 23:19:09 +0200
Subject: [Buildroot] [PATCH v4 6/7] zedboard: Patch default U-Boot
 environment for zedboard
In-Reply-To: <20150714171608.5d71bdcf@pcviktorin.fit.vutbr.cz>
References: <20150714171214.706e9e4d@pcviktorin.fit.vutbr.cz>
 <20150714171608.5d71bdcf@pcviktorin.fit.vutbr.cz>
Message-ID: <20150718231909.5eaa407a@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Jan Viktorin,

On Tue, 14 Jul 2015 17:16:08 +0200, Jan Viktorin wrote:
> This patch changes the U-Boot's default environment to
> boot Zedboard out-of-the-box from SD card.
> 
> The sdboot procedure tries to load a file system.bit into
> the Zynq's PL (only if it exists). It is also possible to
> alter the booting by an uEnv.txt file located on your SD card.
> The uEnv.txt is a plain text file with <key>=<value> pairs
> one per line.
> 
> Signed-off-by: Jan Viktorin <viktorin@rehivetech.com>
> ---
>  ...eate-zedboard-specific-U-Boot-environment.patch | 46 ++++++++++++++++++++++
>  configs/zedboard_defconfig                         |  1 +
>  2 files changed, 47 insertions(+)
>  create mode 100644 board/avnet/zedboard/uboot/0001-zynq-Create-zedboard-specific-U-Boot-environment.patch

Applied, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
