From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 30 Oct 2012 23:35:17 +0100
Subject: [Buildroot] [PATCH 3/6] Add firmware for the AW-NH580
 connectivity module of the snowball
In-Reply-To: <1351500073-4351-4-git-send-email-gregory.hermant@calao-systems.com>
References: <1351500073-4351-1-git-send-email-gregory.hermant@calao-systems.com>
 <1351500073-4351-4-git-send-email-gregory.hermant@calao-systems.com>
Message-ID: <50905625.4000400@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 10/29/12 09:41, Gregory Hermant wrote:
> +SNOWBALL_FIRMWARE_SOURCE = ux500-firmware_$(SNOWBALL_FIRMWARE_VERSION).tar.gz

  And it looks like ux500-firmware would be a more appropriate package name.

  Regards,
  Arnout
-- 
Arnout Vandecappelle                               arnout at mind be
Senior Embedded Software Architect                 +32-16-286540
Essensium/Mind                                     http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium                BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
