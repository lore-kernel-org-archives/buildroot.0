From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 5 Aug 2015 23:09:23 +0200
Subject: [Buildroot] Buildroot 2015.08-rc1 released
Message-ID: <20150805230923.73d70019@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Buildroot 2015.08-rc1 is released - Go download it at:

http://buildroot.net/downloads/buildroot-2015.08-rc1.tar.gz

or

http://buildroot.net/downloads/buildroot-2015.08-rc1.tar.bz2

Or get it from Git:

git://git.buildroot.net/buildroot

Please give it a spin and report any problems to the mailing list or
bug tracker. Many thanks to the 106 persons who contributed to this
release:

git shortlog -s -n 2015.05..

   309  Gustavo Zacarias
   129  Bernd Kuhls
    91  Yann E. MORIN
    78  Thomas Petazzoni
    59  Francois Perrad
    37  Baruch Siach
    35  J?rg Krause
    33  Vicente Olivert Riera
    30  Maxime Hadjinlian
    28  Romain Naour
    24  Fabio Porcedda
    21  Alex Suykov
    21  Jerzy Grzegorek
    20  Alexey Brodkin
    20  Peter Korsgaard
    19  Luca Ceresoli
    18  Samuel Martin
    16  Yegor Yefremov
    15  Martin Bark
    15  Thomas De Schampheleire
    14  Clayton Shotwell
    14  Johan Oudinet
    13  Angelo Compagnucci
    12  Gary Bisson
    12  Petr Vorel
    11  Guido Mart?nez
    10  Arnout Vandecappelle
     9  Alexandre Belloni
     9  Brendan Heading
     9  Danomi Manchego
     9  Jan Viktorin
     9  Matt Weber
     7  Aur?lien Chabot
     7  Beno?t Th?baudeau
     7  Floris Bos
     7  Julien CORJON
     7  Waldemar Brodkorb
     6  Peter Seiderer
     5  James Knight
     5  Maxim Mikityanskiy
     5  Rahul Bedarkar
     5  Steven Noonan
     5  Vanya Sergeev
     4  Christian Stewart
     4  Karoly Kasza
     4  Nikolay Dimitrov
     4  Ryan Barnett
     4  Sam bobroff
     4  Ulf Magnusson
     3  Bartosz Golaszewski
     3  Gergely Imreh
     3  Guillaume GARDET
     3  J?r?me Pouiller
     3  Paul Cercueil
     3  Sebastien Bourdelin
     2  C?dric Marie
     2  Doug Kehn
     2  Frank Hunleth
     2  Geoffrey Ragot
     2  Hollis Blanchard
     2  Jonathan Ben Avraham
     2  Max Filippov
     2  Nimai Mahajan
     2  No? Rubinstein
     2  Thomas Claveirole
     2  kyak
     1  Albert Lee
     1  Antoine Tenart
     1  Arthur LAMBERT
     1  Bai Yingjie
     1  Bamvor Jian Zhang
     1  Charles Manning
     1  Christophe Vu-Brugier
     1  Colleen
     1  David Kessler
     1  David du Colombier
     1  Eric Le Bihan
     1  Eric Limpens
     1  Gwenhael Goavec-Merou
     1  Herve Codina
     1  Hoang Tran
     1  Ignacy Gaw?dzki
     1  Jordan Yelloz
     1  Jordi Montagne
     1  Julien Viard de Galbert
     1  Kinsella, Ray
     1  Lorenzo Catucci
     1  Marc-Andr? Ch?nier
     1  Matthew Starr
     1  Maxime Ripard
     1  Mikhail Peselnik
     1  Morgan Delestre
     1  Nathaniel Roach
     1  Pascal de Bruijn
     1  Peter Bouda
     1  Robert Sohn
     1  Scott Fan
     1  Simon Marchi
     1  Sylvain Raybaud
     1  S?bastien Szymanski
     1  Tal Zilcer
     1  Valentine Barshak
     1  Vivien Didelot
     1  Will Wagner
     1  Zoltan Gyarmati
     1  florent valette

