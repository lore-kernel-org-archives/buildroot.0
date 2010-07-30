From: Peter Korsgaard <jacmet@uclibc.org>
Date: Fri, 30 Jul 2010 13:03:03 +0200
Subject: [Buildroot] Buildroot 2010.08-rc1 released (and ponies!)
Message-ID: <87y6ctjkpk.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

Buildroot 2010.08-rc1 is released - Go download it at:

http://buildroot.net/downloads/buildroot-2010.08-rc1.tar.gz

or

http://buildroot.net/downloads/buildroot-2010.08-rc1.tar.bz2

Or get it from Git:

git://git.buildroot.net/buildroot

Please give it a spin and report any problems to the mailing list or bug
tracker. Many thanks to the people contributing to this release:

git shortlog -s -n 2010.05..
   153  Peter Korsgaard
   150  Thomas Petazzoni
    35  Gustavo Zacarias
    18  cmchao
     8  Luca Ceresoli
     7  Paul Jones
     6  Lionel Landwerlin
     6  Malte Starostik
     4  Yann E. MORIN
     3  Julien Boibessot
     2  Dmytro Milinevskyy
     2  Khem Raj
     2  Nick Leverton
     2  Peter Huewe
     1  Baruch Siach
     1  Bj?rn Forsman
     1  Daniel Hobi
     1  Darius Augulis
     1  H Hartley Sweeten
     1  Karl Krach
     1  Kelvin Cheung
     1  Ossy
     1  Sagaert Johan
     1  Slava Zanko
     1  Thiago A. Correa
     1  Will Wagner

And especially thanks to Thomas Petazzoni for resolving a lot of
bugzilla issues - We were able to resolve 65 issues during this
development cycle.

We had a lot of cleanup happening this time: Bootloaders and Linux
kernel handling was reworked and lots of packages converted to
AUTOTARGETS/GENTARGETS. On the toolchain side we now have support for
(snapshot) NPTL handling in uClibc.
Buildroot can now be configured through the GTK-based 'make gconfig'.
A number of older packages and rarely used architectures have been
marked as broken, and will be removed during the 2010.11 development
cycle unless someone steps up to support them.

For more details, see the CHANGES file:

http://git.buildroot.net/buildroot/plain/CHANGES?id=2010.08_rc1

Notice: I'll be away for the next 3 weeks, so don't expect fast
replies or new release candidates during that time. Thomas has
promised to collect fixes and send them to me once I get back - Thanks
for that.

-- 
Bye, Peter Korsgaard
