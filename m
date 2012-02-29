From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Wed, 29 Feb 2012 23:31:40 +0100
Subject: [Buildroot] Buildroot 2012.02 released
Message-ID: <87boohclv7.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

Buildroot is a simple tool for creating complete Embedded Linux systems
(http://buildroot.net).

Buildroot 2012.02 is released - Go download it at:

http://buildroot.net/downloads/buildroot-2012.02.tar.gz

or

http://buildroot.net/downloads/buildroot-2012.02.tar.bz2

Or get it from Git:

git://git.buildroot.net/buildroot

After 3 months of development a new stable Buildroot release is
out. Significant changes are:

 - Package sources can now also be retrieved from scp locations and
   mercurial repositories.

 - Packages can now define device table snippets for device nodes or
   special permissions.

 - Host package dependencies are now derived from target version by
   default.

 - Host utilities menu with commonly used host tools.

 - Asciidoc-based documentation extended. Release tarballs now contain
   the generated manual in HTML/text/PDF format.

 - Numerous toolchain updates. Internal toolchain now defaults to GCC
   4.5.3. PowerPC SPE ABI support. uClibc 0.9.33 and binutils 2.22
   support.

 - LPC32xx defconfigs and bootloader support. Additional QEMU defconfigs.

 - Deprecated Java support removed. Customize package deprecated (use
   post-build scripts instead).

 - New packages: boost, connman, dstat, expedite, explorercanvas, feh,
   flot, giblib, igh-ethercat, imlib2, jquery, jquery-sparklines,
   jquery-validation, jsmin, kmod, libecore, libedbus, libedje, libeet,
   libeina, libelementary, libesmtp, libethumb, libevas, libical,
   libmbus, liboauth, liburcu, libvncserver, linux-firmware,
   lttng-{babeltrace,libust,modules,tools}, NetworkManager, open2300,
   python-distutilscross, python-dpkt, python-netifaces, python-pygame,
   python-setuptools, rt-tests, sam-ba, sane-backends, sqlcipher,
   transmission, unionfs, xf86-input-tslib, xinput-calibrator

And the usual package version updates and bug fixes. See the CHANGES
file for details:

http://git.buildroot.net/buildroot/plain/CHANGES?id=2012.02

We had another Developer Day just before FOSDEM, with lots of
interesting discussion. Arnout Vandecappelle from Mind wrote a nice
detailed report of it all:

http://lists.busybox.net/pipermail/buildroot/2012-February/050371.html

Arnout also did a nice presentation about Buildroot at FOSDEM:

http://www.mind.be/content/Presentation_Buildroot-Open-Mobile.pdf

At the Embedded Linux Conference in SF, Thomas Petazzoni from Free
Electrons gave a nice talk about Buildroot:

https://events.linuxfoundation.org/images/stories/pdf/lf_elc12_petazzoni.pdf

Thanks to both, and many thanks to all the people contributing to this
release:

git shortlog -s -n 2011.11..

   188  Peter Korsgaard
    96  Gustavo Zacarias
    39  Yegor Yefremov
    38  Arnout Vandecappelle (Essensium/Mind)
    34  Thomas Petazzoni
    19  Will Newton
    12  Daniel Mack
    10  Thomas De Schampheleire
     9  Sven Neumann
     8  Maxime Ripard
     5  Alexandre Belloni
     5  Luca Ceresoli
     4  Sagaert Johan
     2  Felipe Contreras
     2  Frank Hunleth
     2  Frederik Pasch
     2  H Hartley Sweeten
     2  Jean-Christophe PLAGNIOL-VILLARD
     2  Julien Boibessot
     1  ANDY KENNEDY
     1  Bernhard Reutner-Fischer
     1  Daniele Salvatore Albano
     1  Henri Bragge
     1  Lukasz Pulka
     1  Samuel MARTIN
     1  Sergio Prado
     1  Shawn J. Goff
     1  Trevor Woerner
     1  Tristan Lelong
     1  V?ctor Manuel J?quez Leal
     1  Yann E. MORIN

It has been a quite busy development cycle, with almost 500 commits,
lots of new packages and a number of large scale changes.

For the next release, we'll be working on the development items outlined
in the report. Next to that, a number of new features are pending for
the upcoming cycle:

 - Systemd support

 - Microblaze architecture support

 - Additional defconfigs and support for popular boards: MX53QSB,
   Beaglebone, Pandaboard and possibly Raspberry Pi.

Next release will be 2012.05. Expect the first release candidate early
May, and the final release towards the end of the month.

-- 
Bye, Peter Korsgaard
