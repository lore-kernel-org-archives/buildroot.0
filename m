From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 25 Jul 2016 22:36:15 +0200
Subject: [Buildroot] [PATCH 4/4] configs: Add new configuration for
 i.MX6UL Pico board
In-Reply-To: <1469404570-19495-4-git-send-email-festevam@gmail.com>
References: <1469404570-19495-1-git-send-email-festevam@gmail.com>
 <1469404570-19495-4-git-send-email-festevam@gmail.com>
Message-ID: <20160725223615.4cf2afb2@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun, 24 Jul 2016 20:56:10 -0300, Fabio Estevam wrote:
> From: Fabio Estevam <fabio.estevam@nxp.com>
> 
> Add support for Technexion's i.MX6UL Pico board running U-boot 2016.07
> and kernel 4.7.
> 
> For information about this board, please visit:
> http://www.wandboard.org/images/hobbit/hobbitboard-imx6ul-reva1.pdf
> 
> Signed-off-by: Fabio Estevam <fabio.estevam@nxp.com>
> ---
>  board/technexion/imx6ulpico/genimage.cfg  | 41 +++++++++++++++++++++
>  board/technexion/imx6ulpico/post-image.sh | 16 +++++++++
>  board/technexion/imx6ulpico/readme.txt    | 59 +++++++++++++++++++++++++++++++
>  configs/imx6ulpico_defconfig              | 34 ++++++++++++++++++
>  4 files changed, 150 insertions(+)
>  create mode 100644 board/technexion/imx6ulpico/genimage.cfg
>  create mode 100755 board/technexion/imx6ulpico/post-image.sh
>  create mode 100644 board/technexion/imx6ulpico/readme.txt
>  create mode 100644 configs/imx6ulpico_defconfig

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
