From: Stanislav Vlasic <svlasic@gmail.com>
Date: Sun, 10 Nov 2013 05:17:28 +0100
Subject: [Buildroot] Buildroot 2013.08.1, Linaro 2013.04 as toolchain,
 kernel 3.0.101, wakeup from standby issue
Message-ID: <CADYw_JJOEj-uO2yPF3BXo4wzUopvVha+wbH5=dNLHBU0CkBPEQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

little help needed.

Here are my steps I perform to suspend ARM based device:

- close all running apps (eg. XBMC)
- sync command to save all cached data
- issue mem to /sys/power/state sysfs node
- after that power indicator led turns off

That all works just fine.

After interrupt (IR remote in my case handled by uboot and ARC), kernel
wakes up, resumes all drivers, puts power led in ON state and ends up with
unknown_wakeups message.

Any help or hint would be appreciated :) Android JellyBean 4.2.2 on same
platform works way it should (it wakes up).

Thanx
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20131110/ccaa03c2/attachment.html>
