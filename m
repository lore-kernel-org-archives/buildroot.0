From: Eric Le Bihan <eric.le.bihan.dev@free.fr>
Date: Wed, 12 Mar 2014 13:18:06 +0100
Subject: [Buildroot] [PATCH 12/20] package/libegl: convert to the
 virtual-package infrastructure
In-Reply-To: <95b1625559a1eff9b8fe0c0da19d37b14aad730c.1394482605.git.yann.morin.1998@free.fr>
References: <cover.1394482605.git.yann.morin.1998@free.fr>
 <95b1625559a1eff9b8fe0c0da19d37b14aad730c.1394482605.git.yann.morin.1998@free.fr>
Message-ID: <20140312121805.GC17787@pc-eric>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, Mar 10, 2014 at 09:27:41PM +0100, Yann E. MORIN wrote:
> From: "Yann E. MORIN" <yann.morin.1998@free.fr>
>
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> Cc: Eric Le Bihan <eric.le.bihan.dev@free.fr>
> Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> Cc: Thomas De Schampheleire <patrickdepinguin@gmail.com>
> Cc: Mike Zick <minimod@morethan.org>
> Reviewed-by: Samuel Martin <s.martin49@gmail.com>
Tested-by: Eric Le Bihan <eric.le.bihan.dev@free.fr>

I tested this patch by building an image for RaspberryPi with Qt5.
As for libgles, I tested error message display with a corrupted defconfig
file.
