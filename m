From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 25 Jul 2016 23:30:01 +0200
Subject: [Buildroot] [PATCH] warpboard: Generate an sdcard image
In-Reply-To: <1469481193-18041-1-git-send-email-festevam@gmail.com>
References: <1469481193-18041-1-git-send-email-festevam@gmail.com>
Message-ID: <20160725233001.38db6752@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, 25 Jul 2016 18:13:13 -0300, Fabio Estevam wrote:
> From: Fabio Estevam <fabio.estevam@nxp.com>
> 
> Generate an sdcard.img image to make it easier the deployment of a
> Buildroot image.
> 
> Signed-off-by: Fabio Estevam <fabio.estevam@nxp.com>

"configs/warpboard:" for the commit prefix.

>  board/freescale/warpboard/genimage.cfg  | 41 +++++++++++++++++++++++++++++++++
>  board/freescale/warpboard/post-image.sh | 16 +++++++++++++
>  configs/warpboard_defconfig             | 10 ++++++++

An update to board/freescale/warpboard/README would be relevant as part
of this commit.

> This patch could be simplified if we could use the patch series from Georges:
> http://comments.gmane.org/gmane.comp.lib.uclibc.buildroot/154669

Yes, noted. I still have this series on my list.

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
