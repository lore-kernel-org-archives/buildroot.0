From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 11 Jul 2020 16:11:51 +0200
Subject: [Buildroot] [PATCH v3 2/4] package/freescale-imx/firmware-imx:
 Fix sdma/vpu firmware install path
In-Reply-To: <1594382445-4464-3-git-send-email-stephane.viau@oss.nxp.com>
References: <1594382445-4464-1-git-send-email-stephane.viau@oss.nxp.com>
 <1594382445-4464-3-git-send-email-stephane.viau@oss.nxp.com>
Message-ID: <20200711161151.59240311@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri, 10 Jul 2020 14:00:43 +0200
Stephane Viau <stephane.viau@oss.nxp.com> wrote:

> In a patch set that did not get in for other reasons, Sebastien proposed
> to fix the install path directory of the sdma and vpu firmware code [1]:
> 
> 	"Mainline and NXP kernels expect the sdma firmware to be in
> 	/lib/firmware/imx/sdma so fix the install path [...]"
> 
> By looking at the code, I believe this is correct even though I have no
> means to test it.
> 
> [1] http://lists.busybox.net/pipermail/buildroot/2020-June/284875.html
> 
> Suggested-by: S?bastien Szymanski <sebastien.szymanski@armadeus.com>
> Signed-off-by: Stephane Viau <stephane.viau@oss.nxp.com>
> ---
>  package/freescale-imx/firmware-imx/firmware-imx.mk | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
