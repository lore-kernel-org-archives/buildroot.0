From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Thu, 01 Dec 2011 00:31:47 +0100
Subject: [Buildroot] Buildroot 2011.11 released
Message-ID: <874nxli3vg.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

Buildroot is a simple tool for creating complete Embedded Linux systems
(http://buildroot.net).

Buildroot 2011.11 is released - Go download it at:

http://buildroot.net/downloads/buildroot-2011.11.tar.gz

or

http://buildroot.net/downloads/buildroot-2011.11.tar.bz2

Or get it from Git:

git://git.buildroot.net/buildroot

After 3 months of development a new stable Buildroot release is
out. Significant changes are:

 - Support for local packages and package overrides

 - Documentation moved to asciidoc and extended - Run make manual to
   generate it. The online documentation on the website it not moved
   yet, but that will happen soon.

 - Custom GIT repo support for Barebox, similar to U-Boot

 - Internal and external toolchain fixes and updates. Sysroot copying
   step optimized.

 - Linux kernel extensions infrastructure added. Xenomai + RTAI
   support.

 - Package dir / name arguments dropped from {GEN,AUTO,CMAKE}TARGETS

 - Support scripts moves to scripts, patch-kernel.sh renamed to
   support/scripts/apply-patches.sh.

 - New packages: bluez-utils, cifs-utils, fftw, fluxbox, json-c,
   libev, libftdi, libgeotiff, libmodbus, libplayer, live555,
   ngrep, noip, opencv, openocd, picocom, poco, portaudio,
   pulseaudio, pv, rtai, vala, xenomai.

And the usual package version updates and bug fixes. See the CHANGES
file for details:

http://git.buildroot.net/buildroot/plain/CHANGES?id=2011.11

Thomas Petazzoni from Free Electrons gave a nice talk at ELCE in Prague
about Buildroot, including some of the new features of 2011.11. The
slides are available here:

http://elinux.org/images/2/2a/Using-buildroot-real-project.pdf

Many thanks to the people contributing to this release:

git shortlog -s -n 2011.08..

   126  Peter Korsgaard
   104  Gustavo Zacarias
    62  Thomas Petazzoni
    27  Yann E. MORIN
    21  Sven Neumann
    13  Yegor Yefremov
    10  Thomas De Schampheleire
     7  H Hartley Sweeten
     5  Frederic Bassaler
     4  Arnout Vandecappelle (Essensium/Mind)
     4  Maxime Ripard
     3  Baruch Siach
     3  Danomi Mocelopolis
     3  Jean-Christophe PLAGNIOL-VILLARD
     3  Kelvin Cheung
     2  Luca Ceresoli
     2  Murat Demirten
     2  Samuel Martin
     2  Stany MARCEL
     2  Trevor Woerner
     1  Benoit Mauduit
     1  Damian Kaczmarek
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

It has been a quite busy development cycle, with more than 400 commits,
and a number of large scale changes.

Thanks to everyone contributing and testing the release candidates, and
especially thanks to Gustavoz for his many fixes - Enjoy!

We had a very nice Buildroot developer day after ELCE, with lots of
discussions with Buildroot developers, users and people from other
Embedded projects. Thomas did a detailed writeup:

http://lists.busybox.net/pipermail/buildroot/2011-November/047229.html

We'll be working on the development items outlined in the report. Next
to that, a number of new features are pending for the upcoming cycle:

 - Support for package retrival from scp locations and Mercurial
   repositories.

 - SPARC and x86-64 QEMU defconfigs

 - Systemd support

 - Microblaze architecture support

Next release will be 2012.02. Expect the first release candidate in time
for FOSDEM, and the final release towards the end of the month.

For FOSDEM we will again arrange a Buildroot developer day, this time on
the Friday before the conference. Stay tuned for more info as we get
closer to February.

-- 
Bye, Peter Korsgaard
