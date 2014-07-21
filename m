From: Markos Chandras <Markos.Chandras@imgtec.com>
Date: Mon, 21 Jul 2014 09:26:08 +0100
Subject: [Buildroot] [git commit] google-breakpad: disable on mips64
In-Reply-To: <20140720102811.0c9427d7@free-electrons.com>
References: <20140719163640.2B0A99D281@busybox.osuosl.org>	<20140720034718.GA2478@tarshish>
 <20140720102811.0c9427d7@free-electrons.com>
Message-ID: <53CCCEA0.2010905@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 07/20/2014 09:28 AM, Thomas Petazzoni wrote:
> Dear Baruch Siach,
> 
> On Sun, 20 Jul 2014 06:47:19 +0300, Baruch Siach wrote:
> 
>> On Sat, Jul 19, 2014 at 06:34:39PM +0200, Thomas Petazzoni wrote:
>>> commit: http://git.buildroot.net/buildroot/commit/?id=7ef750f4a408322e23fc2aaa822e7afa14bcbbe7
>>> branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master
>>>
>>> Due to some mmap() related issue, google-breakpad fails to build on
>>> mips64, so let's disable it for the moment. The mips/mips64 folks
>>> might be interested in fixing that later.
>>>
>>> Fixes:
>>>
>>>   http://autobuild.buildroot.org/results/2b0/2b03937693ea400ddcc7e8364ff7dc22ce651669/
>>>
>>> Cc: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
>>> Cc: Markos Chandras <Markos.Chandras@imgtec.com>
>>
>> Interesting. As this patch never appeared on the list before, does the git 
>> commits mail sending script actually Cc these addresses?
> 
> No, it was a mistake from my side: I did had these Cc: lines as I was
> planning on sending the mail to the list (to get Vicente and Markos
> informed of the issue), and then only apply the patch. Unfortunately,
> in the mean time, I applied other patches and I pushed everything.
> 
> Let's Cc them now :-)
> 
> Thanks,
> 
> Thomas
> 
Hi Thomas,

This has been reported upstream so disabling this option for MIPS64 is
fine for now.

https://code.google.com/p/google-breakpad/issues/detail?id=599&sort=-id
https://code.google.com/p/linux-syscall-support/issues/detail?id=7

Thanks for letting us know.

-- 
markos
