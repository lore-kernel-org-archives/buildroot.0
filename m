From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 10 Jan 2014 07:13:26 +0800
Subject: [Buildroot] Pushing cross-compilation fixes to upstream Python
Message-ID: <20140110071326.2e539507@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

I've started updating Buildroot to use more recent versions of Python.
And at the same time, I'm trying to push the necessary
cross-compilation patches to upstream Python.

It turns out that Matthias Klose from Canonical has already done a
great job, and has pushed numerous cross-compilation fixes to Python.
Therefore, a lot less fixes are needed now.

I have submitted the following three bug reports that contain patches
to fix various cross-compilation issues:

  http://bugs.python.org/issue20211
  http://bugs.python.org/issue20212
  http://bugs.python.org/issue20213

I've also submitted some patches that add numerous --enable/--disable
options to the Python configure script to selectively enabled/disable
the build of certain Python modules or extensions. See:

  http://bugs.python.org/issue20210

It would be very useful if people working for other build systems than
Buildroot could take the time to test these patches, and support them
to ease their integration in upstream Python.

Note that these patches are against Python master, but they apply very
easily on 3.4.0b1.

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
