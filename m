From: Rohit Kumar <rkthebest@gmail.com>
Date: Sun, 6 Jul 2014 14:16:20 +0900
Subject: [Buildroot] toolchain building error with basic configuration
Message-ID: <CABzetm1ox4vAEHJY0U_OrmUiUjqrEUAnvwRO33ZXQvyu8NhVYg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,


i am trying to build simple toolchain for ARM11 with basic configuration.
but its giving follwing error.

mv -f
/home/rohit/Desktop/buildroot/output/host/usr/arm-buildroot-linux-gnueabi/sysroot/usr/bin/sprof.new
/home/rohit/Desktop/buildroot/output/host/usr/arm-buildroot-linux-gnueabi/sysroot/usr/bin/sprof
mkdir -p --
/home/rohit/Desktop/buildroot/output/host/usr/arm-buildroot-linux-gnueabi/sysroot/usr/lib/audit
mv -f
/home/rohit/Desktop/buildroot/output/host/usr/arm-buildroot-linux-gnueabi/sysroot/usr/bin/pldd.new
/home/rohit/Desktop/buildroot/output/host/usr/arm-buildroot-linux-gnueabi/sysroot/usr/bin/pldd
/usr/bin/install -c
/home/rohit/Desktop/buildroot/output/build/glibc-2.19/build/elf/sotruss-lib.so
/home/rohit/Desktop/buildroot/output/host/usr/arm-buildroot-linux-gnueabi/sysroot/usr/lib/audit/sotruss-lib.so.new
rm -f
/home/rohit/Desktop/buildroot/output/host/usr/arm-buildroot-linux-gnueabi/sysroot/lib/ld-linux.so.3
mv -f
/home/rohit/Desktop/buildroot/output/host/usr/arm-buildroot-linux-gnueabi/sysroot/usr/lib/audit/sotruss-lib.so.new
/home/rohit/Desktop/buildroot/output/host/usr/arm-buildroot-linux-gnueabi/sysroot/usr/lib/audit/sotruss-lib.so
ln -s `../scripts/rellns-sh -p
/home/rohit/Desktop/buildroot/output/host/usr/arm-buildroot-linux-gnueabi/sysroot/lib/
ld-2.19.so
/home/rohit/Desktop/buildroot/output/host/usr/arm-buildroot-linux-gnueabi/sysroot/lib/ld-linux.so.3`
/home/rohit/Desktop/buildroot/output/host/usr/arm-buildroot-linux-gnueabi/sysroot/lib/ld-linux.so.3
mv -f
/home/rohit/Desktop/buildroot/output/build/glibc-2.19/build/elf/stubsT
/home/rohit/Desktop/buildroot/output/build/glibc-2.19/build/elf/stubs
make[3]: Leaving directory
`/home/rohit/Desktop/buildroot/output/build/glibc-2.19/elf'
(sed '/^@/d' include/stubs-prologue.h; LC_ALL=C sort
/home/rohit/Desktop/buildroot/output/build/glibc-2.19/build/csu/stubs
/home/rohit/Desktop/buildroot/output/build/glibc-2.19/build/iconv/stubs
/home/rohit/Desktop/buildroot/output/build/glibc-2.19/build/locale/stubs
/home/rohit/Desktop/buildroot/output/build/glibc-2.19/build/localedata/stubs
/home/rohit/Desktop/buildroot/output/build/glibc-2.19/build/iconvdata/stubs
/home/rohit/Desktop/buildroot/output/build/glibc-2.19/build/assert/stubs
/home/rohit/Desktop/buildroot/output/build/glibc-2.19/build/ctype/stubs
/home/rohit/Desktop/buildroot/output/build/glibc-2.19/build/intl/stubs
/home/rohit/Desktop/buildroot/output/build/glibc-2.19/build/catgets/stubs
/home/rohit/Desktop/buildroot/output/build/glibc-2.19/build/math/stubs
/home/rohit/Desktop/buildroot/output/build/glibc-2.19/build/setjmp/stubs
/home/rohit/Desktop/buildroot/output/build/glibc-2.19/build/signal/stubs
/home/rohit/Desktop/buildroot/output/build/glibc-2.19/build/stdlib/stubs
/home/rohit/Desktop/buildroot/output/build/glibc-2.19/build/stdio-common/stubs
/home/rohit/Desktop/buildroot/output/build/glibc-2.19/build/libio/stubs
/home/rohit/Desktop/buildroot/output/build/glibc-2.19/build/dlfcn/stubs
/home/rohit/Desktop/buildroot/output/build/glibc-2.19/build/malloc/stubs
/home/rohit/Desktop/buildroot/output/build/glibc-2.19/build/string/stubs
/home/rohit/Desktop/buildroot/output/build/glibc-2.19/build/wcsmbs/stubs
/home/rohit/Desktop/buildroot/output/build/glibc-2.19/build/timezone/stubs
/home/rohit/Desktop/buildroot/output/build/glibc-2.19/build/time/stubs
/home/rohit/Desktop/buildroot/output/build/glibc-2.19/build/dirent/stubs
/home/rohit/Desktop/buildroot/output/build/glibc-2.19/build/grp/stubs
/home/rohit/Desktop/buildroot/output/build/glibc-2.19/build/pwd/stubs
/home/rohit/Desktop/buildroot/output/build/glibc-2.19/build/posix/stubs
/home/rohit/Desktop/buildroot/output/build/glibc-2.19/build/io/stubs
/home/rohit/Desktop/buildroot/output/build/glibc-2.19/build/termios/stubs
/home/rohit/Desktop/buildroot/output/build/glibc-2.19/build/resource/stubs
/home/rohit/Desktop/buildroot/output/build/glibc-2.19/build/misc/stubs
/home/rohit/Desktop/buildroot/output/build/glibc-2.19/build/socket/stubs
/home/rohit/Desktop/buildroot/output/build/glibc-2.19/build/sysvipc/stubs
/home/rohit/Desktop/buildroot/output/build/glibc-2.19/build/gmon/stubs
/home/rohit/Desktop/buildroot/output/build/glibc-2.19/build/gnulib/stubs
/home/rohit/Desktop/buildroot/output/build/glibc-2.19/build/wctype/stubs
/home/rohit/Desktop/buildroot/output/build/glibc-2.19/build/manual/stubs
/home/rohit/Desktop/buildroot/output/build/glibc-2.19/build/shadow/stubs
/home/rohit/Desktop/buildroot/output/build/glibc-2.19/build/gshadow/stubs
/home/rohit/Desktop/buildroot/output/build/glibc-2.19/build/po/stubs
/home/rohit/Desktop/buildroot/output/build/glibc-2.19/build/argp/stubs
/home/rohit/Desktop/buildroot/output/build/glibc-2.19/build/crypt/stubs
/home/rohit/Desktop/buildroot/output/build/glibc-2.19/build/nptl/stubs
/home/rohit/Desktop/buildroot/output/build/glibc-2.19/build/rt/stubs
/home/rohit/Desktop/buildroot/output/build/glibc-2.19/build/conform/stubs
/home/rohit/Desktop/buildroot/output/build/glibc-2.19/build/debug/stubs
/home/rohit/Desktop/buildroot/output/build/glibc-2.19/build/libidn/stubs
/home/rohit/Desktop/buildroot/output/build/glibc-2.19/build/nptl_db/stubs
/home/rohit/Desktop/buildroot/output/build/glibc-2.19/build/inet/stubs
/home/rohit/Desktop/buildroot/output/build/glibc-2.19/build/resolv/stubs
/home/rohit/Desktop/buildroot/output/build/glibc-2.19/build/nss/stubs
/home/rohit/Desktop/buildroot/output/build/glibc-2.19/build/hesiod/stubs
/home/rohit/Desktop/buildroot/output/build/glibc-2.19/build/sunrpc/stubs
/home/rohit/Desktop/buildroot/output/build/glibc-2.19/build/nis/stubs
/home/rohit/Desktop/buildroot/output/build/glibc-2.19/build/nscd/stubs
/home/rohit/Desktop/buildroot/output/build/glibc-2.19/build/streams/stubs
/home/rohit/Desktop/buildroot/output/build/glibc-2.19/build/login/stubs
/home/rohit/Desktop/buildroot/output/build/glibc-2.19/build/elf/stubs) >
/home/rohit/Desktop/buildroot/output/build/glibc-2.19/build/stubs.h
if test -r
/home/rohit/Desktop/buildroot/output/host/usr/arm-buildroot-linux-gnueabi/sysroot/usr/include/gnu/stubs-soft.h
&& cmp -s
/home/rohit/Desktop/buildroot/output/build/glibc-2.19/build/stubs.h
/home/rohit/Desktop/buildroot/output/host/usr/arm-buildroot-linux-gnueabi/sysroot/usr/include/gnu/stubs-soft.h;
\
    then echo 'stubs.h unchanged'; \
    else /usr/bin/install -c -m 644
/home/rohit/Desktop/buildroot/output/build/glibc-2.19/build/stubs.h
/home/rohit/Desktop/buildroot/output/host/usr/arm-buildroot-linux-gnueabi/sysroot/usr/include/gnu/stubs-soft.h;
fi
rm -f /home/rohit/Desktop/buildroot/output/build/glibc-2.19/build/stubs.h
make[2]: Leaving directory
`/home/rohit/Desktop/buildroot/output/build/glibc-2.19'
make[1]: Leaving directory
`/home/rohit/Desktop/buildroot/output/build/glibc-2.19/build'
find
/home/rohit/Desktop/buildroot/output/host/usr/arm-buildroot-linux-gnueabi/sysroot/usr/lib*
-name "*.la" | xargs /bin/sed -i -e
"s:/home/rohit/Desktop/buildroot/output:@BASE_DIR@:g" -e
"s:/home/rohit/Desktop/buildroot/output/host/usr/arm-buildroot-linux-gnueabi/sysroot:@STAGING_DIR@:g"
-e "s:\(['= ]\)/usr:\\1 at STAGING_DIR@/usr:g" -e
"s:@STAGING_DIR@:/home/rohit/Desktop/buildroot/output/host/usr/arm-buildroot-linux-gnueabi/sysroot:g"
-e "s:@BASE_DIR@:/home/rohit/Desktop/buildroot/output:g"
/bin/sed: no input files
make: ***
[/home/rohit/Desktop/buildroot/output/build/glibc-2.19/.stamp_staging_installed]
Error 123

also attached is the .config file.
With Regards,

Rohit Kumar
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20140706/2609601b/attachment.html>
-------------- next part --------------
A non-text attachment was scrubbed...
Name: buildroot_config_error
Type: application/octet-stream
Size: 39012 bytes
Desc: not available
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20140706/2609601b/attachment.obj>
