From: Yegor Yefremov <yegor_sub1@visionsystems.de>
Date: Tue, 14 Dec 2010 16:59:59 +0100
Subject: [Buildroot] [PATCH] New package: can-utils
In-Reply-To: <20101214151749.4e529f54@surf>
References: <4D0778E5.9010401@visionsystems.de> <20101214151749.4e529f54@surf>
Message-ID: <4D07947F.8010403@visionsystems.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Thomas,

>> +	  SocketCAN is a set of open source CAN drivers and a networking stack. This package provides various
>> +	  tools for this stack.
> Please wrap at ~80.

Fixed. Can we have something like checkpatch.pl in linux kernel? Is it easy to adopt?

>> Index: b/package/can-utils/can-utils.mk
>> ===================================================================
>> --- /dev/null	1970-01-01 00:00:00.000000000 +0000
>> +++ b/package/can-utils/can-utils.mk	2010-12-14 14:40:07.000000000 +0100
>> @@ -0,0 +1,13 @@
>> +#############################################################
>> +#
>> +# can-utils
>> +#
>> +#############################################################
>> +
>> +CAN_UTILS_VERSION = HEAD
> We need a fixed version, not a random HEAD one. Pick the latest
> revision you tested.

Fixed. Thanks for reviewing.

Best regards,
Yegor
