From: =?ISO-8859-1?Q?Gr=E9gory_Hermant?= <gregory.hermant@calao-systems.com>
Date: Thu, 08 Nov 2012 09:47:00 +0100
Subject: [Buildroot] [PATCH 3/6] Add firmware for the AW-NH580
 connectivity module of the snowball
In-Reply-To: <509055D9.3040805@mind.be>
References: <1351500073-4351-1-git-send-email-gregory.hermant@calao-systems.com>
 <1351500073-4351-4-git-send-email-gregory.hermant@calao-systems.com>
 <509055D9.3040805@mind.be>
Message-ID: <509B7184.3090501@calao-systems.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le 30/10/2012 23:34, Arnout Vandecappelle a ?crit :
> 
>> +
>> diff --git a/package/snowball-firmware/snowball-firmware.mk b/package/snowball-firmware/snowball-firmware.mk
>> new file mode 100644
>> index 0000000..05326e2
>> --- /dev/null
>> +++ b/package/snowball-firmware/snowball-firmware.mk
>> @@ -0,0 +1,17 @@
>> +#############################################################
>> +#
>> +# snowball-firmware
>> +#
>> +#############################################################
>> +SNOWBALL_FIRMWARE_VERSION = 1.1.3-5
>> +SNOWBALL_FIRMWARE_SOURCE = ux500-firmware_$(SNOWBALL_FIRMWARE_VERSION).tar.gz
>> +SNOWBALL_FIRMWARE_SITE = https://launchpad.net/~linaro-maintainers/+archive/overlay/+files/
>> +SNOWBALL_FIRMWARE_LICENSE = PROPRIETARY
> 
>  Again not a very accurate license.  "Snowball click-wrap license" is more
> appropriate.  It does come pretty close to proprietary, however.  I wonder
> if the linaro maintainers have permission to redistribute it via launchpad...
> 
>  The license file is license.txt.

What do you suggest for the UX500_FIRMWARE_LICENSE = ?
BR,
gregory
