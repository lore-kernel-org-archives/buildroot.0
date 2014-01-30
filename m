From: servo gmrt <servo.gmrt@gmail.com>
Date: Thu, 30 Jan 2014 19:23:38 +0530
Subject: [Buildroot] buildroot(busybox) problem with ccache during
	rtai-4.0-test2 compiling.
Message-ID: <CAEqQue1sX4nntqoAS-Rynro_8GDkD7hAUd+_CTHDXft_Z0U=CA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear All,

I am trying to build rtai-4.0-test2 but it fails on my system

I am using buildroot-2014.02 version

When I compile the RTAI-4.0-test2 version I am getting the following error
messages,

>>> rtai 4.0-test2 Building
PATH="/run/media/thiyagu/data/buildroot/output/host/bin:/run/media/thiyagu/data/buildroot/output/host/usr/bin:/run/media/thiyagu/data/buildroot/output/host/usr/sbin/:/usr/lib/qt-3.3/bin:/usr/local/sbin:/usr/local/bin:/sbin:/bin:/usr/sbin:/usr/bin:/root/bin"
PERLLIB="/run/media/thiyagu/data/buildroot/output/host/usr/lib/perl"
/bin/make -j1  -C
/run/media/thiyagu/data/buildroot/output/build/rtai-4.0-test2/
make[1]: Entering directory
`/run/media/thiyagu/data/buildroot/output/build/rtai-4.0-test2'
/bin/make  all-recursive
make[2]: Entering directory
`/run/media/thiyagu/data/buildroot/output/build/rtai-4.0-test2'
Making all in base
make[3]: Entering directory
`/run/media/thiyagu/data/buildroot/output/build/rtai-4.0-test2/base'
Making all in include
make[4]: Entering directory
`/run/media/thiyagu/data/buildroot/output/build/rtai-4.0-test2/base/include'
Making all in asm-x86
make[5]: Entering directory
`/run/media/thiyagu/data/buildroot/output/build/rtai-4.0-test2/base/include/asm-x86'
make[5]: Nothing to be done for `all'.
make[5]: Leaving directory
`/run/media/thiyagu/data/buildroot/output/build/rtai-4.0-test2/base/include/asm-x86'
make[5]: Entering directory
`/run/media/thiyagu/data/buildroot/output/build/rtai-4.0-test2/base/include'
make[5]: Nothing to be done for `all-am'.
make[5]: Leaving directory
`/run/media/thiyagu/data/buildroot/output/build/rtai-4.0-test2/base/include'
make[4]: Leaving directory
`/run/media/thiyagu/data/buildroot/output/build/rtai-4.0-test2/base/include'
Making all in malloc
make[4]: Entering directory
`/run/media/thiyagu/data/buildroot/output/build/rtai-4.0-test2/base/malloc'
make[4]: Nothing to be done for `all'.
make[4]: Leaving directory
`/run/media/thiyagu/data/buildroot/output/build/rtai-4.0-test2/base/malloc'
Making all in sched
make[4]: Entering directory
`/run/media/thiyagu/data/buildroot/output/build/rtai-4.0-test2/base/sched'
Making all in liblxrt
make[5]: Entering directory
`/run/media/thiyagu/data/buildroot/output/build/rtai-4.0-test2/base/sched/liblxrt'
make[5]: Nothing to be done for `all'.
make[5]: Leaving directory
`/run/media/thiyagu/data/buildroot/output/build/rtai-4.0-test2/base/sched/liblxrt'
make[5]: Entering directory
`/run/media/thiyagu/data/buildroot/output/build/rtai-4.0-test2/base/sched'
make[6]: Entering directory
`/run/media/thiyagu/data/buildroot/output/build/rtai-4.0-test2/base/arch'
make[7]: Entering directory
`/run/media/thiyagu/data/buildroot/output/build/rtai-4.0-test2/base/arch/x86/hal'
/run/media/thiyagu/data/buildroot/output/host/usr/bin/ccache: invalid
option -- 'E'
Usage:
    ccache [options]
    ccache compiler [compiler options]
    compiler [compiler options]          (via symbolic link)

Options:
    -c, --cleanup         delete old files and recalculate size counters
                          (normally not needed as this is done
automatically)
    -C, --clear           clear the cache completely
    -F, --max-files=N     set maximum number of files in cache to N (use 0
for
                          no limit)
    -M, --max-size=SIZE   set maximum size of cache to SIZE (use 0 for no
                          limit; available suffixes: G, M and K; default
                          suffix: G)
    -s, --show-stats      show statistics summary
    -z, --zero-stats      zero statistics counters

    -h, --help            print this help text
    -V, --version         print version and copyright information

See also <http://ccache.samba.org>.
/run/media/thiyagu/data/buildroot/output/host/usr/bin/ccache: invalid
option -- 'E'
Usage:
    ccache [options]
    ccache compiler [compiler options]
    compiler [compiler options]          (via symbolic link)

Options:
    -c, --cleanup         delete old files and recalculate size counters
                          (normally not needed as this is done
automatically)
    -C, --clear           clear the cache completely
    -F, --max-files=N     set maximum number of files in cache to N (use 0
for
                          no limit)
    -M, --max-size=SIZE   set maximum size of cache to SIZE (use 0 for no
                          limit; available suffixes: G, M and K; default
                          suffix: G)
    -s, --show-stats      show statistics summary
    -z, --zero-stats      zero statistics counters

    -h, --help            print this help text
    -V, --version         print version and copyright information

See also <http://ccache.samba.org>.
/run/media/thiyagu/data/buildroot/output/host/usr/bin/ccache: invalid
option -- 'p'
Usage:
    ccache [options]
    ccache compiler [compiler options]
    compiler [compiler options]          (via symbolic link)

Options:
    -c, --cleanup         delete old files and recalculate size counters
                          (normally not needed as this is done
automatically)
    -C, --clear           clear the cache completely
    -F, --max-files=N     set maximum number of files in cache to N (use 0
for
                          no limit)
    -M, --max-size=SIZE   set maximum size of cache to SIZE (use 0 for no
                          limit; available suffixes: G, M and K; default
                          suffix: G)
    -s, --show-stats      show statistics summary
    -z, --zero-stats      zero statistics counters

    -h, --help            print this help text
    -V, --version         print version and copyright information

See also <http://ccache.samba.org>.
make[8]: Entering directory
`/run/media/thiyagu/data/buildroot/output/build/linux-3.8.13'
make[8]: Nothing to be done for
`/run/media/thiyagu/data/buildroot/output/host/usr/bin/i486-buildroot-linux-gnu-gcc'.
  CC [M]
/run/media/thiyagu/data/buildroot/output/build/rtai-4.0-test2/base/arch/x86/hal/hal.o
/run/media/thiyagu/data/buildroot/output/host/usr/bin/ccache: invalid
option -- 'W'
Usage:
    ccache [options]
    ccache compiler [compiler options]
    compiler [compiler options]          (via symbolic link)

Options:
    -c, --cleanup         delete old files and recalculate size counters
                          (normally not needed as this is done
automatically)
    -C, --clear           clear the cache completely
    -F, --max-files=N     set maximum number of files in cache to N (use 0
for
                          no limit)
    -M, --max-size=SIZE   set maximum size of cache to SIZE (use 0 for no
                          limit; available suffixes: G, M and K; default
                          suffix: G)
    -s, --show-stats      show statistics summary
    -z, --zero-stats      zero statistics counters

    -h, --help            print this help text
    -V, --version         print version and copyright information

See also <http://ccache.samba.org>.
make[9]: ***
[/run/media/thiyagu/data/buildroot/output/build/rtai-4.0-test2/base/arch/x86/hal/hal.o]
Error 1
make[8]: ***
[_module_/run/media/thiyagu/data/buildroot/output/build/rtai-4.0-test2/base/arch/x86/hal]
Error 2
make[8]: Leaving directory
`/run/media/thiyagu/data/buildroot/output/build/linux-3.8.13'
make[7]: *** [rtai_hal.ko] Error 2
make[7]: Leaving directory
`/run/media/thiyagu/data/buildroot/output/build/rtai-4.0-test2/base/arch/x86/hal'
make[6]: *** [rtai_hal.ko] Error 2
make[6]: Leaving directory
`/run/media/thiyagu/data/buildroot/output/build/rtai-4.0-test2/base/arch'
make[5]: *** [rtai_sched.ko] Error 2
make[5]: Leaving directory
`/run/media/thiyagu/data/buildroot/output/build/rtai-4.0-test2/base/sched'
make[4]: *** [all-recursive] Error 1
make[4]: Leaving directory
`/run/media/thiyagu/data/buildroot/output/build/rtai-4.0-test2/base/sched'
make[3]: *** [all-recursive] Error 1
make[3]: Leaving directory
`/run/media/thiyagu/data/buildroot/output/build/rtai-4.0-test2/base'
make[2]: *** [all-recursive] Error 1
make[2]: Leaving directory
`/run/media/thiyagu/data/buildroot/output/build/rtai-4.0-test2'
make[1]: *** [all] Error 2
make[1]: Leaving directory
`/run/media/thiyagu/data/buildroot/output/build/rtai-4.0-test2'
make: ***
[/run/media/thiyagu/data/buildroot/output/build/rtai-4.0-test2/.stamp_built]
Error 2


Please help to resolve the issue.

Thanks & Regards,

B.Thiyagarajan,
GMRT-TIFR
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20140130/eab00aeb/attachment.html>
