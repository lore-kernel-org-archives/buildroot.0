From: Piyush Verma <piyush.pv@gmail.com>
Date: Sun, 20 Jun 2010 21:46:59 +0800
Subject: [Buildroot] TinyX Failed to build (PANGO)
Message-ID: <AANLkTikBmMVIw2iXKqeyEmt0u1WTsRz9EB4rV-GMTtIY@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello All

I was building TinyX for ARM176jzf-s wtih v2010.05

It failed to build with Error Below.

/mv/dev/buildroot/buildroot-2010.05/output/staging/usr/lib/libglib-2.0.so:
warning: the use of OBSOLESCENT `utime' is discouraged, use `utimes'
/mv/dev/buildroot/buildroot-2010.05/output/staging/usr/lib/libX11.so:
warning: gethostbyname is obsolescent, use getnameinfo() instead.
/mv/dev/buildroot/buildroot-2010.05/output/staging/usr/bin/../lib/gcc/arm-unknown-linux-uclibcgnueabi/4.3.4/../../../../arm-unknown-linux-uclibcgnueabi/bin/ld:
pango-querymodules: hidden symbol `__gnu_uldivmod_helper' in
/mv/dev/buildroot/buildroot-2010.05/output/staging/usr/bin/../lib/gcc/arm-unknown-linux-uclibcgnueabi/4.3.4/libgcc.a(bpabi.o)
is referenced by DSO
/mv/dev/buildroot/buildroot-2010.05/output/staging/usr/bin/../lib/gcc/arm-unknown-linux-uclibcgnueabi/4.3.4/../../../../arm-unknown-linux-uclibcgnueabi/bin/ld:
final link failed: Nonrepresentable section on output
collect2: ld returned 1 exit status
make[5]: *** [pango-querymodules] Error 1
make[5]: Leaving directory
`/mv/dev/buildroot/buildroot-2010.05/output/build/pango-1.20.5/pango'
make[4]: *** [all-recursive] Error 1
make[4]: Leaving directory
`/mv/dev/buildroot/buildroot-2010.05/output/build/pango-1.20.5/pango'
make[3]: *** [all] Error 2
make[3]: Leaving directory
`/mv/dev/buildroot/buildroot-2010.05/output/build/pango-1.20.5/pango'
make[2]: *** [all-recursive] Error 1
make[2]: Leaving directory
`/mv/dev/buildroot/buildroot-2010.05/output/build/pango-1.20.5'
make[1]: *** [all] Error 2
make[1]: Leaving directory
`/mv/dev/buildroot/buildroot-2010.05/output/build/pango-1.20.5'
make: ***
[/mv/dev/buildroot/buildroot-2010.05/output/build/pango-1.20.5/.stamp_built]
Error 2



I have also attached here config file of Buildroot and Pango config.log
file.


Any suggestion how to solve this problem

-- 
Thanks & Regards

Piyush Verma
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20100620/9a32d51f/attachment-0001.html>
-------------- next part --------------
A non-text attachment was scrubbed...
Name: .config
Type: application/octet-stream
Size: 25686 bytes
Desc: not available
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20100620/9a32d51f/attachment-0001.obj>
-------------- next part --------------
A non-text attachment was scrubbed...
Name: config.log
Type: text/x-log
Size: 114549 bytes
Desc: not available
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20100620/9a32d51f/attachment-0001.bin>
