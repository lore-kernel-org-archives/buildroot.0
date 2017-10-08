From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 8 Oct 2017 15:55:36 +0200
Subject: [Buildroot] [PATCH] configs/imx6-sabreauto: Add a new defconfig
In-Reply-To: <1506445008-16385-1-git-send-email-fabio.estevam@nxp.com>
References: <1506445008-16385-1-git-send-email-fabio.estevam@nxp.com>
Message-ID: <20171008155536.4cb34d2a@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, 26 Sep 2017 13:56:48 -0300, Fabio Estevam wrote:
> From: Fabio Estevam <festevam@gmail.com>
> 
> Introduce imx6-sabreauto_defconfig that uses mainline U-Boot and
> mainline kernel.
> 
> As mainline U-Boot supports SPL, it is possible to boot the same
> sdcard.img in the three mx6sabreauto variants: imx6q, imx6dl and imx6qp.
> 
> Also update the readme.txt file to explain how to build an image for
> mx6sabreauto boards using mainline U-Boot and kernel.
> 
> Signed-off-by: Fabio Estevam <festevam@gmail.com>
> ---
>  board/freescale/imx6sabre/readme.txt | 25 ++++++++++++++++++++++--
>  configs/imx6-sabreauto_defconfig     | 38 ++++++++++++++++++++++++++++++++++++
>  2 files changed, 61 insertions(+), 2 deletions(-)
>  create mode 100644 configs/imx6-sabreauto_defconfig

Applied to master, after updating the .gitlab-ci.yml file. Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
