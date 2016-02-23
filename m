From: =?UTF-8?Q?Andr=c3=a9_Hentschel?= <nerv@dawncrow.de>
Date: Tue, 23 Feb 2016 21:26:38 +0100
Subject: [Buildroot] Buildroot for normal PC
In-Reply-To: <56C8F9DF.1090008@mind.be>
References: <56C79CD9.3010503@dawncrow.de> <56C8F9DF.1090008@mind.be>
Message-ID: <56CCC07E.80507@dawncrow.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Am 21.02.2016 um 00:42 schrieb Arnout Vandecappelle:
> On 02/19/16 23:53, Andr? Hentschel wrote:
>> Hi,
>>
>> I wanna try some more things with the Wine package in buildroot, but I can't easily setup a testing environment for a PC.
>> One part is which bootloader to use and how to pack everything together to a bootable USB-Stick, HDD image or CD. (And I didn't found a defconfig for that)...
> 
>  Check out BR2_TARGET_ROOTFS_ISO9660_HYBRID (after enabling the
> syslinux/isolinux bootloader and the iso9660 filesystem). It makes a bootable
> USB image.


Sounds great, tried it.
Sadly it fails on boot like this:

ISOLINUX 6.03 EHDD Copyright (C) 1994-2014 H. Peter Anvin et al
Loading /boot/vmlinux... ok
Booting kernel failed: Invalid argument

Any idea?
