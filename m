From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 27 Jul 2012 13:38:51 +0200
Subject: [Buildroot] [PATCH 2/3] ncurses: bump to 5.9
In-Reply-To: <50127A41.6080805@mind.be>
References: <1343328590-1803-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1343328590-1803-2-git-send-email-thomas.petazzoni@free-electrons.com>
 <50119743.3090505@zacarias.com.ar> <20120727085945.1b6339ab@skate>
 <50126BB3.2070502@zacarias.com.ar> <20120727122843.3b28ddf3@skate>
 <50127A41.6080805@mind.be>
Message-ID: <20120727133851.53f50f0e@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le Fri, 27 Jul 2012 13:23:45 +0200,
Arnout Vandecappelle <arnout@mind.be> a ?crit :

>   Does the segfault issue also occur on arm or powerpc?  Neither PTXdist
> nor OE is a big i386 user, so maybe they just didn't notice the problem.

Yesterday, I tried on ARM Cortex-A8 within the Qemu VExpress emulation
(using Linaro toolchain), and it segfaulted. I haven't tried on real
hardware though, so could always be a Qemu problem, or a toolchain
problem.

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
