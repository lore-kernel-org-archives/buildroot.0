From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 8 Jun 2016 23:27:03 +0200
Subject: [Buildroot] [PATCH]  configs: new configuration for i.MX25 PDK
In-Reply-To: <1465229654-5575-1-git-send-email-fabio.estevam@nxp.com>
References: <1465229654-5575-1-git-send-email-fabio.estevam@nxp.com>
Message-ID: <20160608232703.58b8d89d@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, 6 Jun 2016 13:14:14 -0300, Fabio Estevam wrote:
> Add support for i.MX25 PDK board using U-boot 2016.05 and
> kernel 4.6.1.
> 
> Signed-off-by: Fabio Estevam <fabio.estevam@nxp.com>
> ---
>  board/freescale/imx25pdk/genimage.cfg  | 41 ++++++++++++++++++++++++++
>  board/freescale/imx25pdk/post-image.sh | 16 ++++++++++
>  board/freescale/imx25pdk/readme.txt    | 54 ++++++++++++++++++++++++++++++++++
>  configs/mx25pdk_defconfig              | 34 +++++++++++++++++++++
>  4 files changed, 145 insertions(+)
>  create mode 100644 board/freescale/imx25pdk/genimage.cfg
>  create mode 100755 board/freescale/imx25pdk/post-image.sh
>  create mode 100644 board/freescale/imx25pdk/readme.txt
>  create mode 100644 configs/mx25pdk_defconfig

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
