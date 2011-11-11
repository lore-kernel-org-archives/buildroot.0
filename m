From: Peter Korsgaard <jacmet@uclibc.org>
Date: Fri, 11 Nov 2011 21:33:40 +0100
Subject: [Buildroot] Buildroot 2011.11-rc1 "spinal-tap day" released
Message-ID: <87d3cy1jrv.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

Buildroot 2011.11-rc1 is released - Go download it at:

http://buildroot.net/downloads/buildroot-2011.11-rc1.tar.gz

or

http://buildroot.net/downloads/buildroot-2011.11-rc1.tar.bz2

Or get it from Git:

git://git.buildroot.net/buildroot

A bit later than expected, but what better day than 11/11/11 to do the
relese?

Please give it a spin and report any problems to the mailing list or
bug tracker. Many thanks to the people contributing to this release:

git shortlog -s -n 2011.08..
    95  Gustavo Zacarias
    93  Peter Korsgaard
    54  Thomas Petazzoni
    25  Yann E. MORIN
    17  Sven Neumann
    13  Yegor Yefremov
     7  H Hartley Sweeten
     7  Thomas De Schampheleire
     5  Frederic Bassaler
     4  Maxime Ripard
     3  Arnout Vandecappelle (Essensium/Mind)
     3  Baruch Siach
     3  Jean-Christophe PLAGNIOL-VILLARD
     3  Kelvin Cheung
     2  Danomi Mocelopolis
     2  Luca Ceresoli
     2  Murat Demirten
     2  Samuel Martin
     2  Stany MARCEL
     1  Benoit Mauduit
     1  Dan Pattison
     1  Daniel Mack
     1  Darius Augulis
     1  David Wagner
     1  Julien Boibessot
     1  Mike Frysinger
     1  Phil Edworthy
     1  Philippe Pepiot
     1  Roeland Van Praet
     1  Subramaniam C.A
     1  Wade Berrier
     1  Will Moore

It's nice to see contributions from lots of new people in addition to
the "oldtimers", and that Gustavo this time beat me to the no1 place ;)

It has been a quite busy development cycle, with more than 350
commits, and a number of large scale changes.

Of noteworthy new features we have:

 - Support for local packages and package overrides

 - Documentation moved to asciidoc - Run make manual to generate it.

 - Custom GIT repo support for Barebox, similar to U-Boot

 - Internal and external toolchain fixes and updates. Sysroot copying
   step optimized.

 - Linux kernel extensions infrastructure added. Xenomai + RTAI
   support.

 - Package dir / name arguments dropped from {GEN,AUTO,CMAKE}TARGETS

 - Support scripts moves to scripts, patch-kernel.sh renamed to
   support/scripts/apply-patches.sh.

And the usual package version updates and bug fixes. See the CHANGES
file for details:

http://git.buildroot.net/buildroot/plain/CHANGES?id=2011.11_rc1

As mentioned in the Buildroot Developer Day report, I will create a
next branch now and start merging in new features, rather than waiting
until 2011.11 is released:

http://lists.busybox.net/pipermail/buildroot/2011-November/047229.html

Enjoy!

-- 
Bye, Peter Korsgaard
