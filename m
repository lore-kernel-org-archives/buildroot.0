From: Eric Le Bihan <eric.le.bihan.dev@free.fr>
Date: Wed, 12 Mar 2014 13:15:12 +0100
Subject: [Buildroot] [PATCH 11/20] package/libgles: convert to the
 virtual-package infrastructure
In-Reply-To: <cf1d4ab86486678a65cd74c95e8141d01c7b924d.1394482605.git.yann.morin.1998@free.fr>
References: <cover.1394482605.git.yann.morin.1998@free.fr>
 <cf1d4ab86486678a65cd74c95e8141d01c7b924d.1394482605.git.yann.morin.1998@free.fr>
Message-ID: <20140312121511.GB17787@pc-eric>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, Mar 10, 2014 at 09:27:40PM +0100, Yann E. MORIN wrote:
> From: "Yann E. MORIN" <yann.morin.1998@free.fr>
>
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> Cc: Eric Le Bihan <eric.le.bihan.dev@free.fr>
> Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> Cc: Thomas De Schampheleire <patrickdepinguin@gmail.com>
> Cc: Mike Zick <minimod@morethan.org>
> Reviewed-by: Samuel Martin <s.martin49@gmail.com>
Tested-by: Eric Le Bihan <eric.le.bihan.dev@free.fr>

I tested this patch by building an image for RaspberryPi with Qt5. I also
tested that the error message about missing provider is displayed when
using a corrupted defconfig file.
