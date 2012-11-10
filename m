From: Arnout Vandecappelle <arnout@mind.be>
Date: Sat, 10 Nov 2012 03:16:37 +0100
Subject: [Buildroot] [PATCH 3/6] Add firmware for the AW-NH580
 connectivity module of the snowball
In-Reply-To: <509B7184.3090501@calao-systems.com>
References: <1351500073-4351-1-git-send-email-gregory.hermant@calao-systems.com>
 <1351500073-4351-4-git-send-email-gregory.hermant@calao-systems.com>
 <509055D9.3040805@mind.be> <509B7184.3090501@calao-systems.com>
Message-ID: <509DB905.9040402@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 11/08/12 09:47, Gr?gory Hermant wrote:
>>> >>  +SNOWBALL_FIRMWARE_LICENSE = PROPRIETARY
>> >
>> >    Again not a very accurate license.  "Snowball click-wrap license" is more
>> >  appropriate.  It does come pretty close to proprietary, however.  I wonder
>> >  if the linaro maintainers have permission to redistribute it via launchpad...
>> >
>> >    The license file is license.txt.
> What do you suggest for the UX500_FIRMWARE_LICENSE = ?

  I would set
UX500_FIRMWARE_LICENSE = Snowball click-wrap license
UX500_FIRMWARE_DISTRIBUTE = NO

And then we also have a use case for Luca's new no-distribute function.
Can you test a 'make legal-info' with this?  It should not store the
ux500-firmware tarball to the legal-info/sources directory.

  Regards,
  Arnout

-- 
Arnout Vandecappelle                               arnout at mind be
Senior Embedded Software Architect                 +32-16-286540
Essensium/Mind                                     http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium                BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
