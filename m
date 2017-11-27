From: Maxime Ripard <maxime.ripard@free-electrons.com>
Date: Mon, 27 Nov 2017 15:31:14 +0100
Subject: [Buildroot] [PATCH 2/2] sunxi-mali-mainline: new package
In-Reply-To: <1511648569-18855-2-git-send-email-giulio.benetti@micronovasrl.com>
References: <1511648569-18855-1-git-send-email-giulio.benetti@micronovasrl.com>
 <1511648569-18855-2-git-send-email-giulio.benetti@micronovasrl.com>
Message-ID: <20171127143114.ys6qznizmptuwhqw@flea.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sat, Nov 25, 2017 at 11:22:49PM +0100, Giulio Benetti wrote:
> Add Allwinner Mali openGL userspace driver r6p2.
> Used combined with kernelspace Mali driver,
> it gives possibility to use 3D openGL SoC acceleration.
> It provides fbdev libraries and headers.
> It is compatible with Linux >= 4.4 as sunxi-mali-driver-mainline.
> 
> Signed-off-by: Giulio Benetti <giulio.benetti@micronovasrl.com>

Reviewed-by: Maxime Ripard <maxime.ripard@free-electrons.com>

Maxime

-- 
Maxime Ripard, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
-------------- next part --------------
A non-text attachment was scrubbed...
Name: signature.asc
Type: application/pgp-signature
Size: 833 bytes
Desc: not available
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20171127/72990ea7/attachment.asc>
