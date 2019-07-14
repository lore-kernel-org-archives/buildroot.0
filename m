From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 14 Jul 2019 16:00:22 +0200
Subject: [Buildroot] [PATCH 1/2] package/imx-uuc: fix static build with
 musl
In-Reply-To: <20190707135533.15376-1-fontaine.fabrice@gmail.com>
References: <20190707135533.15376-1-fontaine.fabrice@gmail.com>
Message-ID: <20190714160022.4cf9a9d4@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sun,  7 Jul 2019 15:55:32 +0200
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> Use TARGET_CONFIGURE_OPTS to pass -static in LDFLAGS when building
> statically
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/12c08173f83315fb68fe3c3d34a78ed919ba5a79
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/freescale-imx/imx-uuc/imx-uuc.mk | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Both applied. Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
