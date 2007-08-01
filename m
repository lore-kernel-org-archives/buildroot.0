From: Ulf Samuelsson <ulf@atmel.com>
Date: Wed, 1 Aug 2007 08:08:08 +0200
Subject: [Buildroot] svn commit:	trunk/buildroot/toolchain/kernel-headers
References: <20070731154926.E3856A466A@busybox.net>
	<1185947251.20419.1.camel@localhost.localdomain>
Message-ID: <015701c7d404$0eea9200$dcc4af0a@atmel.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

----- Original Message ----- 
From: "Hans-Christian Egtvedt" <hcegtvedt@atmel.com>
To: <buildroot@uclibc.org>
Sent: Wednesday, August 01, 2007 7:47 AM
Subject: Re: [Buildroot] svn commit: trunk/buildroot/toolchain/kernel-headers


> On Tue, 2007-07-31 at 08:49 -0700, ulf at uclibc.org wrote:
>> Author: ulf
>> Date: 2007-07-31 08:49:25 -0700 (Tue, 31 Jul 2007)
>> New Revision: 19358
>> 
>> Log:
>> Add AVR32 kernel patches for linux-2.6.21.5
>> 
>> Added:
>>    trunk/buildroot/toolchain/kernel-headers/linux-2.6.21.5-003-atmel.1-avr32-updates.patch
> 
> No, please kick this one out again. Only 2.6.22.atmel.3 patch (AVR32)
> should be present in upstream buildroot.
> 

OK already done that, since it failed.
Buildroot seems to be focusing on 2.6.22.1 so I tested
the 2.6.22 patch vs that one, and it did not apply cleanly, 
so I updated the patch before committing.

I removed the 2.6.22.1 again yesterday to reverify, since the 2.6.21.5 version 
I committed failed.

> <cut two other patches committed>
> 
> -- 


Best Regards
Ulf Samuelsson
