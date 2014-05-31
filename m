From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 31 May 2014 10:21:30 +0200
Subject: [Buildroot] Buildroot 2014.05 released
Message-ID: <87vbsm5pf9.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

Buildroot 2014.05 is released - Go download it at:

http://buildroot.net/downloads/buildroot-2014.05.tar.gz

or

http://buildroot.net/downloads/buildroot-2014.05.tar.bz2

Or get it from Git:

git://git.buildroot.net/buildroot

Please give it a spin and report any problems to the mailing list or
bug tracker. Many thanks to the people contributing to this release:

git shortlog -s -n 2014.02..

   190	Gustavo Zacarias
   154	Thomas Petazzoni
   151	Yann E. MORIN
   141	Bernd Kuhls
    84	Peter Korsgaard
    50	Samuel Martin
    44	Francois Perrad
    40	Baruch Siach
    33	Maxime Hadjinlian
    33	Thomas De Schampheleire
    31	Fabio Porcedda
    29	Jerzy Grzegorek
    26	Eric Le Bihan
    22	Yegor Yefremov
    21	Max Filippov
    21	Vicente Olivert Riera
    19	Romain Naour
    13	Ryan Barnett
    12	Anton Kolesov
    11	Luca Ceresoli
    11	Peter Seiderer
     7	Arnout Vandecappelle
     7	Frank Hunleth
     6	Axel Lin
     6	Simon Dawson
     5	Clayton Shotwell
     5	Danomi Manchego
     5	Davide Viti
     5	Sagaert Johan
     4	Alexey Brodkin
     4	Fatih A??c?
     4	Hadrien Boutteville
     4	Waldemar Brodkorb
     3	Alexandre Belloni
     3	Alvaro G. M
     3	Ezequiel Garc?a
     3	Heiko Abraham
     3	Ivan Sergeev
     3	Jeremy Kerr
     3	Jer?nimo Lopes
     3	Maarten ter Huurne
     3	Marcelo Gutierrez
     3	Phil Eichinger
     3	Sven Neumann
     3	Will Wagner
     2	Andrew Ruder
     2	Brian Beattie
     2	Eric Nelson
     2	Ezequiel Garcia
     2	Johan Derycke
     2	Matt Weber
     2	Mischa Jonker
     2	Paul Cercueil
     2	Peter K?mmel
     2	alex.bennee at linaro.org
     1	ANDY KENNEDY
     1	Alexander Khryukin
     1	Andreas Ehmanns
     1	Andrew Barnes
     1	Arnaud Aujon
     1	Arnaud R?billout
     1	Charles Manning
     1	Christophe Vu-Brugier
     1	C?dric Ch?pied
     1	Dan Moulding
     1	Daniel Nystr?m
     1	Denis Bodor
     1	Derycke, Johan
     1	Dima Zavin
     1	Filippo Sironi
     1	Frank Bergmann
     1	Jan Drazil
     1	Jouko Nikula
     1	Julien Boibessot
     1	Lionel Orry
     1	Lucile Quirion
     1	L?vai Tam?s
     1	Marcin Bis
     1	Martin Bark
     1	Noam Camus
     1	Oscar Hellstr?m
     1	Peter Meerwald
     1	Philip Paeps
     1	Philippe Reynes
     1	Przemyslaw Wrzos
     1	Rohan Fletcher
     1	Ryan Coe
     1	Sebastien Bourdelin
     1	Sebastien Roy
     1	Stefan S?rensen
     1	Uwe Kindler
     1	Vincent Stehl?
     1	Wojciech M. Zabolotny
     1	Wojciech Slenska

And a special thanks to our patch reviewers:

git log 2014.02.. | grep -Ei '(reviewed|acked)-by:' | \
    sed 's/.*[bB]y: //' | sort | uniq -c | sort -n -r

     50 Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
     48 "Yann E. MORIN" <yann.morin.1998@free.fr>
     30 Samuel Martin <s.martin49@gmail.com>
     18 Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>
     13 Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
     10 Gustavo Zacarias <gustavo@zacarias.com.ar>
      4 Fatih A??c? <fatih.asici@gmail.com>
      4 Bernd Kuhls <bernd.kuhls@t-online.de>
      3 Romain Naour <romain.naour@openwide.fr>
      3 Markos Chandras <Markos.Chandras@imgtec.com>
      3 Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
      2 Markos Chandras <markos.chandras@imgtec.com>
      2 Luca Ceresoli <luca@lucaceresoli.net>
      2 Eric Le Bihan <eric.le.bihan.dev@free.fr>
      1 Simon Dawson <spdawson@gmail.com>
      1 Romain Naour<romain.naour@openwide.fr>
      1 Paul Cercueil <paul@crapouillou.net>
      1 Maarten ter Huurne <maarten@treewalker.org>
      1 Jeremy Kerr <jk at ozlabs.org.
      1 Fabio Porcedda <fabio.porcedda@gmail.com>
      1 Chris Packham <judge.packham@gmail.com>
      1 Baruch Siach <baruch@tkos.co.il>

