From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 7 Nov 2015 22:54:44 +0100
Subject: [Buildroot] Buildroot 2015.11-rc1 released
Message-ID: <20151107225444.2179169b@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Buildroot 2015.11-rc1 is released - Go download it at:

http://buildroot.net/downloads/buildroot-2015.11-rc1.tar.gz

or

http://buildroot.net/downloads/buildroot-2015.11-rc1.tar.bz2

Or get it from Git:

git://git.buildroot.net/buildroot

Please give it a spin and report any problems to the mailing list or
bug tracker. Many thanks to the 102 persons who contributed to this
release:

git shortlog -s -n 2015.08..

   185	Gustavo Zacarias
    86	Vicente Olivert Riera
    75	Bernd Kuhls
    61	Thomas Petazzoni
    45	Yann E. MORIN
    40	Peter Korsgaard
    37	Baruch Siach
    36	Arnout Vandecappelle
    33	J?rg Krause
    33	Peter Seiderer
    24	Francois Perrad
    19	Gary Bisson
    19	Maxime Hadjinlian
    15	Luca Ceresoli
    14	Chris Packham
    14	James Knight
    13	Beno?t Th?baudeau
    13	Jerzy Grzegorek
    11	Waldemar Brodkorb
     8	Christophe Vu-Brugier
     7	Martin Bark
     7	Max Filippov
     6	Alexey Brodkin
     5	Ben Shelton
     5	Brendan Heading
     5	Jonathan Ben Avraham
     5	Romain Naour
     5	Ryan Barnett
     4	Gwenhael Goavec-Merou
     4	J?r?me Pouiller
     4	Petr Vorel
     4	Rodrigo Rebello
     4	Thijs Vermeir
     4	Thomas De Schampheleire
     4	Tom Sparks
     3	Anders Roxell
     3	David du Colombier
     3	Nikolay Dimitrov
     3	Rahul Bedarkar
     3	Steven Noonan
     3	Yegor Yefremov
     2	Alex Suykov
     2	Alexander Dahl
     2	Ariel D'Alessandro
     2	Bj?rn Forsman
     2	Charles Duffy
     2	Davide Viti
     2	Doug Kehn
     2	Douglas RAILLARD
     2	Fabio Porcedda
     2	Francesco Nwokeka
     2	Gabe Evans
     2	Giovanni Zantedeschi
     2	Jeremy Kerr
     2	Johan Oudinet
     2	Julian Scheel
     2	Mike Williams
     2	No? Rubinstein
     2	Scott Fan
     2	jpinto
     2	kei-k at ca2.so-net.ne.jp
     1	Alexander Lukichev
     1	Andreas Wetzel
     1	Andr? Hentschel
     1	Aur?lien Chabot
     1	Bartosz Golaszewski
     1	Carlos Santos
     1	Chris Lesiak
     1	Cyril Bur
     1	C?dric Marie
     1	Danomi Manchego
     1	David Kosir
     1	Ed Swierk
     1	Edson Siqueira
     1	Ezequiel Garc?a
     1	Frank Hunleth
     1	Gergely Imreh
     1	Guillaume GARDET
     1	Herve Codina
     1	Jan Viktorin
     1	Joao Pinto
     1	Julien Boibessot
     1	Julien CORJON
     1	Marc
     1	Matt Weber
     1	Matthias Weisser
     1	Nicolas Cavallari
     1	Parnell Springmeyer
     1	Phil Eichinger
     1	Ray Kinsella
     1	Remi Pommarel
     1	Renaud AUBIN
     1	Ronak Desai
     1	Samuel Martin
     1	Sergio Prado
     1	Stephen Agate
     1	Steve Calfee
     1	Trent Piepho
     1	Viallard Anthony
     1	Vincent Stehl?
     1	guillaume william brs
     1	vicencb at gmail.com

And a special thanks to our patch reviewers:

git log 2015.08.. | grep -Ei '(reviewed|acked)-by:' | \
    sed 's/.*by: //' | sort | uniq -c | sort -n -r

     81 Vicente Olivert Riera <Vincent.Riera@imgtec.com>
     45 Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
     34 "Yann E. MORIN" <yann.morin.1998@free.fr>
     22 Romain Naour <romain.naour@openwide.fr>
      9 Gustavo Zacarias <gustavo@zacarias.com.ar>
      6 Samuel Martin <s.martin49@gmail.com>
      4 Bernd Kuhls <bernd.kuhls@t-online.de>
      3 Marcin Nowakowski <marcin.nowakowski@imgtec.com>
      3 Luca Ceresoli <luca@lucaceresoli.net>
      3 J?rg Krause <joerg.krause@embedded.rocks>
      3 "James Knight" <james.knight@rockwellcollins.com>
      2 Baruch Siach <baruch@tkos.co.il>
      1 Yegor Yefremov <yegorslists@googlemail.com>
      1 Vivien Didelot <vivien.didelot@savoirfairelinux.com>
      1 Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
      1 Ryan Barnett <ryanbarnett3@gmail.com>
      1 Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
      1 "Maxime Hadjinlian" <maxime.hadjinlian@gmail.com>
      1 "James Knight" <james.d.knight@live.com>
      1 Gary Bisson <gary.bisson@boundarydevices.com>
      1 Francois Perrad <francois.perrad@gadz.org>
      1 Alexander Dahl <post@lespocky.de>
      1 Waldemar Brodkorb <wbx@uclibc-ng.org>

And to our patch testers:

