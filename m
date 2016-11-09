From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 9 Nov 2016 22:33:57 +0100
Subject: [Buildroot] [PATCH next 1/2] olimex_imx233_olinuxino: bump
 version
In-Reply-To: <1478560176-29807-1-git-send-email-francois.perrad@gadz.org>
References: <1478560176-29807-1-git-send-email-francois.perrad@gadz.org>
Message-ID: <20161109223357.6e29a687@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue,  8 Nov 2016 00:09:35 +0100, Francois Perrad wrote:
> Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
> ---
>  .../imx233_olinuxino/genimage-imx233_olinuxino.cfg |   1 +
>  board/olimex/imx233_olinuxino/linux-3.18.config    | 152 ---------------------
>  board/olimex/imx233_olinuxino/post-image.sh        |   3 -
>  configs/olimex_imx233_olinuxino_defconfig          |  16 ++-
>  4 files changed, 10 insertions(+), 162 deletions(-)
>  delete mode 100644 board/olimex/imx233_olinuxino/linux-3.18.config

Thanks, both patches applied to next!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
