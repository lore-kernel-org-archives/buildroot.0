From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 26 Dec 2019 20:44:22 +0100
Subject: [Buildroot] [PATCH] board/icorem6: Fix the Qt5 display name
In-Reply-To: <20191226133227.12023-1-festevam@gmail.com>
References: <20191226133227.12023-1-festevam@gmail.com>
Message-ID: <20191226204422.65a5762e@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, 26 Dec 2019 10:32:27 -0300
Fabio Estevam <festevam@gmail.com> wrote:

> The correct syntax that Qt5 understands for display names is
> "LVDS1", so fix it accordingly.
> 
> Reported-by: Michael Trimarchi <michael@amarulasolutions.com>
> Signed-off-by: Fabio Estevam <festevam@gmail.com>
> ---
>  .../icorem6/rootfs_overlay/root/imx6qdl-icore-ofcap10.json      | 2 +-
>  .../icorem6/rootfs_overlay/root/imx6qdl-icore-ofcap12.json      | 2 +-
>  board/engicam/icorem6/rootfs_overlay/root/imx6qdl-icore.json    | 2 +-
>  3 files changed, 3 insertions(+), 3 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
