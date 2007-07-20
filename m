From: Ulf Samuelsson <ulf@atmel.com>
Date: Sat, 21 Jul 2007 01:26:24 +0200
Subject: [Buildroot] svn commit:
	trunk/buildroot/target:linux-experimental
References: <20070720112745.D7AD5A680F@busybox.net>
	<20070720134836.GA29640@real.realitydiluted.com>
Message-ID: <051201c7cb26$9798ae70$dcc4af0a@atmel.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

----- Original Message ----- 
From: "Steven J. Hill" <sjhill@realitydiluted.com>
To: <buildroot@uclibc.org>
Cc: <ulf@uclibc.org>
Sent: Friday, July 20, 2007 3:48 PM
Subject: Re: [Buildroot] svn commit: trunk/buildroot/target:linux-experimental


> On Fri, Jul 20, 2007 at 04:27:45AM -0700, ulf at uclibc.org wrote:
>> Author: ulf
>> Date: 2007-07-20 04:27:45 -0700 (Fri, 20 Jul 2007)
>> New Revision: 19179
>> 
>> Log:
>> Add experimental linux target option
>> 
>> Added:
>>    trunk/buildroot/target/linux-experimental/
>>    trunk/buildroot/target/linux-experimental/Makefile.in
>> 
>> Modified:
>>    trunk/buildroot/target/Makefile.in
>> 
> I wish you would have done a RFC for this before committing as I would
> have rejected it. You are adding more complexity and more configuration
> options to the system. If people want to do something special with their
> Linux kernel, they should handle it in their own target specific
> directory and override the variables LINUX_HEADERS_VERSION, LINUX26_DIR,
> LINUX26_KCONFIG, LINUX26_BINLOC, etc. Please revert this patch. Also,
> even if it were to stay in, you provided no documentation again.
> 

I may be missing something, but I do not see that there is a lot of 
documentation on the separate configuration items.
The only thing available is docs/buildroot.html which currently
does not even mention how to build linux.


Best Regards
Ulf Samuelsson
