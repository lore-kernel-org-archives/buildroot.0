From: Maxim Grigoriev <maxim@tensilica.com>
Date: Fri, 20 Mar 2009 18:24:15 -0700
Subject: [Buildroot] ltp-testsuite package qustion
Message-ID: <49C441BF.3070005@tensilica.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello everybody,

Can somebody, please, tell me how I can change a version of 
.../package/ltp-testsuite  ?

Is 20070228 a default ?
It seems to be hard-coded. And, ltp-testsuite patches do not apply to
a newer version.

On the  http://ltp.sourceforge.net/, the latest stable version is 
claimed to be

              ltp-full-20090228.tgz

A Two-years old version does not work quite well with recent
versions of tools and kernel / kernel headers.

One of the issues I observe is an undefined macro OPEN_MAX, which was
removed from limits.h. It's now a variable, which can be obtained, say, by

              sysconf (_SC_OPEN_MAX).

I'm hoping that switching to a newer version of LTP would fix this problem.

Any help on this will be highly appreciated.

-- Maxim Grigoriev
Tensilica, Inc., U.S.A.
(work) 408-566-1770
(cell) 510-520-3697
