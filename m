From: Jun Ma <sync.jma@gmail.com>
Date: Wed, 26 Mar 2008 17:27:07 +0800
Subject: [Buildroot] Build root fails
Message-ID: <dcf6addc0803260227r6d2e458fr242e9a529ec8a8b8@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

log message:

make[1]: Entering directory
`/root/disk/buildroot-20080325/toolchain_build_mipsel/uClibc-0.9.29'
/usr/bin/gcc -I/usr/include/ncurses -DCURSES_LOC="<ncurses.h>"
-DLOCALE  -MM *.c > .depend 2>/dev/null || :
make[2]: `conf' is up to date.
ln -fs sgidefs.h ./include/
:0: error: -march=mips32 is not compatible with the selected ABI
:0: error: -march=mips32 is not compatible with the selected ABI
  CC ldso/ldso/ldso.oS
ldso/ldso/ldso.c:1: error: -march=mips32 is not compatible with the selected ABI
make[1]: *** [ldso/ldso/ldso.oS] Error 1
make[1]: Leaving directory
`/root/disk/buildroot-20080325/toolchain_build_mipsel/uClibc-0.9.29'
make: *** [/root/disk/buildroot-20080325/toolchain_build_mipsel/uClibc-0.9.29/lib/libc.a]
Error 2

here is a link with the same problems reported:
http://www.busybox.net/lists/buildroot/2008-January/006754.html
Should I need git clone that tree, or waiting for this svn update?
:)

-- 
FIXME if it is wrong.
