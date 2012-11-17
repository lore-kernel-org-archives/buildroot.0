From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sun, 18 Nov 2012 00:06:32 +0100
Subject: [Buildroot] Buildroot 2012.11-rc1 released
Message-ID: <87k3tjrfrb.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

A bit later than planned, but here goes:

Buildroot 2012.11-rc1 is released - Go download it at:

http://buildroot.net/downloads/buildroot-2012.11-rc1.tar.gz

or

http://buildroot.net/downloads/buildroot-2012.11-rc1.tar.bz2

Or get it from Git:

git://git.buildroot.net/buildroot

Please give it a spin and report any problems to the mailing list or
bug tracker. Many thanks to the people contributing to this release:

git shortlog -s -n 2012.08..
   210  Peter Korsgaard
   139  Gustavo Zacarias
   130  Thomas Petazzoni
    57  Allan W. Nielsen
    33  Arnout Vandecappelle (Essensium/Mind)
    31  Samuel Martin
    27  Simon Dawson
    18  Arnout Vandecappelle
    15  Yegor Yefremov
    14  Francois Perrad
    13  Valentine Barshak
     7  Maxime Ripard
     6  Jonathan Liu
     6  Sagaert Johan
     5  Mark Jackson
     5  Will Newton
     4  Luca Ceresoli
     4  Stephan Hoffmann
     4  Yann E. MORIN
     3  Alexandre Belloni
     3  Baruch Siach
     3  Danomi Manchego
     3  Marek Belisko
     3  Sven Neumann
     3  Waldemar Rymarkiewicz
     2  Alexander Khryukin
     2  Chris Zankel
     2  J.C. Woltz
     2  Kelvin Cheung
     2  Markos Chandras
     2  Stefan Froberg
     2  Thiago Correa
     2  Vellemans Noel
     2  Zoltan Gyarmati
     1  Alexander Varnin
     1  Dimitry Golubovsky
     1  Dmitry
     1  Fabio Porcedda
     1  Gregory Hermant
     1  Ismael Luceno
     1  Jean-Christophe PLAGNIOL-VILLARD
     1  Jean-Mickael Guerin
     1  Jeremy Rosen
     1  Ludovic Desroches
     1  Maxime Hadjinlian
     1  Mischa Jonker
     1  Philippe Reynes
     1  Stefan Fr?berg
     1  Vivien Didelot
     1  Waldemar Brodkorb
     1  Xinglong Liao
     1  gregory hermant

It's nice to see contributions from lots of new people in addition to
the "oldtimers". This time around Gustavoz took the lead with many many
package updates / fixes.

It has been one of the most active development cycles so far (almost 800
commits!) and a number of large scale changes.

Of noteworthy new features we have:

 - Large number of new packages (43): At91bootstrap3, Erlang, PAM, Perl,
   Python 3, ..

 - X11 stack bumped to X11R7.6

 - GCC 4.7.2, Binutils 2.23.1, New Codebench and Linaro external
   toolchains, libtirpc for modern Glibc toolchains without RPC support.
   Notice: Native toolchain on target has been deprecated.

 - Initial Aarch64 support and Xtensa support re-added

 - Legal info infrastructure has been extended and lots of packages
   annotated with their license info.

 - We are now using pkgconf instead of pkg-config

 - Nitrogen6x iMX6 + QEMU MIPS64 defconfigs added.

And the usual package version updates and bug fixes. See the CHANGES
file for details:

http://git.buildroot.net/buildroot/plain/CHANGES?id=2012.11_rc1

Like usual, I will now create a next branch and start merging in new
features, rather than wait until 2012.11 is released.

-- 
Bye, Peter Korsgaard
