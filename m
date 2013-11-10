From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 10 Nov 2013 09:48:02 +0100
Subject: [Buildroot] Buildroot 2013.08.1, Linaro 2013.04 as toolchain,
 kernel 3.0.101, wakeup from standby issue
In-Reply-To: <CADYw_JJOEj-uO2yPF3BXo4wzUopvVha+wbH5=dNLHBU0CkBPEQ@mail.gmail.com>
References: <CADYw_JJOEj-uO2yPF3BXo4wzUopvVha+wbH5=dNLHBU0CkBPEQ@mail.gmail.com>
Message-ID: <20131110094802.029c72fe@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Stanislav Vlasic,

On Sun, 10 Nov 2013 05:17:28 +0100, Stanislav Vlasic wrote:

> Here are my steps I perform to suspend ARM based device:
> 
> - close all running apps (eg. XBMC)
> - sync command to save all cached data
> - issue mem to /sys/power/state sysfs node
> - after that power indicator led turns off
> 
> That all works just fine.
> 
> After interrupt (IR remote in my case handled by uboot and ARC), kernel
> wakes up, resumes all drivers, puts power led in ON state and ends up with
> unknown_wakeups message.
> 
> Any help or hint would be appreciated :) Android JellyBean 4.2.2 on same
> platform works way it should (it wakes up).

What makes you think this is a Buildroot problem? It seems like a
kernel problem, so I would suggest to contact the people who did the
kernel support for your hardware platform (which you forgot to mention,
BTW).

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
