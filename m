From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 01 Sep 2020 23:03:46 +0200
Subject: [Buildroot] Buildroot 2020.08 released
Message-ID: <87y2lt6wgd.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

Buildroot 2020.08 is released - Go download it at:

http://buildroot.net/downloads/buildroot-2020.08.tar.gz

or

http://buildroot.net/downloads/buildroot-2020.08.tar.bz2

Or get it from Git:

git://git.buildroot.net/buildroot

Please give it a spin and report any problems to the mailing list or
bug tracker.

This was another fairly big development cycle with more than 1200
changes all over the tree and 129 unique contributors! I'm once again
very happy to see so many "new" people next to the "oldtimers".

Of noteworthy new features/changes we have:

 - Toolchain:

   - GCC 10.x added, GCC 9.x is the default
   - binutils 2.34 added, binutils 2.33 is the default, binutils 2.31
     removed
   - glibc updated to 2.31
   - ARC toolchain components updated to 2020.03-release.

 - Infrastructure:

   - qmake-package was fixed to be compatible with
     BR2_PER_PACKAGE_DIRECTORIES

 - Misc: cargo and cargo-bin packages removed, as cargo is now part
   of Rust itself

 - New packages: bitwise, earlyoom, fuse-overlayfs, gloox,
   kodi-pvr-octonet, kodi-pvr-zattoo, libabseil-cpp, libcutl, libnids,
   libnpupnp, libodb, libodb-boost, libodb-mysql, libodb-pgsql, mbpfan,
   netopeer2, odb, parprouted, python-colorzero, python-gpiozero,
   python-pybind, python-yatl, python3-cython, python3-decorator,
   python3-pycryptodomex, qt5quicktimeline, resiprocate, ttyd,
   unclutter-xfixes, urandom-scripts

 - Removed packages: cargo, cargo-bin, kodi-peripheral-steamcontroller

 - New defconfigs: bananapi_m2_zero, freescale_imx8mnevk,
   globalscale_espressobin, imx6ullevk, microchip_sama5d27_wlsom1_ek,
   rock_pi_4, rock_pi_n10

And the usual package version updates and bug fixes. See the CHANGES
file for details:

http://git.buildroot.net/buildroot/plain/CHANGES?id=2020.08

Many thanks to the people contributing to this release:

