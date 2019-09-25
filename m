From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 25 Sep 2019 23:00:58 +0200
Subject: [Buildroot] [PATCH] configs/beagleboneai: new defconfig
In-Reply-To: <20190923144629.31872-1-peter@korsgaard.com>
References: <20190923144629.31872-1-peter@korsgaard.com>
Message-ID: <20190925230058.6c54de31@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, 23 Sep 2019 16:46:29 +0200
Peter Korsgaard <peter@korsgaard.com> wrote:

> Add basic support for the Beagleboard.org Beaglebone AI board:
> 
> https://beagleboard.org/ai
> 
> U-Boot patch taken from
> https://github.com/beagleboard/beaglebone-ai/blob/master/SW/buildroot/local/patches/uboot/0001-BeagleBone-AI-support.patch
> 
> Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
> ---
>  DEVELOPERS                                    |    2 +
>  board/beagleboneai/genimage.cfg               |   29 +
>  .../uboot/0001-BeagleBone-AI-support.patch    | 1782 +++++++++++++++++
>  board/beagleboneai/post-build.sh              |    4 +
>  board/beagleboneai/readme.txt                 |   28 +
>  board/beagleboneai/uEnv.txt                   |    6 +
>  configs/beagleboneai_defconfig                |   29 +
>  7 files changed, 1880 insertions(+)
>  create mode 100644 board/beagleboneai/genimage.cfg
>  create mode 100644 board/beagleboneai/patches/uboot/0001-BeagleBone-AI-support.patch
>  create mode 100755 board/beagleboneai/post-build.sh
>  create mode 100644 board/beagleboneai/readme.txt
>  create mode 100644 board/beagleboneai/uEnv.txt
>  create mode 100644 configs/beagleboneai_defconfig

Applied to master, thanks. Hopefully the lengthy U-Boot patch can be
removed in the near future, once the support is upstreamed.

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
