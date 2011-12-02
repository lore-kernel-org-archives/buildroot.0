From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 3 Dec 2011 00:08:54 +0100
Subject: [Buildroot] Real time Linux implementation
In-Reply-To: <4ED91A0B.10403@relinux.de>
References: <CAO6BqMXyye4TFHf0Pxc99Naq28wWg1ne=--q=e+VmfvPVuwD3w@mail.gmail.com>
 <20111201221840.00174379@skate> <4ED91A0B.10403@relinux.de>
Message-ID: <20111203000854.6dcc2764@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le Fri, 02 Dec 2011 19:33:47 +0100,
Stephan Hoffmann <sho@relinux.de> a ?crit :

> what do you think about adding the PREEMPT_RT patch as a config option
> to buildroot?

That would definitely be nice. The only problem is that PREEMPT_RT is
far from being available for every upstream kernel version, so it's a
bit hard to integrate from that perspective, but this isn't much
different from Xenomai and RTAI having similar kernel version
constraints. So, yes, having some PREEMPT_RT integration would be nice,
at least to show that it is possible.

Regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
