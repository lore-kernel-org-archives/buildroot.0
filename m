From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 1 Aug 2016 21:37:20 +0200
Subject: [Buildroot] [PATCH] post-image: Drop unneeded exit statement
In-Reply-To: <1470071848-27587-1-git-send-email-festevam@gmail.com>
References: <1470071848-27587-1-git-send-email-festevam@gmail.com>
Message-ID: <20160801213720.5180186c@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon,  1 Aug 2016 14:17:28 -0300, Fabio Estevam wrote:
> From: Fabio Estevam <fabio.estevam@nxp.com>
> 
> There is no need for the 'exit' statement in the post-image scripts,
> so just remove it.
> 
> Signed-off-by: Fabio Estevam <fabio.estevam@nxp.com>
> ---
>  board/freescale/imx25pdk/post-image.sh    | 2 --
>  board/freescale/imx51evk/post-image.sh    | 2 --
>  board/freescale/imx53loco/post-image.sh   | 2 --
>  board/freescale/imx6ulevk/post-image.sh   | 2 --
>  board/freescale/imx7dsdb/post-image.sh    | 2 --
>  board/technexion/imx6ulpico/post-image.sh | 2 --
>  6 files changed, 12 deletions(-)

Applied to master, after reworking the commit title.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
