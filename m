From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 23 Nov 2017 21:12:31 +0100
Subject: [Buildroot] [PATCH] configs/imx6ulevk: Add new defconfig
In-Reply-To: <1511447922-12017-1-git-send-email-fabio.estevam@nxp.com>
References: <1511447922-12017-1-git-send-email-fabio.estevam@nxp.com>
Message-ID: <20171123211231.7a298e83@windsurf.lan>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu, 23 Nov 2017 12:38:42 -0200, Fabio Estevam wrote:
> Add support for imx6ulevk_defconfig that allows booting a mainline
> kernel and mainline U-Boot.
> 
> Signed-off-by: Fabio Estevam <fabio.estevam@nxp.com>
> ---
>  .gitlab-ci.yml                       |  1 +
>  DEVELOPERS                           |  1 +
>  board/freescale/imx6ulevk/readme.txt | 10 ++++++++++
>  configs/imx6ulevk_defconfig          | 37 ++++++++++++++++++++++++++++++++++++
>  4 files changed, 49 insertions(+)
>  create mode 100644 configs/imx6ulevk_defconfig

Applied to next, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
