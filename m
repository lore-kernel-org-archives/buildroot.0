From: Sven Neumann <s.neumann@raumfeld.com>
Date: Tue, 19 Jul 2011 20:30:31 +0200
Subject: [Buildroot] tweaking the linux scheduler for buildroot
Message-ID: <1311100232.4492.5.camel@bender>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

I've just read this blog entry:
http://blog.verbum.org/2011/07/18/tweaking-the-linux-scheduler-for-background-jobs/

It shows how to hint the linux scheduler about CPU intensive background
jobs. I've been often hit by the fact that running a large buildroot
build with a high BR2_JLEVEL in the background reduces responsiveness of
your desktop considerably. Would it be considered a good idea to add an
option for using "chrt --idle 0" for buildroot ?


Regards,
Sven
