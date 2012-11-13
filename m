From: =?ISO-8859-1?Q?Gr=E9gory_Hermant?= <gregory.hermant@calao-systems.com>
Date: Tue, 13 Nov 2012 12:08:00 +0100
Subject: [Buildroot] [PATCH 3/6] Add firmware for the AW-NH580
 connectivity module of the snowball
In-Reply-To: <509DB905.9040402@mind.be>
References: <1351500073-4351-1-git-send-email-gregory.hermant@calao-systems.com>
 <1351500073-4351-4-git-send-email-gregory.hermant@calao-systems.com>
 <509055D9.3040805@mind.be> <509B7184.3090501@calao-systems.com>
 <509DB905.9040402@mind.be>
Message-ID: <50A22A10.80303@calao-systems.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le 10/11/2012 03:16, Arnout Vandecappelle a ?crit :
> On 11/08/12 09:47, Gr?gory Hermant wrote:
>>>> >>  +SNOWBALL_FIRMWARE_LICENSE = PROPRIETARY
>>> >
>>> >    Again not a very accurate license.  "Snowball click-wrap license" is more
>>> >  appropriate.  It does come pretty close to proprietary, however.  I wonder
>>> >  if the linaro maintainers have permission to redistribute it via launchpad...
>>> >
>>> >    The license file is license.txt.
>> What do you suggest for the UX500_FIRMWARE_LICENSE = ?
> 
>  I would set
> UX500_FIRMWARE_LICENSE = Snowball click-wrap license
> UX500_FIRMWARE_DISTRIBUTE = NO
> 
> And then we also have a use case for Luca's new no-distribute function.
> Can you test a 'make legal-info' with this?  It should not store the
> ux500-firmware tarball to the legal-info/sources directory.
Indeed the ux500-firmware tarball is not stored to the legal-info/sources directory.
> 
>  Regards,
>  Arnout
> 

BR,
gregory