And a special thanks to our patch reviewers:

git log 2015.05.. | grep -Ei '(reviewed|acked)-by:' | \
    sed 's/.*by: //' | sort | uniq -c | sort -n -r

    112 "Yann E. MORIN" <yann.morin.1998@free.fr>
     69 Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
     17 Samuel Martin <s.martin49@gmail.com>
     13 Romain Naour <romain.naour@openwide.fr>
     10 Gustavo Zacarias <gustavo@zacarias.com.ar>
      9 Arnout Vandecappelle <arnout@mind.be>
      3 Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
      2 Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>
      2 Marcin Nowakowski <marcin.nowakowski@imgtec.com>
      2 Lionel Orry <lionel.orry@gmail.com>
      2 Abhimanyu Vishwakarma <abhimanyu.v@imgtec.com>
      1 Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
      1 "Maxime Hadjinlian" <maxime.hadjinlian@gmail.com>
      1 Max Filippov <jcmvbkbc@gmail.com>
      1 "Lorenzo M. Catucci" <lorenzo@sancho.ccd.uniroma2.it>
      1 Karoly Kasza <kaszak@gmail.com>
      1 Jaap Crezee <jaap@jcz.nl>
      1 Gary Bisson <gary.bisson@boundarydevices.com>
      1 Clayton Shotwell <clayton.shotwell@rockwellcollins.com>
      1 "Christian Stewart" <c <yann.morin.1998@free.fr>hristian at paral.in>
      1 Bernd Kuhls <bernd.kuhls@t-online.de>
      1 Baruch Siach <baruch@tkos.co.il>

And to our patch testers:

git log 2015.05.. | grep -i 'tested-by:' | \
    sed 's/.*by: //' | sort | uniq -c | sort -n -r

     17 "Yann E. MORIN" <yann.morin.1998@free.fr>
      9 Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
      4 Gergely Imreh <imrehg@gmail.com>
      3 Romain Naour <romain.naour@openwide.fr>
      1 Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>
      1 Samuel Martin <s.martin49@gmail.com>
      1 Mike Williams <mike@mikebwilliams.com>
      1 Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
      1 "Lorenzo M. Catucci" <lorenzo@sancho.ccd.uniroma2.it>
      1 Karoly Kasza <kaszak@gmail.com>
      1 Jean Burgat <jeanburgat33@gmail.com>
      1 Jaap Crezee <jaap@jcz.nl>
      1 Frank Hunleth <fhunleth@troodon-software.com>
      1 Doug Kehn <rdkehn@yahoo.com>
      1 Doug Kehn <rdkehn at yahoo.com
      1 Christian Stewart <christian@paral.in>

With 1319 commits, this cycle is slightly smaller than the 2015.05
development cycle, which had 1606 commits merged when -rc1 was
released. However, the number of different contributors remains
stable: 106 this time, against 105 for the past release cycle.

Of noteworthy new features/changes we have:

Architectures:

 - Refactor how the availability of an MMU is described.
 - Minimal support for Cortex-M3
 - Minimal support for AArch64 big-endian

Toolchains:

 - Add CodeSourcery MIPS 2015.05, remove MIPS 2013.11
 - Use uClibc-ng as the default uClibc version, instead of the
   official uClibc, which hasn't done any release since 3+
   years
 - eglibc is now marked as deprecated
 - GCC: gcc 4.9.x is now the default and was updated to 4.9.3,
   support for gcc 5.x added.
 - Binutils: use Binutils 2.24 as the default, 2.25.x series
   bumped to 2.25.1, remove old Binutils 2.22.
 - Update ARC toolchain components to 2015.06
 - Add support for Fortran when building gcc

Bootloaders:

 - Support for using the kconfig configuration system in
   U-Boot

