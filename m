From: Jeremy Kerr <jk@ozlabs.org>
Date: Fri, 17 Jan 2014 09:58:58 +0800
Subject: [Buildroot] [RFC,
 PATCH 7/8] package/iprutils: Add IBM Power RAID utilities
In-Reply-To: <52D7DD99.2020805@trzebnica.net>
References: <1389862338.919734.499084473099.7.gpush@pablo>
 <52D7DD99.2020805@trzebnica.net>
Message-ID: <52D88E62.9010607@ozlabs.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Jerzy,

Thanks for the review. Comments inline:

>>   package/Config.in                                |    1
>>   package/iprutils/Config.in                       |   10 +++++
>>   package/iprutils/iprutils-dont-use-gettext.patch |   30 +++++++++++++++
> 
> iprutils-01-dont-use-gettext.patch

Makes sense. Fixed, along with the other patches introduced in this series.

>> diff --git a/package/iprutils/iprutils.mk b/package/iprutils/iprutils.mk
>> new file mode 100644
>> index 00000000..0aa94f38
>> --- /dev/null
>> +++ b/package/iprutils/iprutils.mk
>> @@ -0,0 +1,27 @@
>> +#############################################################
> 
> 80 of # signs

Fixed, including other new .mk files in this series

>> +
>> +IPRUTILS_VERSION = 2.3.15
>> +IPRUTILS_SITE =
>> http://downloads.sourceforge.net/project/iprdd/iprutils%20for%202.6%20kernels/$(IPRUTILS_VERSION)
>>
>> +IPRUTILS_SOURCE=iprutils-$(IPRUTILS_VERSION)-src.tgz
> 
> IPRUTILS_SOURCE = iprutils-$(IPRUTILS_VERSION)-src.tgz

Fixed.

I've updated my git tree based on your feedback, I'll repost after a
little while, in case there are any more changes requested.

Cheers,


Jeremy
