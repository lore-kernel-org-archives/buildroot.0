From: =?UTF-8?Q?Beno=c3=aet_Th=c3=a9baudeau?= <benoit@wsystem.com>
Date: Thu, 20 Aug 2015 00:23:50 +0200
Subject: [Buildroot] rpi: image generation
Message-ID: <55D501F6.6000909@wsystem.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi all,

I have local changes for the Raspberry Pi that can automatically generate an
image to be flashed on the SD card (e.g. with dd).

This mechanism uses genimage, so no sudo is needed. It generates a FAT32
partition of 64 MiB and an ext4 partition that just fits its contents with a
small free space. I also have scripts to auto-expand the ext4 partition and FS
to fill the SD card.

Are you interested in any of this, or do you prefer to keep the current manual
approach that makes it possible to do just anything custom?

Best regards,
Beno?t
