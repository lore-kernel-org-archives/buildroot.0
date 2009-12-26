From: Marco Glatz <marco-glatz@web.de>
Date: Sat, 26 Dec 2009 14:27:53 +0100
Subject: [Buildroot] gcc-error with latest buildroot
Message-ID: <200912261427.53159.marco-glatz@web.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

hello,

i'm trying to make a toolchain using latest buildroot, but when compiling gcc 
i get this error:

checking for correct version of gmp.h... yes
checking for correct version of mpfr.h... no
configure: error: Building GCC requires GMP 4.1+ and MPFR 2.3.2+.
Try the --with-gmp and/or --with-mpfr options to specify their locations.
Copies of these libraries' source code can be found at their respective
hosting sites as well as at ftp://gcc.gnu.org/pub/gcc/infrastructure/.
See also http://gcc.gnu.org/install/prerequisites.html for additional info.
If you obtained GMP and/or MPFR from a vendor distribution package, make
sure that you have installed both the libraries and the header files.
They may be located in separate packages.
make: *** [/devel/buildroot/output/build/gcc-4.4.2-target/.configured] Fehler 1



regards,
marco
