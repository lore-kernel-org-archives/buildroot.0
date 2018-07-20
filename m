From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 21 Jul 2018 00:31:11 +0200
Subject: [Buildroot] Buildroot 2018.02.4 released
Message-ID: <87o9f17d5c.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

Buildroot is a simple tool for creating complete embedded Linux systems
(http://buildroot.org).

Buildroot 2018.02.4 is released - Go download it at:

http://buildroot.org/downloads/buildroot-2018.02.4.tar.gz

or

http://buildroot.org/downloads/buildroot-2018.02.4.tar.bz2

Or get it from Git:

git://git.buildroot.org/buildroot

Buildroot 2018.02.4 is a bugfix release on the current long term
release, fixing a number of important / security related issues
discovered since the 2018.02.3 release.

- U-Boot: Ensure host version of ncurses is picked up and not
  host-ncurses built by buildroot, as that otherwise causes
  widechar/non-widechar conflicts and corrupted menuconfig
  menus.

- Linux: Enable CONFIG_PERF_EVENTS when perf is enabled.

- Defconfigs: Raspberrypi3: Bump rootfs size, Minnowboard-max:
  Support ethernet on Turbot variant.

- Security fixes for bind, clamav, libcurl, qpdf

For more details, see the CHANGES file:

https://git.buildroot.net/buildroot/plain/CHANGES?id=2018.02.4

Users of the affected packages are strongly encouraged to upgrade.

Many thanks to all the people contributing to this release:

git shortlog -sn 2018.02.3..

    10  Baruch Siach
     7  Fabio Estevam
     5  Ga?l PORTAY
     5  Peter Korsgaard
     4  Fabrice Fontaine
     3  Bernd Kuhls
     3  Thomas Petazzoni
     2  S?bastien Szymanski
     2  Yann E. MORIN
     1  Asgeir Bjarni Ingvarsson
     1  Bryce Ferguson
     1  Carlos Santos
     1  Christoph Engelbert
     1  Dan Walkes
     1  David De Grave (Essensium/Mind)
     1  David Owens
     1  Hollis Blanchard
     1  Jan Heylen
     1  Jason A. Donenfeld
     1  Joseph Kogut
     1  J?r?my Rosen
     1  Laurent Hartanerot
     1  Leon Anavi
     1  Marcus Folkesson
     1  Max Filippov
     1  Pierre-Louis Bossart
     1  Romain Naour

-- 
Bye, Peter Korsgaard
