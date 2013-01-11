From: Arnout Vandecappelle <arnout@mind.be>
Date: Sat, 12 Jan 2013 00:22:40 +0100
Subject: [Buildroot] [PATCH v2] configs: add RaspberryPi defconfig
In-Reply-To: <50F08131.1080208@je-eigen-domein.nl>
References: <1357910250-31110-1-git-send-email-maxime.hadjinlian@gmail.com>
 <50F046F7.3060607@je-eigen-domein.nl> <50F072D9.3010808@mind.be>
 <50F08131.1080208@je-eigen-domein.nl>
Message-ID: <50F09EC0.6070906@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 11/01/13 22:16, Floris Bos wrote:
> The bootloader does support loading separate initrd files through a
> config.txt option.
> But the standard bcmrpi_defconfig Raspberry kernel does not, because
> CONFIG_BLK_DEV_INITRD isn't enabled in the default configuration.

  Bummer.

> If you cannot use the standard kernel, and have to compile your own
> anyway, it is easier to use the buildroot "initramfs" option, and have
> the initramfs integrated into zImage.

  It's just that that increases compile time, with little real benefit 
over a separate initramfs.

  Regards,
  Arnout

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
