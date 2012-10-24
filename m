From: Arnout Vandecappelle <arnout@mind.be>
Date: Wed, 24 Oct 2012 22:43:23 +0200
Subject: [Buildroot] [PATCH 9/9] firefox: GNU gnash flash,
 an open source Adobe Flash player & plugin
In-Reply-To: <5087F087.8010307@petroprogram.com>
References: <1346855344-15081-1-git-send-email-stefan.froberg@petroprogram.com>
 <1346855344-15081-10-git-send-email-stefan.froberg@petroprogram.com>
 <5082C97A.4090207@mind.be> <5083E62E.80705@petroprogram.com>
 <5086C8E7.6070209@mind.be> <5087F087.8010307@petroprogram.com>
Message-ID: <508852EB.4070401@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 24/10/12 15:43, Stefan Fr?berg wrote:
> I just read the following:
> http://www.extremetech.com/mobile/137412-linux-kernel-version-3-7-will-support-multiple-arm-socs
>
> So it seems things are now getting more easier.
>
> Im certainly going to upgrade to that kernel version and try if I have
> better luck
> this time with exonys board (basically the same stuff that those Samsung
> Galaxy S II and III are using ????)
> under qemu.

  AFAIK that board is not yet part of the multiplatform patch.  And anyway, you
still need a boot loader that sets up the SDRAM correctly, so you still need the
correct U-Boot/Barebox/... config.

  But what is your problem exactly?  Set the kernel defconfig to 'exynos' and all
is well, no?

  Regards,
  Arnout

-- 
Arnout Vandecappelle                               arnout at mind be
Senior Embedded Software Architect                 +32-16-286540
Essensium/Mind                                     http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium                BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
