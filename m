From: don <don_reid@comcast.net>
Date: Thu, 27 Sep 2007 11:17:57 -0700
Subject: [Buildroot] Libtool error with AVR32
Message-ID: <20070927181757.GA8519@reid1.localdomain>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

I tried to use the latest AVR32 release from ATmel and got an error.
Is there somewhere else to post that other than this list?

The error is in build_avr32_nofpu/libdaemon-0.12 and is:

...
configure: WARNING: In the future, Autoconf will not detect cross-tools
whose name does not start with the host triplet.  If you think this
configuration is useful to you, please write to autoconf at gnu.org.
checking whether we are using the GNU Fortran 77 compiler... yes
checking whether gfortran accepts -g... yes
checking the maximum length of command line arguments... 98304
checking command to parse /home/dev/AVR32/Buildroot/buildroot-avr32-2.1.0-rc5/build_avr32_nofpu/staging_dir/usr/bin/avr32-linux-uclibc-nm output from /home/dev/AVR32/Buildroot/buildroot-avr32-2.1.0-rc5/build_avr32_nofpu/staging_dir/usr/bin/avr32-linux-uclibc-gcc -Os -pipe  -I/home/dev/AVR32/Buildroot/buildroot-avr32-2.1.0-rc5/build_avr32_nofpu/staging_dir/usr/include -msoft-float object... ok
checking for objdir... .libs
checking for avr32-linux-ar... /home/dev/AVR32/Buildroot/buildroot-avr32-2.1.0-rc5/build_avr32_nofpu/staging_dir/usr/bin/avr32-linux-uclibc-ar
checking for avr32-linux-ranlib... /home/dev/AVR32/Buildroot/buildroot-avr32-2.1.0-rc5/build_avr32_nofpu/staging_dir/usr/bin/avr32-linux-uclibc-ranlib
checking for avr32-linux-strip... (cached) /home/dev/AVR32/Buildroot/buildroot-avr32-2.1.0-rc5/build_avr32_nofpu/staging_dir/usr/bin/avr32-linux-uclibc-strip
checking for correct ltmain.sh version... no
configure: error:

*** [Gentoo] sanity check failed! ***
*** libtool.m4 and ltmain.sh have a version mismatch! ***
*** (libtool.m4 = 1.5.24, ltmain.sh = "1.5.22 Debian 1.5.22-4") ***

Please run:

  libtoolize --copy --force

if appropriate, please contact the maintainer of this
package (or your distribution) for help.

make: *** [/home/dev/AVR32/Buildroot/buildroot-avr32-2.1.0-rc5/build_avr32_nofpu/libdaemon-0.12/.configured] Error 1
