From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 22 Nov 2017 21:38:25 +0100
Subject: [Buildroot] [PATCH] configs/imx6sx-sdb: Add new defconfig
In-Reply-To: <1511356872-8417-1-git-send-email-festevam@gmail.com>
References: <1511356872-8417-1-git-send-email-festevam@gmail.com>
Message-ID: <20171122213825.1747ad00@windsurf.lan>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, 22 Nov 2017 11:21:12 -0200, Fabio Estevam wrote:
> From: Fabio Estevam <fabio.estevam@nxp.com>
> 
> Add support for imx6sx-sdb_defconfig that allows booting a mainline
> kernel and mainline U-Boot.
> 
> Signed-off-by: Fabio Estevam <fabio.estevam@nxp.com>
> ---
>  .gitlab-ci.yml                       |  1 +
>  DEVELOPERS                           |  1 +
>  board/freescale/imx6sxsdb/readme.txt | 14 ++++++++++++++
>  configs/imx6sx-sdb_defconfig         | 26 ++++++++++++++++++++++++++
>  4 files changed, 42 insertions(+)
>  create mode 100644 board/freescale/imx6sxsdb/readme.txt
>  create mode 100644 configs/imx6sx-sdb_defconfig

Applied to next, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
