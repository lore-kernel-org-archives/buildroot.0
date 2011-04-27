From: Yegor Yefremov <yegor_sub1@visionsystems.de>
Date: Wed, 27 Apr 2011 14:55:11 +0200
Subject: [Buildroot] [PATCH v2] libnl: bump to version 2.0
In-Reply-To: <20110427125034.GA12092@jasper.tkos.co.il>
References: <4DB81033.1040503@visionsystems.de>
	<20110427125034.GA12092@jasper.tkos.co.il>
Message-ID: <4DB8122F.9070200@visionsystems.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Baruch,

> On Wed, Apr 27, 2011 at 02:46:43PM +0200, Yegor Yefremov wrote:
>> Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
>>
>>
>> Index: b/package/libnl/libnl.mk
>> ===================================================================
>> --- a/package/libnl/libnl.mk	2011-04-26 02:04:14.206276675 -0700
>> +++ b/package/libnl/libnl.mk	2011-04-27 05:43:47.382292483 -0700
>> @@ -4,9 +4,9 @@
>>  #
>>  #############################################################
>>  
>> -LIBNL_VERSION = 1.1
>> +LIBNL_VERSION = 3.0
> You should probably change ${SUBJECT}.

You're right.

> By the way, since there are API changes between those libnl versions, does 
> this change affect other packages using libnl?

I've also provided patches for wpa_supplicant and hostapd. Both packages had already support for libnl, but I had to be set up in the configuration file.

Best regards,
Yegor
