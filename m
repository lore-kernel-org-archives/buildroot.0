From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 3 Oct 2016 23:14:36 +0200
Subject: [Buildroot] [PATCH] configs/imx6ulpico: Use common script for
 image generation
In-Reply-To: <1475436657-16369-1-git-send-email-festevam@gmail.com>
References: <1475436657-16369-1-git-send-email-festevam@gmail.com>
Message-ID: <20161003231436.793e9b18@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun,  2 Oct 2016 16:30:57 -0300, Fabio Estevam wrote:
> From: Fabio Estevam <fabio.estevam@nxp.com>
> 
> Using the common board/freescale/common/post-image.sh can lead
> to some good amount of simplification.
> 
> Signed-off-by: Fabio Estevam <fabio.estevam@nxp.com>
> ---
>  board/technexion/imx6ulpico/genimage.cfg  | 41 -------------------------------
>  board/technexion/imx6ulpico/post-image.sh | 14 -----------
>  configs/imx6ulpico_defconfig              |  2 +-
>  3 files changed, 1 insertion(+), 56 deletions(-)
>  delete mode 100644 board/technexion/imx6ulpico/genimage.cfg
>  delete mode 100755 board/technexion/imx6ulpico/post-image.sh

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
