From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 3 Feb 2019 20:52:00 +0100
Subject: [Buildroot] [PATCH next] uboot: support external DTB in U-Boot
 images
In-Reply-To: <20180304171815.35061-1-clemens.gruber@pqgruber.com>
References: <20180304171815.35061-1-clemens.gruber@pqgruber.com>
Message-ID: <20190203205200.238709b0@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun,  4 Mar 2018 18:18:15 +0100
Clemens Gruber <clemens.gruber@pqgruber.com> wrote:

> Allows signed FIT images to be verified with the public key in the DTB.
> The public key is stored in the bootloader image, which must have been
> verified by the previous stage in the trust chain, before loading it.
> 
> Signed-off-by: Clemens Gruber <clemens.gruber@pqgruber.com>

For the record, this patch is a bit related to
http://patchwork.ozlabs.org/patch/1018245/, on which I made an
alternate proposal, that would cover both this patch and patch 1018245.

(This e-mail is sent mainly so that others looking at patchwork for
this patch will realize there is some related discussion in another
thread.)

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
