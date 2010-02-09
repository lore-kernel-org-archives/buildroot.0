From: Peter Korsgaard <jacmet@uclibc.org>
Date: Tue, 09 Feb 2010 17:14:10 +0100
Subject: [Buildroot] Buildroot 2010.02-rc1 released
Message-ID: <87vde6s7xp.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

Buildroot 2010.02-rc1 is released - Go download it at:

http://buildroot.net/downloads/buildroot-2010.02-rc1.tar.gz

or

http://buildroot.net/downloads/buildroot-2010.02-rc1.tar.bz2

Or get it from Git:

git://git.buildroot.net/buildroot

Please give it a spin and report any problems to the mailing list or bug
tracker. Many thanks to the people contributing to this release:

git shortlog -s -n 2009.11..
   100  Peter Korsgaard
    70  Thomas Petazzoni
    27  Lionel Landwerlin
    22  Gustavo Zacarias
     4  Nigel Kukard
     4  Sven Neumann
     3  Julien Boibessot
     2  Anders Darander
     2  Chris Packham
     2  Daniel Mack
     2  William Wagner
     2  Yann E. MORIN
     1  Clark Rawlins
     1  Francisco Gonzalez
     1  H Hartley Sweeten
     1  Hans-Christian Egtvedt
     1  Ormund Williams
     1  Sagaert Johan
     1  grante

From now on the tree is closed for new features until after the 2010.02
release (expected at end of month). The 2009.11 announcement [1]
mentioned 3 areas for development:

 - Generalized package infrastructure
 - Regression tests (buildbot)
 - Better external toolchain / crosstool-ng support

The first one we have now (package/Makefile.package.in), and we got the
2 others pretty well hashed out during the Buildroot development day
yesterday, so they will hopefully materialize during the 2009.05 cycle.

[1]: http://lists.busybox.net/pipermail/buildroot/2009-December/030672.html

-- 
Bye, Peter Korsgaard
