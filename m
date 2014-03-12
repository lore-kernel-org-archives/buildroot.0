From: Eric Le Bihan <eric.le.bihan.dev@free.fr>
Date: Wed, 12 Mar 2014 13:20:23 +0100
Subject: [Buildroot] [PATCH 18/20] package/udev: convert to the
 virtual-package infrastructure
In-Reply-To: <0533dda6be874c12e0d45f9cc94a69bda85f1056.1394482605.git.yann.morin.1998@free.fr>
References: <cover.1394482605.git.yann.morin.1998@free.fr>
 <0533dda6be874c12e0d45f9cc94a69bda85f1056.1394482605.git.yann.morin.1998@free.fr>
Message-ID: <20140312122023.GD17787@pc-eric>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, Mar 10, 2014 at 09:27:47PM +0100, Yann E. MORIN wrote:
> From: "Yann E. MORIN" <yann.morin.1998@free.fr>
>
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> Cc: Eric Le Bihan <eric.le.bihan.dev@free.fr>
> Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> Cc: Thomas De Schampheleire <patrickdepinguin@gmail.com>
> Cc: Mike Zick <minimod@morethan.org>
Tested-by: Eric Le Bihan <eric.le.bihan.dev@free.fr>

I tested this patch by building QEMU x86 images using eudev or systemd as
providers.
