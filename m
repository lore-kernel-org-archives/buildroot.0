From: Michael Nazzareno Trimarchi <michael@amarulasolutions.com>
Date: Thu, 26 Dec 2019 14:39:41 +0100
Subject: [Buildroot] [PATCH] board/icorem6: Fix the Qt5 display name
In-Reply-To: <20191226133227.12023-1-festevam@gmail.com>
References: <20191226133227.12023-1-festevam@gmail.com>
Message-ID: <CAOf5uw=TDJShmAhBvK5R6uWpAAWAmR8X3ENyjtc8T8kcR4KxaA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

HI

On Thu, Dec 26, 2019 at 2:32 PM Fabio Estevam <festevam@gmail.com> wrote:
>
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
>
> diff --git a/board/engicam/icorem6/rootfs_overlay/root/imx6qdl-icore-ofcap10.json b/board/engicam/icorem6/rootfs_overlay/root/imx6qdl-icore-ofcap10.json
> index 963c7c0031..3bfe4a2362 100644
> --- a/board/engicam/icorem6/rootfs_overlay/root/imx6qdl-icore-ofcap10.json
> +++ b/board/engicam/icorem6/rootfs_overlay/root/imx6qdl-icore-ofcap10.json
> @@ -4,7 +4,7 @@
>    "pbuffers": true,
>    "outputs": [
>      {
> -      "name": "LVDS-1",
> +      "name": "LVDS1",
>        "mode": "1280x800"
>      }
>    ]
> diff --git a/board/engicam/icorem6/rootfs_overlay/root/imx6qdl-icore-ofcap12.json b/board/engicam/icorem6/rootfs_overlay/root/imx6qdl-icore-ofcap12.json
> index 36700affda..ea5ce6f97a 100644
> --- a/board/engicam/icorem6/rootfs_overlay/root/imx6qdl-icore-ofcap12.json
> +++ b/board/engicam/icorem6/rootfs_overlay/root/imx6qdl-icore-ofcap12.json
> @@ -4,7 +4,7 @@
>    "pbuffers": true,
>    "outputs": [
>      {
> -      "name": "LVDS-1",
> +      "name": "LVDS1",
>        "mode": "1280x480"
>      }
>    ]
> diff --git a/board/engicam/icorem6/rootfs_overlay/root/imx6qdl-icore.json b/board/engicam/icorem6/rootfs_overlay/root/imx6qdl-icore.json
> index ac139a3eaf..b4fa359b64 100644
> --- a/board/engicam/icorem6/rootfs_overlay/root/imx6qdl-icore.json
> +++ b/board/engicam/icorem6/rootfs_overlay/root/imx6qdl-icore.json
> @@ -4,7 +4,7 @@
>    "pbuffers": true,
>    "outputs": [
>      {
> -      "name": "LVDS-1",
> +      "name": "LVDS1",
>        "mode": "800x480"
>      }
>    ]
> --

Reviewed-by: Michael Trimarchi <michael@amarulasolutions.com>

Michael

> 2.17.1
>


-- 
| Michael Nazzareno Trimarchi                     Amarula Solutions BV |
| COO  -  Founder                                      Cruquiuskade 47 |
| +31(0)851119172                                 Amsterdam 1018 AM NL |
|                  [`as] http://www.amarulasolutions.com               |
