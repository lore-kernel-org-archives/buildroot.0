From: Peter Korsgaard <jacmet@uclibc.org>
Date: Fri, 26 Feb 2010 16:07:23 +0100
Subject: [Buildroot] Buildroot 2010.02 released
Message-ID: <87eik83uj8.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

Buildroot 2010.02 is released - Go download it at:

http://buildroot.net/downloads/buildroot-2010.02.tar.gz

or

http://buildroot.net/downloads/buildroot-2010.02.tar.bz2

After 3 months of development a new stable Buildroot release is
out. Significant changes are:

 - Generalized package infrastructure (host/non-autotools):
   http://lists.busybox.net/pipermail/buildroot/2009-November/030600.html
 - More host packages are built, so the build doesn't break if they
   aren't available on the host

And the usual package version updates and bug fixes. See the CHANGES
file for details:

http://git.buildroot.net/buildroot/plain/CHANGES?id=2010.02

Many thanks to the people contributing to this release:

git shortlog -s -n 2009.11..
   139  Thomas Petazzoni
   124  Peter Korsgaard
    27  Lionel Landwerlin
    23  Gustavo Zacarias
     7  Julien Boibessot
     4  Nigel Kukard
     4  Sven Neumann
     2  Anders Darander
     2  Chris Packham
     2  Daniel Mack
     2  H Hartley Sweeten
     2  Richard van Paasen
     2  Will Wagner
     2  William Wagner
     2  Yann E. MORIN
     1  Cameron Hutchison
     1  Clark Rawlins
     1  Francisco Gonzalez
     1  Francisco Gonzalez Morell
     1  Hans-Christian Egtvedt
     1  Ormund Williams
     1  Rob Alley
     1  Sagaert Johan
     1  grante

The next release is going to be 2010.05. Expect the first release
candidate in late April and the final release at the end of
May.

Stuff in the pipeline for 2010.05 includes:

 - Better external toolchain support and closer cooporation with
   crosstool-ng (http://ymorin.is-a-geek.org/projects/crosstool)
 - Qemu defconfigs for easy testing
 - Improved package uninstall / rebuild support
 - Regression test suite using buildbot

Thanks to everyone contributing and testing the release candidates!

-- 
Bye, Peter Korsgaard
