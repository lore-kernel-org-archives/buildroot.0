From: Adam McLaurin <buildroot@irotas.net>
Date: Sun, 24 May 2009 15:43:32 -0400
Subject: [Buildroot] Error configuring MPFR - "libgmp not found or uses a
	different ABI"
Message-ID: <1243194212.21457.1317005177@webmail.messagingengine.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

I checked out the latest buildroot from git this morning and
unfortunately cannot get it to build successfully.

The build ends like this:
checking whether the
/home/irotas/sandboxes/buildroot/build_i686/staging_dir/usr/bin/i686-linux-uclibc-g++
-Os -pipe -Os 
-I/home/irotas/sandboxes/buildroot/build_i686/staging_dir/usr/include
-I/home/irotas/sandboxes/buildroot/build_i686/staging_dir/include
--sysroot=/home/irotas/sandboxes/buildroot/build_i686/staging_dir/
-isysroot /home/irotas/sandboxes/buildroot/build_i686/staging_dir
-mtune=i686 -march=i686 linker
(/home/irotas/sandboxes/buildroot/build_i686/staging_dir/usr/bin/i686-linux-uclibc-ld)
supports shared libraries... yes
checking dynamic linker characteristics... GNU/Linux ld.so
checking how to hardcode library paths into programs... immediate
checking whether gcc __attribute__ ((mode (XX))) works... yes
checking for recent GMP... yes
checking for gmp internal files... no
checking for working alloca.h... yes
checking for alloca... yes
checking for __gmpz_init in -lgmp... no
configure: error: libgmp not found or uses a different ABI.
Please read the INSTALL file -- see "In case of problem".
make: ***
[/home/irotas/sandboxes/buildroot/build_i686/mpfr-2.4.1/.configured]
Error 1

I've uploaded the build output, configuration files, and MPFR config.log
to my website:
http://public.irotas.fastmail.fm/buildroot/buildroot.log.tgz
http://public.irotas.fastmail.fm/buildroot/config
http://public.irotas.fastmail.fm/buildroot/config.cmd
http://public.irotas.fastmail.fm/buildroot/mpfr.config.log

I also tried downloading 'buildroot-2009.02.tar.gz' and have the same
problems with that version too, so it looks like it's not a new problem.

I don't know if it matters, but I'm building on Ubuntu 8.10 (Linux
2.6.27-14).

Any suggestions?

Thanks,
Adam
