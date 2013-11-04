From: Dallas Clement <dallas.a.clement@gmail.com>
Date: Mon, 4 Nov 2013 13:00:54 -0600
Subject: [Buildroot] Speeding up builds
Message-ID: <CAE9DZUT-G8g5cwWamULZ2ppUSOHjNf1O35diTno-uZj1_tCggA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi All,

I'm just looking for some tips on how to speed up my build times.  My
rootfs contains many packages with lots of dependencies.  Even with 8 fast
Xeon cores, 64GB of RAM, SSDs, and SAS drives, my builds are taking 1 hour
and 50 minutes.

When I observe CPU utilization with htop, I rarely see more than one CPU
core getting worked hard.  Occasionally, I will see all 8 cores maxed at
100%.

make -j 16 seems to make little difference.

What can I do to get all my CPU cores working all the time?

Thanks,

Dallas
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20131104/1e04a278/attachment.html>