git log 2015.08.. | grep -i 'tested-by:' | \
    sed 's/.*by: //' | sort | uniq -c | sort -n -r

     61 Vicente Olivert Riera <Vincent.Riera@imgtec.com>
      5 Gustavo Zacarias <gustavo@zacarias.com.ar>
      4 "Yann E. MORIN" <yann.morin.1998@free.fr>
      4 Peter Seiderer <ps.report@gmx.net>
      3 Mike Williams <mike@mikebwilliams.com>
      3 Luca Ceresoli <luca@lucaceresoli.net>
      3 Gergely Imreh <imrehg@gmail.com>
      3 Gary Bisson <gary.bisson@boundarydevices.com>
      2 Romain Naour <romain.naour@openwide.fr>
      2 Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
      1 Vivien Didelot <vivien.didelot@savoirfairelinux.com>
      1 Ryan Barnett <ryanbarnett3@gmail.com>
      1 Nicolas Cavallari <nicolas.cavallari@green-communications.fr>
      1 "Maxime Hadjinlian" <maxime.hadjinlian@gmail.com>
      1 Jan Viktorin <viktorin@rehivetech.com>
      1 Brendan Heading <brendanheading@gmail.com>
      1 Bernd Kuhls <bernd.kuhls@t-online.de>

With 953 commits, this cycle is quite notably smaller than the
previous -rc1 cycles (1319 for 2015.08-rc1, 1606 for
2015.05-rc1). However, the number of different contributors remains
stable: 102 this time, against 106 for 2015.08-rc1 and 105 for
2015.05-rc1.

Of noteworthy new features/changes we have:

Architectures:

- Support for sparc64 added (internal toolchain with glibc
  only).

- Support for mips32r6 and mips64r6 added.

- Support for Intel Quark X1000 CPU.

- Switch to EABIhf by default on ARM when a VFP is available.

Toolchains:

- glibc 2.22, gdb 7.10, use gdb 7.9 by default, musl 1.1.12,
  uclibc-ng 1.0.8, host-gdb enabled on AArch64.

- The toolchain wrapper which was used only for external
  toolchains is now also used for Buildroot internal
  toolchains. This allowed to fix the ccache support, prepare
  the way for top-level parallel build support and remove gcc
  patches used to detect header/library path poisoning.

- Remove Analog Devices Blackfin toolchain 2012R2.

- Fix several Xtensa build failures by switching from
  text-section-literals to auto-litpools.

- Enable MIPS64 support in uClibc-ng, use uClibc on ARC
  rather than a specific fork.

- Linaro toolchains for ARM, ARMeb and AArch64 updated to
  2015.08. 2014.09 version is kept since 2015.08 only runs on
  x86_64 hosts.

Bootloaders:

- Fix ARM64 support in U-Boot.

Defconfigs:

- Added: ARC HS38 VDK virtual boards, Avnet Microzed, Boundary
  Devices Nitrogen SoloX, Freescale i.MX6 SoloX Sabre SD,
  OLinuxino A20 Lime2, Qemu Sparc64, Qemu SuperH 4 big endian,
  Synopsys AArch64 VDK virtual platform.

- Updated: calao_qil_a9260, calao_usb_a9g20_lpw, ci20,
  cubieboad, freescale_imx6_*, imx53loco, imx6_vab820,
  mpc8315erdb, qmx6, p1010rdb, qemu, raspberrypi,
  raspberrypi2, riotboard, snps_axs10*, wandboard.

- Removed: at91rm9200df, at91sam9260dfc, at91sam9263ek,
  calao_snowball_defconfig, gnublin, integrator926_defconfig.

Infrastructure:

- Support for fetching from Mercurial tags fixed.

- Introduce LINUX_NEEDS_MODULES, which allows to enforce
  module support to be enabled in the kernel when a package
  builds out-of-tree kernel modules (through the
  pkg-kernel-module infrastructure or on its own).

- Improve the perl package infrastructure to automatically add
  the dependency to the perl interpreter to target perl module
  packages.

- Remove trailing slashes in <pkg>_SITE and addition of a
  check to ensure such trailing slashes are no longer added.

- Extend the legal infrastructure to allow packages to declare
  their actual source code. This is useful for packages for
  which <pkg>_SOURCE points to pre-built binaries (as is the
  case for external toolchains). The new <pkg>_ACTUAL_SOURCE
  variable allows to point to the source code in such cases.

- Improved ccache support, thanks to the usage of a toolchain
  wrapper for internal toolchain. Now a single cache directory
  can be shared between different Buildroot builds.

- Addition of a 'graph-size' make targets, which generates a
  PDF graph of per-package size of the root filesystem.

- Addition of <pkg>_EXCLUDES so that packages can request
  certain parts of the source code tarball to not be
  extracted. This feature is currently used by gcc and
  toolchain-external.

- Packages can now use the <pkg>_PKGDIR variable, provided by
  the package infrastructure, to reference their package
  directory, instead of explicitly using package/<pkg>/.

Filesystems:

- Add high lz4 compression to squashfs.

- Simplification of shell profile files in the default
  skeleton.

- Remove ftp user and /home/ftp from the skeleton, and let ftp
  server packages create these when needed.

- Add support for /bin, /sbin and /lib to be symlinks to their
  corresponding directories in /usr. This is enforced for
  systemd configurations, and optional for other
  configurations.

- Support for AXFS filesystem image generation added.

- New options to add extra space/inodes to ext2/3/4 images.

And the usual package version updates and bug fixes. See the CHANGES
file for details:

http://git.buildroot.net/buildroot/plain/CHANGES?id=2015.11-rc1

Like usual, we will now create a next branch and start merging in new
features, rather than wait until 2015.11 is released.

You can expect regular 2015.11-rc versions throughout the month of
November, with the final version towards the end of the month.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
