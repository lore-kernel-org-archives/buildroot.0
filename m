From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 24 Mar 2020 22:05:22 +0100
Subject: [Buildroot] [PATCH 1/1] configs/freescale_imx6ullevk: new
 defconfig
In-Reply-To: <20200323210122.471254-1-fabrice.goucem@oss.nxp.com>
References: <20200323210122.471254-1-fabrice.goucem@oss.nxp.com>
Message-ID: <20200324220522.5142662b@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, 23 Mar 2020 22:01:22 +0100
Fabrice Goucem <fabrice.goucem@oss.nxp.com> wrote:

> Add basic support for NXP's i.MX6 ULL EVK board:
> 
> https://www.nxp.com/design/development-boards/i.mx-evaluation-and-development-boards/evaluation-kit-for-the-i.mx-6ull-and-6ulz-applications-processor:MCIMX6ULL-EVK
> 
> Signed-off-by: Fabrice Goucem <fabrice.goucem@oss.nxp.com>
> Signed-off-by: Fabrice Goucem <fabrice.goucem@nxp.com>
> ---
>  .gitlab-ci.yml                         |  1 +
>  DEVELOPERS                             |  4 ++
>  board/freescale/imx6ullevk/readme.txt  | 61 ++++++++++++++++++++++++++
>  configs/freescale_imx6ullevk_defconfig | 24 ++++++++++
>  4 files changed, 90 insertions(+)
>  create mode 100644 board/freescale/imx6ullevk/readme.txt
>  create mode 100644 configs/freescale_imx6ullevk_defconfig

Applied to master, thanks for your contribution!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
