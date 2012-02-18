From: Arnout Vandecappelle <arnout@mind.be>
Date: Sat, 18 Feb 2012 12:16:41 +0100
Subject: [Buildroot] [PATCH] Added microblaze patch
In-Reply-To: <CA+appbNDg4GPmFmETYchXF3Hyf6aG40ufuCjYVxsaL3dQWdbKg@mail.gmail.com>
References: <CA+appbNdaSajXPdKk4OTyj0WOmeu=9PKr-Sa=cwAZNr76ujLnA@mail.gmail.com>
 <201202141815.04894.arnout@mind.be>
 <CA+appbNDg4GPmFmETYchXF3Hyf6aG40ufuCjYVxsaL3dQWdbKg@mail.gmail.com>
Message-ID: <201202181216.42288.arnout@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thursday 16 February 2012 22:28:08 Spenser Gilliland wrote:
> Arnout,
> 
> I've tried a make target of both <DTS_NAME>.dtb and
> $(KERNEL_ARCH_PATH/boot/<DTS_NAME>.dtb with no success.  Are you sure
> this is correct?  I've tried this both within buildroot and just on a
> kernel tree directly with the microblaze toolchain.

 I've never tried it myself, I've just looked at
http://www.denx.de/wiki/DULG/LinuxFDTBlob

 Regards,
 Arnout

-- 
Arnout Vandecappelle                               arnout at mind be
Senior Embedded Software Architect                 +32-16-286540
Essensium/Mind                                     http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium                BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20120218/4e61b07e/attachment.html>
