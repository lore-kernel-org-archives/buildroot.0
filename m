From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Mon, 12 Nov 2012 19:35:57 +0000 (UTC)
Subject: [Buildroot] [Bug 5222] pango1.14.x build failed for ARM
In-Reply-To: <bug-5222-163@https.bugs.busybox.net/>
References: <bug-5222-163@https.bugs.busybox.net/>
Message-ID: <20121112193557.1F13999E2E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=5222

--- Comment #5 from aleek <aleksander@dutkowski.me> 2012-11-12 19:35:55 UTC ---
(In reply to comment #4)
> Are you still seeing these problems?
I have same problem with buildroot 2012.08 and pango 1.28.4

>>> pango 1.28.4 Building
PATH="/usr/aleek/arm/buildroot-2012.08/output/host/bin:/usr/aleek/arm/buildroot-2012.08/output/host/usr/bin:/usr/aleek/arm/buildroot-2012.08/output/host/usr/sbin/:/home/alek/bin/i686-nptl-linux-gnu/bin:/home/alek/bin/arm-2011.09/bin:/home/alek/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin"
PERLLIB="/usr/aleek/arm/buildroot-2012.08/output/host/usr/lib/perl" 
/usr/bin/make -j8  -C
/usr/aleek/arm/buildroot-2012.08/output/build/pango-1.28.4/
make[1]: Entering directory
`/usr/aleek/arm/buildroot-2012.08/output/build/pango-1.28.4'
/usr/bin/make  all-recursive
make[2]: Entering directory
`/usr/aleek/arm/buildroot-2012.08/output/build/pango-1.28.4'
Making all in pango
make[3]: Entering directory
`/usr/aleek/arm/buildroot-2012.08/output/build/pango-1.28.4/pango'
  GEN    s-enum-types-h
  GEN    s-enum-types-c
/usr/bin/make  all-recursive
make[4]: Entering directory
`/usr/aleek/arm/buildroot-2012.08/output/build/pango-1.28.4/pango'
Making all in opentype
make[5]: Entering directory
`/usr/aleek/arm/buildroot-2012.08/output/build/pango-1.28.4/pango/opentype'
  CC     libharfbuzz_la-hb-blob.lo
  CC     libharfbuzz_la-hb-buffer.lo
  CXX    libharfbuzz_la-hb-font.lo
  CC     libharfbuzz_la-hb-glib.lo
  CC     libharfbuzz_la-hb-shape.lo
  CC     libharfbuzz_la-hb-unicode.lo
  CXX    libharfbuzz_la-hb-ot-layout.lo
  CXX    main-main.o
  CXXLD  libharfbuzz.la
libtool: link: warning: library
`/usr/aleek/arm/buildroot-2012.08/output/host/usr/arm-unknown-linux-gnueabi/sysroot/usr/lib/libgobject-2.0.la'
was moved.
/bin/grep:
/usr/aleek/arm/buildroot-2012.08/output/host/usr/arm-unknown-linux-gnueabi/sysroot/usr/aleek/arm/buildroot-2012.08/output/host/usr/arm-unknown-linux-gnueabi/sysroot/usr/aleek/arm/buildroot-2012.08/output/host/usr/arm-unknown-linux-gnueabi/sysroot/usr/aleek/arm/buildroot-2012.08/output/host/usr/arm-unknown-linux-gnueabi/sysroot/usr/aleek/arm/buildroot-2012.08/output/host/usr/arm-unknown-linux-gnueabi/sysroot/usr/aleek/arm/buildroot-2012.08/output/host/usr/arm-unknown-linux-gnueabi/sysroot/usr/aleek/arm/buildroot-2012.08/output/host/usr/arm-unknown-linux-gnueabi/sysroot/usr/aleek/arm/buildroot-2012.08/output/host/usr/arm-unknown-linux-gnueabi/sysroot/usr/aleek/arm/buildroot-2012.08/output/host/usr/arm-unknown-linux-gnueabi/sysroot/usr/aleek/arm/buildroot-2012.08/output/host/usr/arm-unknown-linux-gnueabi/sysroot/usr/aleek/arm/buildroot-2012.08/output/build/libglib2-2.30.2/gthread/libgthread-2.0.la:
No such file or directory
/bin/sed: can't read
/usr/aleek/arm/buildroot-2012.08/output/host/usr/arm-unknown-linux-gnueabi/sysroot/usr/aleek/arm/buildroot-2012.08/output/host/usr/arm-unknown-linux-gnueabi/sysroot/usr/aleek/arm/buildroot-2012.08/output/host/usr/arm-unknown-linux-gnueabi/sysroot/usr/aleek/arm/buildroot-2012.08/output/host/usr/arm-unknown-linux-gnueabi/sysroot/usr/aleek/arm/buildroot-2012.08/output/host/usr/arm-unknown-linux-gnueabi/sysroot/usr/aleek/arm/buildroot-2012.08/output/host/usr/arm-unknown-linux-gnueabi/sysroot/usr/aleek/arm/buildroot-2012.08/output/host/usr/arm-unknown-linux-gnueabi/sysroot/usr/aleek/arm/buildroot-2012.08/output/host/usr/arm-unknown-linux-gnueabi/sysroot/usr/aleek/arm/buildroot-2012.08/output/host/usr/arm-unknown-linux-gnueabi/sysroot/usr/aleek/arm/buildroot-2012.08/output/host/usr/arm-unknown-linux-gnueabi/sysroot/usr/aleek/arm/buildroot-2012.08/output/build/libglib2-2.30.2/gthread/libgthread-2.0.la:
No such file or directory
libtool: link:
`/usr/aleek/arm/buildroot-2012.08/output/host/usr/arm-unknown-linux-gnueabi/sysroot/usr/aleek/arm/buildroot-2012.08/output/host/usr/arm-unknown-linux-gnueabi/sysroot/usr/aleek/arm/buildroot-2012.08/output/host/usr/arm-unknown-linux-gnueabi/sysroot/usr/aleek/arm/buildroot-2012.08/output/host/usr/arm-unknown-linux-gnueabi/sysroot/usr/aleek/arm/buildroot-2012.08/output/host/usr/arm-unknown-linux-gnueabi/sysroot/usr/aleek/arm/buildroot-2012.08/output/host/usr/arm-unknown-linux-gnueabi/sysroot/usr/aleek/arm/buildroot-2012.08/output/host/usr/arm-unknown-linux-gnueabi/sysroot/usr/aleek/arm/buildroot-2012.08/output/host/usr/arm-unknown-linux-gnueabi/sysroot/usr/aleek/arm/buildroot-2012.08/output/host/usr/arm-unknown-linux-gnueabi/sysroot/usr/aleek/arm/buildroot-2012.08/output/host/usr/arm-unknown-linux-gnueabi/sysroot/usr/aleek/arm/buildroot-2012.08/output/build/libglib2-2.30.2/gthread/libgthread-2.0.la'
is not a valid libtool archive
make[5]: *** [libharfbuzz.la] Error 1
make[5]: Leaving directory
`/usr/aleek/arm/buildroot-2012.08/output/build/pango-1.28.4/pango/opentype'
make[4]: *** [all-recursive] Error 1
make[4]: Leaving directory
`/usr/aleek/arm/buildroot-2012.08/output/build/pango-1.28.4/pango'
make[3]: *** [all] Error 2
make[3]: Leaving directory
`/usr/aleek/arm/buildroot-2012.08/output/build/pango-1.28.4/pango'
make[2]: *** [all-recursive] Error 1
make[2]: Leaving directory
`/usr/aleek/arm/buildroot-2012.08/output/build/pango-1.28.4'
make[1]: *** [all] Error 2
make[1]: Leaving directory
`/usr/aleek/arm/buildroot-2012.08/output/build/pango-1.28.4'
make: ***
[/usr/aleek/arm/buildroot-2012.08/output/build/pango-1.28.4/.stamp_built] Error
2

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
