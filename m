From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 22 Jun 2020 22:49:18 +0200
Subject: [Buildroot] [PATCH 1/3] package/freescale-imx/firmware-imx:
 install sdma firmware for i.MX8M{, M, N}
In-Reply-To: <20200615130633.19909-1-sebastien.szymanski@armadeus.com>
References: <20200615130633.19909-1-sebastien.szymanski@armadeus.com>
Message-ID: <20200622224918.0bda44c3@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, 15 Jun 2020 15:06:31 +0200
S?bastien Szymanski <sebastien.szymanski@armadeus.com> wrote:

> i.MX8M, i.MX8MM and i.MX8MN have sdma controllers so install sdma
> firmware for these SoCs. Mainline and NXP kernels expect the sdma
> firmware to be in /lib/firmware/imx/sdma so fix the install path at the
> same time.
> 
> Signed-off-by: S?bastien Szymanski <sebastien.szymanski@armadeus.com>
> ---
>  .../freescale-imx/firmware-imx/firmware-imx.mk  | 17 +++++------------
>  1 file changed, 5 insertions(+), 12 deletions(-)

Due to the feedback from Fabio and Gary, I marked this patch and PATCH
2/3 as Changes Requested.

Overall, I think firmware-imx.mk is pretty messy in terms of how it
describes what needs to be installed for each platform. It probably
needs to be cleaned up to allow to more easily support more
capabilities on more platforms.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
