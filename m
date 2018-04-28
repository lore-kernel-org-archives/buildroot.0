From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 28 Apr 2018 23:40:33 +0200
Subject: [Buildroot] [PATCH v2] imx-alsa-plugins: new package
In-Reply-To: <20180201132629.13188-1-joerg.krause@embedded.rocks>
References: <20180201132629.13188-1-joerg.krause@embedded.rocks>
Message-ID: <20180428234033.385df291@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Gary,

Since you often look after all the Freescale/NXP stuff, would you mind
reviewing this patch from J?rg ?

You can also find it on patchwork at
https://patchwork.ozlabs.org/patch/868232/.

Thanks!

Thomas

On Thu,  1 Feb 2018 14:26:29 +0100, J?rg Krause wrote:
> Freescale specific alsa-lib plugins for the i.MX processor family.
> 
> For now, the only provided plugin is:
>   * Rate Converter Plugin Using Freescale ASRC Resampler
> 
> The ASRC hardware resampler can be found on i.MX53 and most i.MX 6
> processors.
> 
> Signed-off-by: J?rg Krause <joerg.krause@embedded.rocks>
> ---
> v2:
>  * Fix comment sections (Marcus Folkesson and Baruch Siach)
> ---
>  package/freescale-imx/Config.in                    |  1 +
>  package/freescale-imx/imx-alsa-plugins/Config.in   | 25 ++++++++++++++++++++++
>  .../imx-alsa-plugins/imx-alsa-plugins.hash         |  3 +++
>  .../imx-alsa-plugins/imx-alsa-plugins.mk           | 21 ++++++++++++++++++
>  4 files changed, 50 insertions(+)
>  create mode 100644 package/freescale-imx/imx-alsa-plugins/Config.in
>  create mode 100644 package/freescale-imx/imx-alsa-plugins/imx-alsa-plugins.hash
>  create mode 100644 package/freescale-imx/imx-alsa-plugins/imx-alsa-plugins.mk

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
