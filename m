From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Sun, 06 Jul 2014 08:20:50 +0200
Subject: [Buildroot] toolchain building error with basic configuration
In-Reply-To: <CABzetm1ox4vAEHJY0U_OrmUiUjqrEUAnvwRO33ZXQvyu8NhVYg@mail.gmail.com>
References: <CABzetm1ox4vAEHJY0U_OrmUiUjqrEUAnvwRO33ZXQvyu8NhVYg@mail.gmail.com>
Message-ID: <b1e322b8-d699-4bf1-ae25-4d1185a96a79@email.android.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

Rohit Kumar <rkthebest@gmail.com> schreef:
>Hello,
>
>
>i am trying to build simple toolchain for ARM11 with basic configuration.
>but its giving follwing error.
>
>mv -f
>/home/rohit/Desktop/buildroot/output/host/usr/arm-buildroot-linux-gnueabi/sysroot/usr/bin/sprof.new
>/home/rohit/Desktop/buildroot/output/host/usr/arm-buildroot-linux-gnueabi/sysroot/usr/bin/sprof
>mkdir -p --
>/home/rohit/Desktop/buildroot/output/host/usr/arm-buildroot-linux-gnueabi/sysroot/usr/lib/audit
>mv -f
>/home/rohit/Desktop/buildroot/output/host/usr/arm-buildroot-linux-gnueabi/sysroot/usr/bin/pldd.new
>/home/rohit/Desktop/buildroot/output/host/usr/arm-buildroot-linux-gnueabi/sysroot/usr/bin/pldd
>/usr/bin/install -c
>/home/rohit/Desktop/buildroot/output/build/glibc-2.19/build/elf/sotruss-lib.so
>/home/rohit/Desktop/buildroot/output/host/usr/arm-buildroot-linux-gnueabi/sysroot/usr/lib/audit/sotruss-lib.so.new
>rm -f
>/home/rohit/Desktop/buildroot/output/host/usr/arm-buildroot-linux-gnueabi/sysroot/lib/ld-linux.so.3
>mv -f
>/home/rohit/Desktop/buildroot/output/host/usr/arm-buildroot-linux-gnueabi/sysroot/usr/lib/audit/sotruss-lib.so.new
>/home/rohit/Desktop/buildroot/output/host/usr/arm-buildroot-linux-gnueabi/sysroot/usr/lib/audit/sotruss-lib.so
>ln -s `../scripts/rellns-sh -p
>/home/rohit/Desktop/buildroot/output/host/usr/arm-buildroot-linux-gnueabi/sysroot/lib/
>ld-2.19.so
>/home/rohit/Desktop/buildroot/output/host/usr/arm-buildroot-linux-gnueabi/sysroot/lib/ld-linux.so.3`
>/home/rohit/Desktop/buildroot/output/host/usr/arm-buildroot-linux-gnueabi/sysroot/lib/ld-linux.so.3
>mv -f
>/home/rohit/Desktop/buildroot/output/build/glibc-2.19/build/elf/stubsT
>/home/rohit/Desktop/buildroot/output/build/glibc-2.19/build/elf/stubs
>make[3]: Leaving directory
>`/home/rohit/Desktop/buildroot/output/build/glibc-2.19/elf'
>(sed '/^@/d' include/stubs-prologue.h; LC_ALL=C sort
>/home/rohit/Desktop/buildroot/output/build/glibc-2.19/build/csu/stubs
>/home/rohit/Desktop/buildroot/output/build/glibc-2.19/build/iconv/stubs
>/home/rohit/Desktop/buildroot/output/build/glibc-2.19/build/locale/stubs
>/home/rohit/Desktop/buildroot/output/build/glibc-2.19/build/localedata/stubs
>/home/rohit/Desktop/buildroot/output/build/glibc-2.19/build/iconvdata/stubs
>/home/rohit/Desktop/buildroot/output/build/glibc-2.19/build/assert/stubs
>/home/rohit/Desktop/buildroot/output/build/glibc-2.19/build/ctype/stubs
>/home/rohit/Desktop/buildroot/output/build/glibc-2.19/build/intl/stubs
>/home/rohit/Desktop/buildroot/output/build/glibc-2.19/build/catgets/stubs
>/home/rohit/Desktop/buildroot/output/build/glibc-2.19/build/math/stubs
>/home/rohit/Desktop/buildroot/output/build/glibc-2.19/build/setjmp/stubs
>/home/rohit/Desktop/buildroot/output/build/glibc-2.19/build/signal/stubs
>/home/rohit/Desktop/buildroot/output/build/glibc-2.19/build/stdlib/stubs
>/home/rohit/Desktop/buildroot/output/build/glibc-2.19/build/stdio-common/stubs
>/home/rohit/Desktop/buildroot/output/build/glibc-2.19/build/libio/stubs
>/home/rohit/Desktop/buildroot/output/build/glibc-2.19/build/dlfcn/stubs
>/home/rohit/Desktop/buildroot/output/build/glibc-2.19/build/malloc/stubs
>/home/rohit/Desktop/buildroot/output/build/glibc-2.19/build/string/stubs
>/home/rohit/Desktop/buildroot/output/build/glibc-2.19/build/wcsmbs/stubs
>/home/rohit/Desktop/buildroot/output/build/glibc-2.19/build/timezone/stubs
>/home/rohit/Desktop/buildroot/output/build/glibc-2.19/build/time/stubs
>/home/rohit/Desktop/buildroot/output/build/glibc-2.19/build/dirent/stubs
>/home/rohit/Desktop/buildroot/output/build/glibc-2.19/build/grp/stubs
>/home/rohit/Desktop/buildroot/output/build/glibc-2.19/build/pwd/stubs
>/home/rohit/Desktop/buildroot/output/build/glibc-2.19/build/posix/stubs
>/home/rohit/Desktop/buildroot/output/build/glibc-2.19/build/io/stubs
>/home/rohit/Desktop/buildroot/output/build/glibc-2.19/build/termios/stubs
>/home/rohit/Desktop/buildroot/output/build/glibc-2.19/build/resource/stubs
>/home/rohit/Desktop/buildroot/output/build/glibc-2.19/build/misc/stubs
>/home/rohit/Desktop/buildroot/output/build/glibc-2.19/build/socket/stubs
>/home/rohit/Desktop/buildroot/output/build/glibc-2.19/build/sysvipc/stubs
>/home/rohit/Desktop/buildroot/output/build/glibc-2.19/build/gmon/stubs
>/home/rohit/Desktop/buildroot/output/build/glibc-2.19/build/gnulib/stubs
>/home/rohit/Desktop/buildroot/output/build/glibc-2.19/build/wctype/stubs
>/home/rohit/Desktop/buildroot/output/build/glibc-2.19/build/manual/stubs
>/home/rohit/Desktop/buildroot/output/build/glibc-2.19/build/shadow/stubs
>/home/rohit/Desktop/buildroot/output/build/glibc-2.19/build/gshadow/stubs
>/home/rohit/Desktop/buildroot/output/build/glibc-2.19/build/po/stubs
>/home/rohit/Desktop/buildroot/output/build/glibc-2.19/build/argp/stubs
>/home/rohit/Desktop/buildroot/output/build/glibc-2.19/build/crypt/stubs
>/home/rohit/Desktop/buildroot/output/build/glibc-2.19/build/nptl/stubs
>/home/rohit/Desktop/buildroot/output/build/glibc-2.19/build/rt/stubs
>/home/rohit/Desktop/buildroot/output/build/glibc-2.19/build/conform/stubs
>/home/rohit/Desktop/buildroot/output/build/glibc-2.19/build/debug/stubs
>/home/rohit/Desktop/buildroot/output/build/glibc-2.19/build/libidn/stubs
>/home/rohit/Desktop/buildroot/output/build/glibc-2.19/build/nptl_db/stubs
>/home/rohit/Desktop/buildroot/output/build/glibc-2.19/build/inet/stubs
>/home/rohit/Desktop/buildroot/output/build/glibc-2.19/build/resolv/stubs
>/home/rohit/Desktop/buildroot/output/build/glibc-2.19/build/nss/stubs
>/home/rohit/Desktop/buildroot/output/build/glibc-2.19/build/hesiod/stubs
>/home/rohit/Desktop/buildroot/output/build/glibc-2.19/build/sunrpc/stubs
>/home/rohit/Desktop/buildroot/output/build/glibc-2.19/build/nis/stubs
>/home/rohit/Desktop/buildroot/output/build/glibc-2.19/build/nscd/stubs
>/home/rohit/Desktop/buildroot/output/build/glibc-2.19/build/streams/stubs
>/home/rohit/Desktop/buildroot/output/build/glibc-2.19/build/login/stubs
>/home/rohit/Desktop/buildroot/output/build/glibc-2.19/build/elf/stubs) >
>/home/rohit/Desktop/buildroot/output/build/glibc-2.19/build/stubs.h
>if test -r
>/home/rohit/Desktop/buildroot/output/host/usr/arm-buildroot-linux-gnueabi/sysroot/usr/include/gnu/stubs-soft.h
>&& cmp -s
>/home/rohit/Desktop/buildroot/output/build/glibc-2.19/build/stubs.h
>/home/rohit/Desktop/buildroot/output/host/usr/arm-buildroot-linux-gnueabi/sysroot/usr/include/gnu/stubs-soft.h;
>\
>    then echo 'stubs.h unchanged'; \
>    else /usr/bin/install -c -m 644
>/home/rohit/Desktop/buildroot/output/build/glibc-2.19/build/stubs.h
>/home/rohit/Desktop/buildroot/output/host/usr/arm-buildroot-linux-gnueabi/sysroot/usr/include/gnu/stubs-soft.h;
>fi
>rm -f /home/rohit/Desktop/buildroot/output/build/glibc-2.19/build/stubs.h
>make[2]: Leaving directory
>`/home/rohit/Desktop/buildroot/output/build/glibc-2.19'
>make[1]: Leaving directory
>`/home/rohit/Desktop/buildroot/output/build/glibc-2.19/build'
>find
>/home/rohit/Desktop/buildroot/output/host/usr/arm-buildroot-linux-gnueabi/sysroot/usr/lib*
>-name "*.la" | xargs /bin/sed -i -e
>"s:/home/rohit/Desktop/buildroot/output:@BASE_DIR@:g" -e
>"s:/home/rohit/Desktop/buildroot/output/host/usr/arm-buildroot-linux-gnueabi/sysroot:@STAGING_DIR@:g"
>-e "s:\(['= ]\)/usr:\\1 at STAGING_DIR@/usr:g" -e
>"s:@STAGING_DIR@:/home/rohit/Desktop/buildroot/output/host/usr/arm-buildroot-linux-gnueabi/sysroot:g"
>-e "s:@BASE_DIR@:/home/rohit/Desktop/buildroot/output:g"
>/bin/sed: no input files
>make: ***
>[/home/rohit/Desktop/buildroot/output/build/glibc-2.19/.stamp_staging_installed]
>Error 123
>
>also attached is the .config file.


Thanks for the report. This is caused by my commit http://git.buildroot.net/buildroot/commit/?id=6f638ea9c9c7bacc646430a74ad3dd2740eae676 in which a for loop is replaced by an xargs statement. This doesn't work if no file is found in the find.

As a workaround you can revert that patch or change back to a for, but I think the solution for the tree should be different. A proposal is to make sure that there is always at least one file in the result list, for example by adding /dev/null to the find list.

I'll try to make a patch later today.

Best regards,
Thomas
