From: Robert P. J. Day <rpjday@crashcourse.ca>
Date: Thu, 16 Apr 2015 09:03:59 -0400 (EDT)
Subject: [Buildroot] config choices in building for beaglebone black (BBB)?
Message-ID: <alpine.LFD.2.11.1504160857510.20888@localhost>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


  anyone who uses buildroot to build for a BBB will probably know the
answers to this instantly.

  did a "git clone" of buildroot, and did nothing more than:

  $ make beaglebone_defconfig
  $ make

so, basically, all the defaults, worked fine. so now i'm looking at my
config options and want to know how far i can push a BBB build to the
bleeding edge, and about the BBB defaults.

  first, i notice that the default build for BBB uses uClibc rather
than glibc, which is easy enough to adjust, but i'm curious as to why
something like a BBB doesn't have glibc as the default C library to
use.

  also, for bleeding edge, can anyone verify whether i'm safe pushing
the versions of everything right to the latest? you know:

  * kernel 4.0.x
  * glibc 2.21
  * binutils 2.25
  * gcc 4.9.x

and so on, and so on. any other BBB issues anyone wants to warn me
about before i go charging off in that direction? thanks.

rday

-- 

========================================================================
Robert P. J. Day                                 Ottawa, Ontario, CANADA
                        http://crashcourse.ca

Twitter:                                       http://twitter.com/rpjday
LinkedIn:                               http://ca.linkedin.com/in/rpjday
========================================================================
