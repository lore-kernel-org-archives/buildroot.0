From: Arnout Vandecappelle <arnout@mind.be>
Date: Sun, 21 Feb 2016 00:42:23 +0100
Subject: [Buildroot] Buildroot for normal PC
In-Reply-To: <56C79CD9.3010503@dawncrow.de>
References: <56C79CD9.3010503@dawncrow.de>
Message-ID: <56C8F9DF.1090008@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 02/19/16 23:53, Andr? Hentschel wrote:
> Hi,
> 
> I wanna try some more things with the Wine package in buildroot, but I can't easily setup a testing environment for a PC.
> One part is which bootloader to use and how to pack everything together to a bootable USB-Stick, HDD image or CD. (And I didn't found a defconfig for that)...

 Check out BR2_TARGET_ROOTFS_ISO9660_HYBRID (after enabling the
syslinux/isolinux bootloader and the iso9660 filesystem). It makes a bootable
USB image.

> The other part is about the nvidia-driver, I'll need the legacy one for my card. Can I simply alter the version number in the makefile?

 That could be trickier...


 Regards,
 Arnout

> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
> 


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
