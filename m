From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 6 Aug 2014 23:03:39 +0200
Subject: [Buildroot] [PATCH] configs/imx233_olinuxino: bump to kernel
 3.16
In-Reply-To: <1407357831-20429-1-git-send-email-gustavo@zacarias.com.ar>
References: <1407357831-20429-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <20140806230339.7cb3fa75@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Gustavo Zacarias,

On Wed,  6 Aug 2014 17:43:51 -0300, Gustavo Zacarias wrote:
> Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
> ---
>  .../imx233_olinuxino/{linux-3.13.config => linux-3.16.config}     | 4 +---
>  configs/olimex_imx233_olinuxino_defconfig                         | 8 ++++----
>  2 files changed, 5 insertions(+), 7 deletions(-)
>  rename board/olimex/imx233_olinuxino/{linux-3.13.config => linux-3.16.config} (98%)

Applied, thanks!

>  BR2_LINUX_KERNEL_PATCH="http://github.com/koliqi/imx23-olinuxino/raw/3.12-rc2/kernel/101-soc-audio-dts.patch http://github.com/koliqi/imx23-olinuxino/raw/3.12-rc2/kernel/ASoC_driver_for_i.MX233.patch"

So those patches are still needed?

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
