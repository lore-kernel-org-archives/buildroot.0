From: Ulf Samuelsson <ulf.samuelsson@atmel.com>
Date: Fri, 7 Mar 2008 00:56:09 +0100
Subject: [Buildroot] svn commit: trunk/buildroot/package/bzip2
References: <20080306175611.EB4541201CA@busybox.net>
	<20080306234746.GC26530@cloud.net.au>
Message-ID: <041901c87fe5$b1503080$030514ac@atmel.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

----- Original Message ----- 
From: "Hamish Moffatt" <hamish@cloud.net.au>
To: <buildroot@uclibc.org>
Sent: Friday, March 07, 2008 12:47 AM
Subject: Re: [Buildroot] svn commit: trunk/buildroot/package/bzip2


> On Thu, Mar 06, 2008 at 09:56:11AM -0800, ninevoltz at uclibc.org wrote:
>> Author: ninevoltz
>> Date: 2008-03-06 09:56:10 -0800 (Thu, 06 Mar 2008)
>> New Revision: 21184
>> 
>> Log:
>> makefile cleanup for bzip2
>> 
>> Modified:
>>    trunk/buildroot/package/bzip2/bzip2.mk
>> 
>> 
>> Changeset:
>> Modified: trunk/buildroot/package/bzip2/bzip2.mk
>> ===================================================================
>> --- trunk/buildroot/package/bzip2/bzip2.mk 2008-03-06 17:55:51 UTC (rev 21183)
>> +++ trunk/buildroot/package/bzip2/bzip2.mk 2008-03-06 17:56:10 UTC (rev 21184)
>> @@ -29,7 +29,7 @@
>>  $(SED) "s:-O2:$(TARGET_CFLAGS):" $(BZIP2_DIR)/Makefile-libbz2_so
>>  touch $@
>>  
>> -$(STAGING_DIR)/lib/libbz2.so.$(BZIP2_VERSION): $(BZIP2_DIR)/.unpacked
>> +$(STAGING_DIR)/usr/lib/libbz2.so.$(BZIP2_VERSION): $(BZIP2_DIR)/.unpacked
> 
> Why move libbz2 from /lib to /usr/lib?
> 
> 


I think that this has been the trend for the last year.
A lot of packages has had this change.


Best Regards
Ulf Samuelsson
