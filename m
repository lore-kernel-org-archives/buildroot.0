From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 16 Jul 2020 09:23:17 +0200
Subject: [Buildroot] [PATCH] configs/imx6ullevk: Add new defconfig
In-Reply-To: <20200716002559.19530-1-festevam@gmail.com>
References: <20200716002559.19530-1-festevam@gmail.com>
Message-ID: <20200716092317.1045f351@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, 15 Jul 2020 21:25:59 -0300
Fabio Estevam <festevam@gmail.com> wrote:

> Add support for imx6ullevk_defconfig that allows booting a mainline
> kernel and mainline U-Boot.
> 
> Signed-off-by: Fabio Estevam <festevam@gmail.com>
> ---
>  .gitlab-ci.yml                        |  1 +
>  DEVELOPERS                            |  1 +
>  board/freescale/imx6ullevk/readme.txt | 10 ++++++++
>  configs/imx6ullevk_defconfig          | 37 +++++++++++++++++++++++++++
>  4 files changed, 49 insertions(+)
>  create mode 100644 configs/imx6ullevk_defconfig

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
