From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 23 Dec 2019 21:02:41 +0100
Subject: [Buildroot] [PATCH 1/2] board/imx6-sabresd: Fix the Qt5 display
 names
In-Reply-To: <20191223122253.8238-1-festevam@gmail.com>
References: <20191223122253.8238-1-festevam@gmail.com>
Message-ID: <20191223210241.1854296c@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, 23 Dec 2019 09:22:52 -0300
Fabio Estevam <festevam@gmail.com> wrote:

> The correct syntax that Qt5 understands for display names is
> "HDMI1" and "LVDS1", so fix it accordingly.
> 
> Signed-off-by: Fabio Estevam <festevam@gmail.com>
> ---
>  board/freescale/imx6-sabresd/rootfs_overlay/root/sabresd.json | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)

Both applied. Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
