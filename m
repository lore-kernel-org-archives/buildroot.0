From: Peter Korsgaard <jacmet@uclibc.org>
Date: Mon, 30 Aug 2010 11:47:50 +0200
Subject: [Buildroot] Buildroot 2010.08-rc2 released
Message-ID: <87k4n8xwhl.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

A bit later than hoped because of vacation and other real life issues
getting in the way, but:

Buildroot 2010.08-rc2 is released - Go download it at:

http://buildroot.net/downloads/buildroot-2010.08-rc2.tar.gz

or

http://buildroot.net/downloads/buildroot-2010.08-rc2.tar.bz2

Or get it from Git:

git://git.buildroot.net/buildroot

Please give it a spin and report any problems to the mailing list or bug
tracker. Many thanks to the people contributing to this release:

git shortlog -s -n 2010.08_rc1..
    17  Peter Korsgaard
    17  Thomas Petazzoni
     3  Gustavo Zacarias
     2  Francois Perrad
     2  Stanislav Bogatyrev
     1  Darcy Watkins
     1  Khem Raj
     1  Simon Pasch

Especially thanks to Thomas Petazzoni for collecting patches while I was
away.

We had a fair amount of fixes this time. The most critical of these are
probably that we don't enable the shared config.cache by default anymore
because of various build issues with certain package combinations and
the fact that the recent pango bump means that pango (and everything
using it) needs C++ support.

For more details, see the CHANGES file:

http://git.buildroot.net/buildroot/plain/CHANGES?id=2010.08_rc2

Unless something critical shows up, expect the final 2010.08 release
before September (E.G. tomorrow).

-- 
Bye, Peter Korsgaard
