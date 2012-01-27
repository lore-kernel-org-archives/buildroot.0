From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 27 Jan 2012 16:16:40 +0100
Subject: [Buildroot] Bug 3877 - Patch not working
In-Reply-To: <87wr8dji1h.fsf@macbook.be.48ers.dk>
References: <BLU0-SMTP12114F40C37660CBB539A15D28E0@phx.gbl>
 <BLU0-SMTP1654BA5FF86775DFCB3429FD28E0@phx.gbl>
 <87wr8dji1h.fsf@macbook.be.48ers.dk>
Message-ID: <20120127161640.27bec4f4@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le Fri, 27 Jan 2012 16:12:42 +0100,
Peter Korsgaard <jacmet@uclibc.org> a ?crit :

> uClibc will only add an accept4() function if your kernel headers
> expose sys_accept4, which for ARM was only added in 2.6.36.

According to his .config file, the kernel headers used were 2.6.35, so
I guess you found the right spot.

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
