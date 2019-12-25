From: Michael Nazzareno Trimarchi <michael@amarulasolutions.com>
Date: Wed, 25 Dec 2019 22:48:54 +0100
Subject: [Buildroot] [PATCH 1/2] board/imx6-sabresd: Fix the Qt5 display
 names
In-Reply-To: <20191223122253.8238-1-festevam@gmail.com>
References: <20191223122253.8238-1-festevam@gmail.com>
Message-ID: <CAOf5uwmXQyxu6yV3tgWs4cejdjrQKgtwJ3XQwHXdnx-2OgEnjQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Fabio and Jagan

On Mon, Dec 23, 2019 at 1:23 PM Fabio Estevam <festevam@gmail.com> wrote:
>
> The correct syntax that Qt5 understands for display names is
> "HDMI1" and "LVDS1", so fix it accordingly.
>
> Signed-off-by: Fabio Estevam <festevam@gmail.com>
> ---
>  board/freescale/imx6-sabresd/rootfs_overlay/root/sabresd.json | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/board/freescale/imx6-sabresd/rootfs_overlay/root/sabresd.json b/board/freescale/imx6-sabresd/rootfs_overlay/root/sabresd.json
> index d5d063af87..fe92ce5b29 100644
> --- a/board/freescale/imx6-sabresd/rootfs_overlay/root/sabresd.json
> +++ b/board/freescale/imx6-sabresd/rootfs_overlay/root/sabresd.json
> @@ -4,11 +4,11 @@
>    "pbuffers": true,
>    "outputs": [
>      {
> -      "name": "HDMI-1",
> +      "name": "HDMI1",
>        "mode": "off"
>      },
>      {
> -      "name": "LVDS-1",
> +      "name": "LVDS1",
>        "mode": "1024x768"
>      }
>    ]

Do the engicam board has the same problem? I can not test right now

Michael
> --
> 2.17.1
>
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot



-- 
| Michael Nazzareno Trimarchi                     Amarula Solutions BV |
| COO  -  Founder                                      Cruquiuskade 47 |
| +31(0)851119172                                 Amsterdam 1018 AM NL |
|                  [`as] http://www.amarulasolutions.com               |
