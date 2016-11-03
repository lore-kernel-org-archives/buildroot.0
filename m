From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 3 Nov 2016 22:16:15 +0100
Subject: [Buildroot] [PATCH 1/2] configs: Remove udoo_quad_defconfig
In-Reply-To: <1478198417-12732-1-git-send-email-fabio.estevam@nxp.com>
References: <1478198417-12732-1-git-send-email-fabio.estevam@nxp.com>
Message-ID: <20161103221615.1a9b2d92@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu, 3 Nov 2016 16:40:16 -0200, Fabio Estevam wrote:
> configs/mx6udoo_defconfig supports the quad and dual-lite variants,
> so there is no need to keep udoo_quad_defconfig anymore.
> 
> Signed-off-by: Fabio Estevam <fabio.estevam@nxp.com>
> ---
>  configs/udoo_quad_defconfig | 29 -----------------------------
>  1 file changed, 29 deletions(-)
>  delete mode 100644 configs/udoo_quad_defconfig

Both applied, thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
