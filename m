From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 21 Jun 2017 16:19:37 +0200
Subject: [Buildroot] [PATCH RESEND v2] imx6q-sabresd: Add a qt5
 defconfig variant
In-Reply-To: <1498048346-1326-1-git-send-email-fabio.estevam@nxp.com>
References: <1498048346-1326-1-git-send-email-fabio.estevam@nxp.com>
Message-ID: <20170621161937.1d14f804@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, 21 Jun 2017 09:32:26 -0300, Fabio Estevam wrote:

> +BR2_PACKAGE_MESA3D=y
> +BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_ETNAVIV=y
> +BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_SWRAST=y
> +BR2_PACKAGE_MESA3D_DRI_DRIVER_SWRAST=y

Just curious, why are you enabling the swrast drivers here?

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
