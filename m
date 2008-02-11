From: Ulf Samuelsson <ulf@atmel.com>
Date: Mon, 11 Feb 2008 16:26:29 +0100
Subject: [Buildroot] Best way to add custom step
References: <47B0661A.6070605@carallon.com>
Message-ID: <000201c86d49$57af3700$2301a8c0@atmel.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

----- Original Message ----- 
From: "Will Wagner" <will_wagner@carallon.com>
To: <buildroot@uclibc.org>
Sent: Monday, February 11, 2008 4:13 PM
Subject: [Buildroot] Best way to add custom step


> Hi All,
> 
> I need to add a custom step to my build process after the linux image is 
> built into the binaries directory. I was wondering about what was the 
> best way to go about this.
> 
> I could add my changes to the top level makefile or to the 
> target\linux\Makefile.in file. Is one way better than the other? Is 
> there a better way of doing this?
> 
> Thanks,
> 


If it is board specific, then it makes more sense to put it
in target/device and let the target depend on the linux binary.

What is the custom  step?



Best Regards
Ulf Samuelsson
