From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 6 Nov 2010 13:44:54 +0100
Subject: [Buildroot] Results of random configuration builds
Message-ID: <20101106134454.7769d258@surf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

I've run a few random build tests yesterday, and analyzed the results a
bit today. I've set up a small webpage that gathers the results,
together with the logfile and the configuration for each test.

See http://free-electrons.com/~thomas/pub/buildroot-logs/

Most of the builds are failing. The worst problem is that libglib2 does
not build in many situations (see
http://free-electrons.com/~thomas/pub/buildroot-logs/test-195/logfile-end).
There are also problems with logrotate, gvfs, libgcrypt, olsr, libmad,
netperf, magiccube4d, libmpeg2, xfsprogs, imagemagick, squid, ltrace,
tcpdump, bash, gmp, gdb.

It'd be great if some of the readers of this list could have a look at
one or several of these build problems, so that we can collaboratively
solve them.

Thanks!

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