New Defconfigs:

 - VIA VAB-820/AMOS-820
 - OLimex OLinuxino A20 Lime
 - Many new defconfigs for Atmel evaluation boards:
   at91sam9rlek, at91sam9x5ek, sama5d3xek, sama5d4ek, sama5d4
   Xplained Ultra, sama5d3 Xplained.
 - ACME Systems Aria G25
 - WarPboard
 - Altera Cyclone 5 Development Board
 - Xilinx zc706
 - ARC AXS101 and AXS103 Software Development Platforms
 - Significant updates to Raspberry Pi / Raspberry Pi 2

Infrastructure:

 - Buildroot takes better care now of generating predictable
   permissions in the target filesystem. However, existing
   permissions on a custom skeleton or rootfs overlay will no
   longer be preserved. Therefore, it is necessary to add a
   permission table (BR2_ROOTFS_DEVICE_TABLE) to set the
   required permissions.
 - Add support for kconfig fragments.
 - No longer pass --{enable,disable}-debug to autotools
   packages depending on the value of
   BR2_ENABLE_DEBUG. BR2_ENABLE_DEBUG now only controls
   whether we build with -g or not.
 - Support for extracting archives in .lzma in the generic
   package infrastructure.
 - Remove random-seed file from the default skeleton, since
   seeding the entropy pool with a known seed makes more harm
   than good.
 - In the CVS download helper, add support to use a date as
   the version.
 - Add support for a per-package <pkg>_STRIP_COMPONENTS
   variable, which packages can use to specify how many path
   components should be stripped when extracting the tarball.
 - Addition of a 'kernel-module' package infrastructure, which
   simplifies the packaging of external kernel modules. Many
   existing packages are converted to use it.
 - Allow bootloaders to be implemented in $(BR2_EXTERNAL)
 - Remove /etc/securetty from the default skeleton.
 - Migration of sysV initscripts from the default skeleton to
   a package called 'initscripts', installed only when Busbox
   init or sysvinit are used.
 - Migration of the skeleton logic to a proper 'skeleton'
   package.
 - Addition of a 'linux-tools' infrastructure in the 'linux'
   package, to support building user-space tools bundled
   within the Linux kernel sources, such as perf and cpupower.
 - Usage of backticks instead of make $(shell ...) to execute
   shell commands. This allows to delay the evaluation of such
   commands when actually needed, and not when expanding the
   variables. It is useful to make 'make printvars' less
   noisy, and as a preparation to support top-level parallel
   build.
 - Libtool .la files are not mungled for all package types,
   instead of being handled only for packages using the
   autotools-package infrastructure.
 - Add mechanism to allow packages to express a dependency on
   gcc versions. This is needed for packages that use C++11 or
   C11 support for example.

Important package updates:

 - Complete rework of the matchbox packaging
 - Lots of fixes in packages for compatibility with musl and
   gcc 5.
 - Hash files added to a large number of packages.
 - Update a significant number of packages to use a new
   hosting, after the announcement of Google Code and
   Gitorious closing.
 - Major packages needed for SELinux support have been merged,
   but the support is not complete yet.
 - Significant update of OpenCV to version 3.0, and addition
   of lots of eatures.
 - Significant update of all packages supporting the GPU and
   VPU of i.MX ARM processors.
 - Addition of systemd support in a significant number of
   packages.
 - Qt5 updated to 5.5.0
 - Use modular X.org server by default instead of KDrive

Filesystems:

 - Complete overhaul of the iso9660 support. Now allows to use
   directly IS9660 as the root filesystem format and not only
   an initrd, and supports Grub 2 and isolinux in addition to
   Grub.

And the usual package version updates and bug fixes. See the CHANGES
file for details:

http://git.buildroot.net/buildroot/plain/CHANGES?id=2015.08-rc1

Like usual, we will now create a next branch and start merging in new
features, rather than wait until 2015.08 is released.

You can expect regular 2015.08-rc versions throughout the month of
August, with the final version towards the end of the month.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