git shortlog -s -n 2020.05..

   296	Fabrice Fontaine
   104	Bernd Kuhls
    69	Thomas Petazzoni
    56	Romain Naour
    51	Peter Korsgaard
    45	Adam Duskett
    39	Peter Seiderer
    38	Francois Perrad
    35	James Hilliard
    30	Norbert Lange
    29	Yann E. MORIN
    27	Sergio Prado
    24	Heiko Thiery
    19	Pierre-Jean Texier
    17	Lubomir Rintel
    16	Baruch Siach
    15	Angelo Compagnucci
    15	Antoine Tenart
    13	Asaf Kahlon
    12	Titouan Christophe
    11	Stephane Viau
    10	Giulio Benetti
    10	Gwenhael Goavec-Merou
     9	Christian Stewart
     9	Joris Offouga
     9	Julien Olivain
     8	Grzegorz Blach
     8	Petr Vorel
     7	Bartosz Bilas
     7	Eric Le Bihan
     7	Matt Weber
     6	Gary Bisson
     6	Guillaume W. Bres
     6	Paul Cercueil
     6	Yegor Yefremov
     5	Adrian Perez de Castro
     5	Etienne Carriere
     5	Joseph Kogut
     5	J?rg Krause
     5	Stefan S?rensen
     4	Aleksander Morgado
     4	Danomi Manchego
     4	Dick Olsson
     4	Fabio Estevam
     4	Jared Bents
     4	Kamel Bouhara
     4	Maeva Manuel
     4	Mark Corbin
     3	Brandon Maier
     3	Gilles Talis
     3	Michael Nosthoff
     3	Nicolas Robin
     3	Yair Ben-Avraham
     2	Alejandro Gonz?lez
     2	Chris Packham
     2	Eugen Hristev
     2	Evgeniy Didin
     2	Frank Hunleth
     2	Gon?alo Salazar
     2	Iulian Onofrei
     2	Joachim Nilsson
     2	John Keeping
     2	Martin Bark
     2	Michael Fischer
     2	Michael Walle
     2	Nicola Di Lieto
     2	Patrick Havelange
     2	Ryan Barnett
     2	Sam Voss
     2	Sergey Matyukevich
     2	Suniel Mahesh
     2	S?bastien Szymanski
     2	Thomas De Schampheleire
     2	Vincent Fazio
     1	Aaron Sierra
     1	Alexander Dahl
     1	Alexandre Belloni
     1	Andreas Naumann
     1	Andr? Hentschel
     1	Arnout Vandecappelle (Essensium/Mind)
     1	Ash Charles
     1	Christoph Muellner
     1	Christoph M?llner
     1	Christopher Pelloux
     1	Ed Spiridonov
     1	Eloi Bail
     1	Ezequiel Garcia
     1	Felix Vollmer
     1	Frank Vanbever
     1	Gao Xiang
     1	Gregory CLEMENT
     1	Ignacy Gaw?dzki
     1	Ismael Luceno
     1	Jan Kiszka
     1	Jianhui Zhao
     1	Joel Stanley
     1	Jugurtha BELKALEM
     1	Julien Grossholtz
     1	Luca Ceresoli
     1	Lukasz Tekieli
     1	Lyle Franklin
     1	Mario Mintel
     1	Martin Elshuber
     1	Martin Kepplinger
     1	Masahiro Yamada
     1	Maxim Cournoyer
     1	Maxim Kochetkov
     1	Michael Durrant
     1	Michael Trimarchi
     1	Michael Vetter
     1	Myl?ne Josserand
     1	Nicolas Cavallari
     1	Nicolas Dufresne
     1	Nicolas Serafini
     1	Owen Walpole
     1	Pieterjan Camerlynck
     1	Ramon Fried
     1	Robert Hancock
     1	Santosh Multhalli
     1	Stefan Ott
     1	St?phane Veyret
     1	Thomas Ruschival
     1	Tian Yuanhao
     1	Tom Marcuzzi
     1	Urja Rannikko
     1	Vincent Stehl?
     1	Yann Sionneau
     1	Yi Zheng
     1	Yurii Monakov

And a special thanks to our patch reviewers (we would need more!):

git log 2020.05.. | grep -Ei '(reviewed|acked)-by:' | \
    sed 's/.*by: //' | sort | uniq -c | sort -n -r

      7 Titouan Christophe <titouan.christophe@railnova.eu>
      7 David Pierret <david.pierret@smile.fr>
      6 Romain Naour <romain.naour@gmail.com>
      5 Gary Bisson <gary.bisson@boundarydevices.com>
      4 Maeva Manuel <maeva.manuel@oss.nxp.com>
      4 Julien Olivain <julien.olivain@oss.nxp.com>
      4 Asaf Kahlon <asafka7@gmail.com>
      3 Yann E. MORIN <yann.morin.1998@free.fr>
      3 Petr Vorel <petr.vorel@gmail.com>
      3 Luca Ceresoli <luca@lucaceresoli.net>
      3 J?r?my Rosen <jeremy.rosen@smile.fr>
      3 Alexander Dahl <post@lespocky.de>
      2 Stephan Hoffmann <sho@relinux.de>
      2 Matthew Weber <matthew.weber@rockwellcollins.com>
      1 Yegor Yefremov <yegorslists@googlemail.com>
      1 Vincent Fazio <vfazio@gmail.com>
      1 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
      1 Peter Seiderer <ps.report@gmx.net>
      1 Marcin Niestroj <m.niestroj@grinn-global.com>
      1 Kieran Bingham <kieran.bingham@ideasonboard.com>
      1 J?r?my ROSEN <jeremy.rosen@smile.fr>
      1 Etienne Carriere <etienne.carriere@linaro.org>
      1 Christian Stewart <christian@paral.in>
      1 Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
      1 Alistair Francis <alistair.francis@wdc.com>

The next release will be 2020.11. Expect the first release candidate at
the beginning of November and the final release at the end of the month.

This release will be supported with security and other important fixes
until 2020.11 is out. If you need longer support then consider using our
long term support release (2020.02.x) instead which will be supported
until March 2021.

-- 
Bye, Peter Korsgaard
