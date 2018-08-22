From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 22 Aug 2018 21:26:33 +0200
Subject: [Buildroot] [PATCH v2 2/2] sunxi-mali-mainline-driver: bump
 version and add support for building on arm64(aarch64).
In-Reply-To: <58c7d88b-dc45-5426-a328-89a58dc005b2@micronovasrl.com>
References: <20180822000648.23314-1-giulio.benetti@micronovasrl.com>
 <20180822000648.23314-3-giulio.benetti@micronovasrl.com>
 <20180822132959.39640475@windsurf>
 <58c7d88b-dc45-5426-a328-89a58dc005b2@micronovasrl.com>
Message-ID: <20180822212633.0a8a625e@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, 22 Aug 2018 20:37:13 +0200, Giulio Benetti wrote:

> Also, it would be good to have patches
> > adding license information for both of those packages. For the
> > mali-blobs, there's a PDF containing the EULA.   
> 
> Do you mean like odroid-mali package .mk?
> I mean reporting:
> SUNXI_MALI_MAINLINE_LICENSE = EULA
> SUNXI_MALI_MAINLINE_LICENSE_FILES = EULA for Mali 400MP _AW.pdf
> Right?

Yes. Make sure "make legal-info" is working after this.

> For the kernel driver, I
> > didn't see a license file, but I didn't look everywhere. If there is
> > none, could you check with Maxime to make sure a license file gets
> > added ?  
> 
> I'm not an expert of licensing but as stated here:
> https://developer.arm.com/products/software/mali-drivers/utgard-kernel
> it is distributed under GPLv2 licence the base code,
> so the added code should be too.
> What do you all think?

Yes, of course, it should be under GPLv2, but it would be nice to have
a license file in the source code.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
