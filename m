From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 25 Jul 2017 20:45:07 +0200
Subject: [Buildroot] [PATCH] configs/warp7: Bump U-Boot and kernel
 versions
In-Reply-To: <1501001269-2452-1-git-send-email-fabio.estevam@nxp.com>
References: <1501001269-2452-1-git-send-email-fabio.estevam@nxp.com>
Message-ID: <20170725204507.0500ddb1@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, 25 Jul 2017 13:47:49 -0300, Fabio Estevam wrote:
> From: Fabio Estevam <festevam@gmail.com>
> 
> Bump U-Boot to 2017.07 and kernel to version 4.12.3.
> 
> As imx_v6_v7_defconfig in 4.12 selects CONFIG_CFG80211_WEXT=y,
> remove the linux.fragment file.
> 
> Signed-off-by: Fabio Estevam <festevam@gmail.com>
> ---
>  board/warp7/linux.fragment | 1 -
>  configs/warp7_defconfig    | 9 ++++-----
>  2 files changed, 4 insertions(+), 6 deletions(-)
>  delete mode 100644 board/warp7/linux.fragment

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
