From: Yegor Yefremov <yegor_sub1@visionsystems.de>
Date: Tue, 07 Dec 2010 10:07:03 +0100
Subject: [Buildroot] [PATCH] New package: sdparm
In-Reply-To: <20101206210510.5ef8ca45@surf>
References: <4CFCC1D9.8070209@visionsystems.de> <20101206210510.5ef8ca45@surf>
Message-ID: <4CFDF937.9080803@visionsystems.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Thomas,

> Hello Yegor,
>
> On Mon, 06 Dec 2010 11:58:33 +0100
> Yegor Yefremov <yegor_sub1@visionsystems.de> wrote:
>
>> Index: b/package/sdparm/Config.in
>> ===================================================================
>> --- /dev/null	1970-01-01 00:00:00.000000000 +0000
>> +++ b/package/sdparm/Config.in	2010-12-06 11:14:41.000000000
>> +0100 @@ -0,0 +1,4 @@
>> +config BR2_PACKAGE_SDPARM
>> +	bool "sdparm"
>> +	help
>> +	  Utility to accesses SCSI device parameters.
> We generally put the URL of the project here in the help text.
>
>> Index: b/package/sdparm/sdparm.mk
>> ===================================================================
>> --- /dev/null	1970-01-01 00:00:00.000000000 +0000
>> +++ b/package/sdparm/sdparm.mk	2010-12-06 08:33:16.000000000
>> +0100 @@ -0,0 +1,7 @@
>> +SDPARM_VERSION = 1.06
>> +SDPARM_SOURCE = sdparm-$(SDPARM_VERSION).tgz
>> +SDPARM_SITE = http://sg.danny.cz/sg/p/
>> +SDPARM_INSTALL_STAGING = NO
>> +SDPARM_INSTALL_TARGET = YES
> You can get rid of those last two lines, they are the default behaviour.
>

I made the changes. Thanks for reviewing.

Yegor
