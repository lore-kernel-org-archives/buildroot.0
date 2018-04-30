From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 30 Apr 2018 17:56:24 +0200
Subject: [Buildroot] [PATCH v2] imx-alsa-plugins: new package
In-Reply-To: <20180201132629.13188-1-joerg.krause@embedded.rocks>
References: <20180201132629.13188-1-joerg.krause@embedded.rocks>
Message-ID: <20180430175624.6bb33528@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

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

Thanks Gary for the review of the patch. I've removed the part of the
Config.in help text that you thought was no longer needed.

I've also added an entry to the DEVELOPERS file, which was missing.

And I've applied. Thanks J?rg for the contribution!

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
