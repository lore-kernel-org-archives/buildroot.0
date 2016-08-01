From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 1 Aug 2016 22:10:03 +0200
Subject: [Buildroot] [PATCH] configs: warpboard: Select wireless related
 packages
In-Reply-To: <1470065942-25454-1-git-send-email-festevam@gmail.com>
References: <1470065942-25454-1-git-send-email-festevam@gmail.com>
Message-ID: <20160801221003.04391862@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon,  1 Aug 2016 12:39:02 -0300, Fabio Estevam wrote:
> From: Fabio Estevam <fabio.estevam@nxp.com>
> 
> Let the wireless packages be selected by default to make the
> usage of Wifi a bit simpler.
> 
> Suggested-by: Peter Korsgaard <peter@korsgaard.com>
> Signed-off-by: Fabio Estevam <fabio.estevam@nxp.com>
> ---
>  board/freescale/warpboard/README | 2 --
>  configs/warpboard_defconfig      | 5 +++++
>  2 files changed, 5 insertions(+), 2 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