Once again our autobuilders have helped us fix a huge amount of build
issues. Thanks to all the people reviewing failures and fixing issues:

for i in $(git log --format=%H 2014.02..); do \
    git show --quiet $i | grep -q http://autobuild && \
    git show --quiet --format="%an" $i ; done | sort | uniq -c | \
        sort -rn -k1

     59 Thomas Petazzoni
     35 Gustavo Zacarias
     27 Baruch Siach
     17 Peter Korsgaard
     16 Samuel Martin
     15 Vicente Olivert Riera
     14 Yann E. MORIN
     13 Bernd Kuhls
      9 Romain Naour
      8 Eric Le Bihan
      4 Max Filippov
      4 Arnout Vandecappelle
      4 Anton Kolesov
      2 Peter Seiderer
      2 Hadrien Boutteville
      2 Fatih A??c?
      2 Alvaro G. M
      1 Yegor Yefremov
      1 Thomas De Schampheleire
      1 Mischa Jonker
      1 Luca Ceresoli
      1 Frank Bergmann
      1 Francois Perrad
      1 Ezequiel Garc?a

The autobuilder graph shows a very nice decrease in build issues during
the stabilization phase:

http://autobuild.buildroot.net/stats.php

This time again we had almost 100 unique contributors! I'm very happy
to see so many "new" people next to the "oldtimers". It was also a very
busy cycle with close to 1300 commits (a new record I believe) and
changes all over the tree.

Of noteworthy new features we have:

 - Toolchains: Musl C library support. GCC 4.9.x and Glibc 2.19 support.
   Environment variable to control debug output of toolchain wrapper
   renamed to BR2_DEBUG_WRAPPER to match the other variables. Toolchain
   tuple vendor name can now be customized. A GDB gdbinit file is now
   generated for external toolchains to automatically set the correct
   sysroot. Updated Linaro external toolchains and support for ARMEB
   variant. Internal toolchain support for Aarch64 and Microblaze.

 - Kconfig handling for minimum kernel headers version required for
   packages. Now packages needing specific kernel header features can
   specify these requirements in Kconfig.

 - Python package infrastructure extended to handle Python 3.x. Perl and
   virtual package infrastructure support. See user manual for details.

 - Support for (but disabled as it leads to unreproducible builds)
   toplevel parallel builds. See the comment at the top of Makefile for
   details about how to enable it and what the problems are if you want
   to test it.

 - Modern (v212) Systemd version and support for eudev.

 - Large number of new packages (77):
   Big: postgresql, samba4, xbmc. Bootloaders: gnu-efi, grub2, gummiboot.
   Mail: exim, fetchmail. Filesystem: btrfs-progs, e2tools, yaffsutils.
   Lua/Perl/Php/Python related: ljlinenoise, lpeg, lpty, lrandom,
   lsqlite3, lualogging, lua-messagepack, lua-testmore, lunit, lua-coat,
   lua-coatpersistent, lua-csnappy, luajson, perl-module-build,
   php-gnupg, php-imagick, php-ssh2, php-yaml, php-zmq,
   python-libconfig, python-pypcap, python-pyrex

 - New defconfigs: Minnowboard and Altera SoCkit added, updates to a
   bunch of our existing configs.

 - And a new website!

And the usual package version updates and bug fixes. See the CHANGES
file for details:

http://git.buildroot.net/buildroot/plain/CHANGES?id=2014.05

Next release will be 2014.08. Expect the first release candidate late
July, and the final release at the end of August.

The next developers meeting will take place just before the Embedded
Linux Conference Europe in D?sseldorf, Germany:

http://lists.busybox.net/pipermail/buildroot/2014-February/088978.html

We are looking for companies willing to sponsor this Developers
Meeting. The budget is in the 250-500 EUR range, so it's fairly cheap
for most companies, but allows us to cover the cost of the meeting room,
and optionally the Saturday dinner for the participants.

And finally we already have a number of interesting changes lined up for
the next cycle (either already on next or under review):

 - PowerPC64 / PowerPC64 LE support

 - Qt 5.3

 - XBMC update to 13.1 (Gotham)

Enjoy!

-- 
Bye, Peter Korsgaard
