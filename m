From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 19 May 2018 22:06:06 +0200
Subject: [Buildroot] [PATCH 1/3] imx-gpu-viv: add Wayland backend option
In-Reply-To: <20180516155201.10279-2-gary.bisson@boundarydevices.com>
References: <20180516155201.10279-1-gary.bisson@boundarydevices.com>
 <20180516155201.10279-2-gary.bisson@boundarydevices.com>
Message-ID: <20180519220606.27013976@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, 16 May 2018 17:51:59 +0200, Gary Bisson wrote:
> This package has been tested with Wayland back-end using weston-imx
> repository on a i.MX6Q Nitrogen6x:
> https://source.codeaurora.org/external/imx/weston-imx/
> (tag rel_imx_4.9.51_8mq_ga to work with both i.MX6 and i.MX8MQ)
> 
> Weston was started as follows:
>  # export XDG_RUNTIME_DIR=/tmp
>  # weston --tty=1 --device=/dev/fb0
> 
> Finally the Vivante sample apps were started from weston-terminal:
>  # cd /usr/share/examples/viv_samples/vdk/
>  # ./tutorial7
> 
> Signed-off-by: Gary Bisson <gary.bisson@boundarydevices.com>
> ---
>  package/freescale-imx/imx-gpu-viv/Config.in      | 10 +++++++++-
>  package/freescale-imx/imx-gpu-viv/imx-gpu-viv.mk | 10 ++++++++++
>  2 files changed, 19 insertions(+), 1 deletion(-)

Applied to next, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
