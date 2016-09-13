From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 13 Sep 2016 17:34:19 +0200
Subject: [Buildroot] [PATCH] configs/wandboard: Remove
 BR2_LINUX_KERNEL_CUSTOM_GIT
In-Reply-To: <1473715817-1727-1-git-send-email-festevam@gmail.com>
References: <1473715817-1727-1-git-send-email-festevam@gmail.com>
Message-ID: <20160913173419.72e65568@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, 12 Sep 2016 18:30:17 -0300, Fabio Estevam wrote:
> From: Fabio Estevam <fabio.estevam@nxp.com>
> 
> Now that we use a mainline kernel for wandboard, we no longer
> need to select BR2_LINUX_KERNEL_CUSTOM_GIT, so remove it.
> 
> This fixes the following warning:
> 
> make wandboard_defconfig
> /configs/wandboard_defconfig:19:warning: override: BR2_LINUX_KERNEL_CUSTOM_VERSION changes choice state
> #
> # configuration written to /home/fabio/buildroot/.config
> 
> Signed-off-by: Fabio Estevam <fabio.estevam@nxp.com>
> ---
>  configs/wandboard_defconfig | 1 -
>  1 file changed, 1 deletion(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
