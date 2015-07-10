From: Ernest Williams <realcontrols@gmail.com>
Date: Thu, 9 Jul 2015 22:52:24 -0700
Subject: [Buildroot] buildroot-2015.02: Warning: unable to open an initial
	console
Message-ID: <CADDnATf=ots8JWv-O4q9iA7Pg_RLN_1iPiZQt7wH2tV08-7ozg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

We are needing to use trace-cmd to debug our kernel.

When we create a debug version of our linux kernel using buildroot 2015.02,
I lose the console output:
CONFIG_DEBUG_KERNEL=y
CONFIG_SCHED_DEBUG=y
CONFIG_DEBUG_PREEMPT=y
CONFIG_DEBUG_RT_MUTEXES=y
CONFIG_DEBUG_MUTEXES=y
CONFIG_DEBUG_ATOMIC_SLEEP=y
*
*

dmesg shows the following:
Warning: unable to open an initial console

Indeed, I am still able to log into my target via ssh from another
terminal.
However , the other terminal containing my console connection is frozen and
no longer
responsive,

On the other hand, the same kernel with Debug options not enabled works
fine.
That is, my console is responsive during and after a system restart.

Is this a known issue?

Thanks for your help in advance.

Cheers,
Ernest
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20150709/ff455e89/attachment.html>
