From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Fri, 3 Jun 2016 00:48:02 +0200
Subject: [Buildroot] [PATCH] imx53loco: Fix post-image.sh permission
In-Reply-To: <1464906172-6285-1-git-send-email-festevam@gmail.com>
References: <1464906172-6285-1-git-send-email-festevam@gmail.com>
Message-ID: <20160602224802.GF3714@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fabio, All,

On 2016-06-02 19:22 -0300, Fabio Estevam spake thusly:
> Fix post-image.sh permission to avoid the following error:
> 
> >>>   Executing post-image script board/freescale/imx53loco/post-image.sh
> /bin/bash: board/freescale/imx53loco/post-image.sh: Permission denied
> 
> Signed-off-by: Fabio Estevam <festevam@gmail.com>

Acked-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

Regards,
Yann E. MORIN.

> ---
>  board/freescale/imx53loco/post-image.sh | 0
>  1 file changed, 0 insertions(+), 0 deletions(-)
>  mode change 100644 => 100755 board/freescale/imx53loco/post-image.sh
> 
> diff --git a/board/freescale/imx53loco/post-image.sh b/board/freescale/imx53loco/post-image.sh
> old mode 100644
> new mode 100755
> -- 
> 1.9.1
> 
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
