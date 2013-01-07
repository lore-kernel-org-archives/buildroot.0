From: Arnout Vandecappelle <arnout@mind.be>
Date: Mon, 07 Jan 2013 23:41:35 +0100
Subject: [Buildroot] [git commit] rpi-firmware: New package
In-Reply-To: <20130106221239.2F44D9A5E5@busybox.osuosl.org>
References: <20130106221239.2F44D9A5E5@busybox.osuosl.org>
Message-ID: <50EB4F1F.7070202@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 06/01/13 23:01, Peter Korsgaard wrote:
> +RPI_FIRMWARE_LICENSE = BSD-3c
> +RPI_FIRMWARE_LICENSE_FILE = boot/LICENCE.broadcom

  As Thomas pointed out, this is not BSD-3c but "Broadcom proprietary 
license".

  Maybe it should also get

RPI_FIRMWARE_REDISTRIBUTE = NO


  Regards,
  Arnout
-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
