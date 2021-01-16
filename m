From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 16 Jan 2021 23:03:51 +0100
Subject: [Buildroot] [PATCH] package/sunxi-mali-mainline-driver: fix
 build failure with Linux 5.9 and 5.10
In-Reply-To: <20210106212919.540837-1-giulio.benetti@benettiengineering.com>
References: <20210106212919.540837-1-giulio.benetti@benettiengineering.com>
Message-ID: <20210116230351.428f760b@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed,  6 Jan 2021 22:29:19 +0100
Giulio Benetti <giulio.benetti@benettiengineering.com> wrote:

> Add 2 patches pending[1] upstream to fix build failure with both Linux 5.9
> and Linux 5.10 due to uaccess.h file moved after version >= 5.9 and and
> due to moved code from dma-contiguous.h to dma-mapping.
> 
> [1]: https://github.com/mripard/sunxi-mali/pull/89
> 
> Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
> ---
>  ...01-mali-support-building-against-5.9.patch | 269 ++++++++++++++++++
>  ...2-mali-support-building-against-5.10.patch |  98 +++++++
>  2 files changed, 367 insertions(+)
>  create mode 100644 package/sunxi-mali-mainline-driver/0001-mali-support-building-against-5.9.patch
>  create mode 100644 package/sunxi-mali-mainline-driver/0002-mali-support-building-against-5.10.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
