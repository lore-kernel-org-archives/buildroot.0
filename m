From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Fri, 27 Jul 2012 08:40:41 -0300
Subject: [Buildroot] [PATCH 2/3] ncurses: bump to 5.9
In-Reply-To: <20120727133851.53f50f0e@skate>
References: <1343328590-1803-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1343328590-1803-2-git-send-email-thomas.petazzoni@free-electrons.com>
 <50119743.3090505@zacarias.com.ar> <20120727085945.1b6339ab@skate>
 <50126BB3.2070502@zacarias.com.ar> <20120727122843.3b28ddf3@skate>
 <50127A41.6080805@mind.be> <20120727133851.53f50f0e@skate>
Message-ID: <50127E39.5070302@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 07/27/12 08:38, Thomas Petazzoni wrote:

> Le Fri, 27 Jul 2012 13:23:45 +0200,
> Arnout Vandecappelle <arnout@mind.be> a ?crit :
> 
>>   Does the segfault issue also occur on arm or powerpc?  Neither PTXdist
>> nor OE is a big i386 user, so maybe they just didn't notice the problem.
> 
> Yesterday, I tried on ARM Cortex-A8 within the Qemu VExpress emulation
> (using Linaro toolchain), and it segfaulted. I haven't tried on real
> hardware though, so could always be a Qemu problem, or a toolchain
> problem.
> 
> Thomas

I've tried on real hardware (arm, powerpc) and it's the same issue.
I'll do some tests on a chroot (i586 or x86_64) to try track it down
since it fails too, at least for i586.
Regards.
