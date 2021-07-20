From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 20 Jul 2021 21:27:38 +0200
Subject: [Buildroot] [PATCH v2] board/mx6cubox: Switch to extlinux.conf
In-Reply-To: <20210719195537.3794060-1-festevam@gmail.com>
References: <20210719195537.3794060-1-festevam@gmail.com>
Message-ID: <20210720212738.2da6f1b6@windsurf>
List-Id: <buildroot.busybox.net>
To: buildroot@busybox.net
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Mon, 19 Jul 2021 16:55:37 -0300
Fabio Estevam <festevam@gmail.com> wrote:

> Currently mx6cubox uses a custom boot.scr.txt script
> and custom image generation scripts: genimage.cfg, post-build.sh
> and post-image.sh.
> 
> Switch to using the more standard extlinux.conf solution
> and remove the custom scripts in favor of the standard
> board/freescale/common/imx/post-image.sh one.
> 
> Signed-off-by: Fabio Estevam <festevam@gmail.com>
> ---
> Changes since v1:
> - Fix the console variable to avoid passing the baudrate twice:
> console=ttymxc0,115200,115200

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
