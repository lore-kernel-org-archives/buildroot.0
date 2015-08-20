From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 20 Aug 2015 09:59:06 +0200
Subject: [Buildroot] rpi: image generation
In-Reply-To: <55D501F6.6000909@wsystem.com>
References: <55D501F6.6000909@wsystem.com>
Message-ID: <20150820095906.0b2524c2@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Beno?t Th?baudeau,

On Thu, 20 Aug 2015 00:23:50 +0200, Beno?t Th?baudeau wrote:

> I have local changes for the Raspberry Pi that can automatically generate an
> image to be flashed on the SD card (e.g. with dd).
> 
> This mechanism uses genimage, so no sudo is needed. It generates a FAT32
> partition of 64 MiB and an ext4 partition that just fits its contents with a
> small free space. I also have scripts to auto-expand the ext4 partition and FS
> to fill the SD card.
> 
> Are you interested in any of this, or do you prefer to keep the current manual
> approach that makes it possible to do just anything custom?

I am interested in seeing more examples of genimage usage. I believe
Vivien Didelot, who submitted the patch to use genimage for the
Wandboard configuration, was also planning on submitting more genimage
related patches.

Best regards,

Thomas Petazzoni
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
