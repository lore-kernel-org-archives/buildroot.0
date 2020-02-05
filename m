From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 5 Feb 2020 12:12:58 +0100
Subject: [Buildroot] [PATCH 7/7] board/freescale/imx8qxpmek: update
 instructions
In-Reply-To: <20190909121525.13935-7-maeva.manuel@nxp.com>
References: <20190909121525.13935-1-maeva.manuel@nxp.com>
 <20190909121525.13935-7-maeva.manuel@nxp.com>
Message-ID: <20200205121258.2466188e@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, 9 Sep 2019 12:15:09 +0000
Maeva Manuel <maeva.manuel@nxp.com> wrote:

> 	The ahab-container.img has been replaced by
> 	mx8qx-ahab-container.img because of the i.MX8QM support
> 
> Signed-off-by: Maeva Manuel <maeva.manuel@nxp.com>
> ---
>  board/freescale/imx8qxpmek/readme.txt | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/board/freescale/imx8qxpmek/readme.txt b/board/freescale/imx8qxpmek/readme.txt
> index 45f7915fe4..e10138f8f8 100644
> --- a/board/freescale/imx8qxpmek/readme.txt
> +++ b/board/freescale/imx8qxpmek/readme.txt
> @@ -17,7 +17,8 @@ Build all components:
>    make
>  
>  You will find in output/images/ the following files:
> -  - ahab-container.img
> +
> +  - mx8qx-ahab-container.img

Since I did not take your commit for the firmware-imx update, this
change is not needed. Indeed the bump in
3ec818769d5140f337684d8c35497ca940bffa34 and the following fix in
571b8ca09563ffa97a1d0df2fa076530426ab8da ensure that the name is still
ahab-container.img.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
