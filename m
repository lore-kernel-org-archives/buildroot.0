From: cem akpolat <akpolatcem@gmail.com>
Date: Tue, 20 May 2014 15:29:51 +0200
Subject: [Buildroot] Fwd: Fwd: how to assign cpp and c++ in buildroot?
In-Reply-To: <CAAXf6LWn_BwZPG7B_zoQPqN4Sr=4b+wLNz+-EKHfCdU0LD6nHQ@mail.gmail.com>
References: <52E9D80E-B9AD-417A-BC0F-66A69C39FC21@gmail.com>
 <5F503FD3-3FBC-4ADB-9D17-BA0CB5606B6D@gmail.com>
 <20140520000920.20ae6b5b@free-electrons.com>
 <0727D305-97AD-471C-BA2D-D6A251B4FA90@gmail.com>
 <CAMm5YqqFDD0a_hA0fGdiLDuHLoaCVVgf2L_-wzQikpF4cm7FJw@mail.gmail.com>
 <CAAXf6LUF7eXsQvJRLoO0oHcefs9PGnUOVXGCNNhZ2YKV_SkGVA@mail.gmail.com>
 <20140520113955.475370b3@free-electrons.com>
 <CAMm5YqoPu1QDkzdpoFfZfNCj0V+VeVkYcUPW=xzzqLB-eYAAuQ@mail.gmail.com>
 <CAMm5YqqZjnWaNQ+S5a+huY+tOfHgqv51St9HhQZ=69i-4u9PQw@mail.gmail.com>
 <CAAXf6LUC7Vki85_4iVr-AhijdjpXxHQoYOVSgUAdJcta4-jb6A@mail.gmail.com>
 <CAMm5YqqioD+6fDWrTW+Jo=wxpCWRet33MJ_OL7=pyFCgbL1ojQ@mail.gmail.com>
 <CAAXf6LU+UjV3-xWQa5K8CNu79z-2cOoHZgAhmCrxbgth_YFLiw@mail.gmail.com>
 <CAMm5YqoWFFVf5RkG_N0_S2R3xawSt0T9rEgH4AMJNDu27Ox7Zw@mail.gmail.com>
 <CAAXf6LWn_BwZPG7B_zoQPqN4Sr=4b+wLNz+-EKHfCdU0LD6nHQ@mail.gmail.com>
Message-ID: <CAMm5YqqUYHNGXRYeBzLAcv_ZF5y83GpODD84ZhZpXGxSrURoDQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

the line starting wirh @@@@


akpolat at akpolatX240:~/mysvn/buildroot$ make
package/Makefile.in:211: @@@@@@@ TARGET_CPP
value='/home/akpolat/mysvn/buildroot/output/host/usr/bin/i586-buildroot-linux-uclibc-cpp'
origin='file'


You may have to install 'g++' on your build machine
>>> host-m4 1.4.17 Configuring
(cd /home/akpolat/mysvn/buildroot/output/build/host-m4-1.4.17/ && rm -rf
config.cache;
PATH=/home/akpolat/mysvn/buildroot/output/host/bin:/home/akpolat/mysvn/buildroot/output/host/usr/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games
AR="/usr/bin/ar" AS="/usr/bin/as" LD="/usr/bin/ld" NM="/usr/bin/nm"
CC="/usr/bin/gcc" GCC="/usr/bin/gcc" CXX="g++" CPP="cpp"
OBJCOPY="/usr/bin/objcopy" RANLIB="/usr/bin/ranlib"
CPPFLAGS="-I/home/akpolat/mysvn/buildroot/output/host/usr/include"
CFLAGS="-O2 -I/home/akpolat/mysvn/buildroot/output/host/usr/include"
CXXFLAGS="-O2 -I/home/akpolat/mysvn/buildroot/output/host/usr/include"
LDFLAGS="-L/home/akpolat/mysvn/buildroot/output/host/lib
-L/home/akpolat/mysvn/buildroot/output/host/usr/lib
-Wl,-rpath,/home/akpolat/mysvn/buildroot/output/host/usr/lib"
PKG_CONFIG_ALLOW_SYSTEM_CFLAGS=1 PKG_CONFIG_ALLOW_SYSTEM_LIBS=1
PKG_CONFIG="/home/akpolat/mysvn/buildroot/output/host/usr/bin/pkg-config"
PKG_CONFIG_SYSROOT_DIR="/"
PKG_CONFIG_LIBDIR="/home/akpolat/mysvn/buildroot/output/host/usr/lib/pkgconfig:/home/akpolat/mysvn/buildroot/output/host/usr/share/pkgconfig"
LD_LIBRARY_PATH="/home/akpolat/mysvn/buildroot/output/host/usr/lib:"
CFLAGS="-O2 -I/home/akpolat/mysvn/buildroot/output/host/usr/include"
LDFLAGS="-L/home/akpolat/mysvn/buildroot/output/host/lib
-L/home/akpolat/mysvn/buildroot/output/host/usr/lib
-Wl,-rpath,/home/akpolat/mysvn/buildroot/output/host/usr/lib"  ./configure
--prefix="/home/akpolat/mysvn/buildroot/output/host/usr"
--sysconfdir="/home/akpolat/mysvn/buildroot/output/host/etc"
--enable-shared --disable-static --disable-gtk-doc --disable-doc
--disable-docs --disable-documentation --with-xmlto=no --with-fop=no
 --disable-static )
configure: WARNING: unrecognized options: --enable-shared,
--disable-static, --disable-gtk-doc, --disable-doc, --disable-docs,
--disable-documentation, --with-xmlto, --with-fop, --disable-static
checking for a BSD-compatible install... /usr/bin/install -c
checking whether build environment is sane... yes
checking for a thread-safe mkdir -p... /bin/mkdir -p
checking for gawk... gawk
checking whether make sets $(MAKE)... yes
checking whether make supports nested variables... yes
checking for gcc... /usr/bin/gcc
checking whether the C compiler works... yes
checking for C compiler default output file name... a.out
checking for suffix of executables...
checking whether we are cross compiling... no
checking for suffix of object files... o
checking whether we are using the GNU C compiler... yes
checking whether /usr/bin/gcc accepts -g... yes
checking for /usr/bin/gcc option to accept ISO C89... none needed
checking whether /usr/bin/gcc understands -c and -o together... yes
checking for style of include used by make... GNU
checking dependency style of /usr/bin/gcc... gcc3
checking how to run the C preprocessor... cpp
configure: error: in
`/home/akpolat/mysvn/buildroot/output/build/host-m4-1.4.17':
configure: error: C preprocessor "cpp" fails sanity check
See `config.log' for more details
make: ***
[/home/akpolat/mysvn/buildroot/output/build/host-m4-1.4.17/.stamp_configured]
Error 1
akpolat at akpolatX240:~/mysvn/buildroot$
akpolat at akpolatX240:~/mysvn/buildroot$


config.log file is attached.

Thanks,

cem

Cem Akpolat


On Tue, May 20, 2014 at 3:14 PM, Thomas De Schampheleire <
patrickdepinguin@gmail.com> wrote:

> Hi Cem,
>
> On Tue, May 20, 2014 at 3:09 PM, cem akpolat <akpolatcem@gmail.com> wrote:
> > Ok I added also the TARGET_CPP line and build it again. the first two
> > parameters are returning null, and grep result
> >
> > package/Makefile.in:110:TARGET_CPPFLAGS += -D_LARGEFILE_SOURCE
> > -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64
> > package/Makefile.in:113:TARGET_CFLAGS = $(TARGET_CPPFLAGS) $(TARGET_ABI)
> > $(TARGET_OPTIMIZATION) $(TARGET_DEBUGGING)
> > package/Makefile.in:154:TARGET_CPP      = $(TARGET_CROSS)cpp
> > package/Makefile.in:211:$(warning @@@@@@@ TARGET_CPP
> value='$(TARGET_CPP)'
> > origin='$(origin TARGET_CPP)')
> > package/Makefile.in:220: CPP="$(TARGET_CPP)"\
> > package/Makefile.in:242: CPPFLAGS="$(TARGET_CPPFLAGS)" \
> >
> >
> > Now , I am receiving another error from another program. c++ and c
> indicates
> > host g++.
>
> Early in this make output, there should be a line starting with @@@@
> with some output, could you send it?
>
> >
> >
> >>>> host-m4 1.4.17 Patching
> >>>> host-m4 1.4.17 Updating config.sub and config.guess
> > for file in config.guess config.sub; do for i in $(find
> > /home/akpolat/mysvn/buildroot/output/build/host-m4-1.4.17 -name $file);
> do
> > cp support/gnuconfig/$file $i; done; done
> >>>> host-m4 1.4.17 Patching libtool
> >>>> host-m4 1.4.17 Configuring
> > (cd /home/akpolat/mysvn/buildroot/output/build/host-m4-1.4.17/ && rm -rf
> > config.cache;
> >
> PATH=/home/akpolat/mysvn/buildroot/output/host/bin:/home/akpolat/mysvn/buildroot/output/host/usr/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games
> > AR="/usr/bin/ar" AS="/usr/bin/as" LD="/usr/bin/ld" NM="/usr/bin/nm"
> > CC="/usr/bin/gcc" GCC="/usr/bin/gcc" CXX="g++" CPP="cpp"
> > OBJCOPY="/usr/bin/objcopy" RANLIB="/usr/bin/ranlib"
> > CPPFLAGS="-I/home/akpolat/mysvn/buildroot/output/host/usr/include"
> > CFLAGS="-O2 -I/home/akpolat/mysvn/buildroot/output/host/usr/include"
> > CXXFLAGS="-O2 -I/home/akpolat/mysvn/buildroot/output/host/usr/include"
> > LDFLAGS="-L/home/akpolat/mysvn/buildroot/output/host/lib
> > -L/home/akpolat/mysvn/buildroot/output/host/usr/lib
> > -Wl,-rpath,/home/akpolat/mysvn/buildroot/output/host/usr/lib"
> > PKG_CONFIG_ALLOW_SYSTEM_CFLAGS=1 PKG_CONFIG_ALLOW_SYSTEM_LIBS=1
> > PKG_CONFIG="/home/akpolat/mysvn/buildroot/output/host/usr/bin/pkg-config"
> > PKG_CONFIG_SYSROOT_DIR="/"
> >
> PKG_CONFIG_LIBDIR="/home/akpolat/mysvn/buildroot/output/host/usr/lib/pkgconfig:/home/akpolat/mysvn/buildroot/output/host/usr/share/pkgconfig"
> > LD_LIBRARY_PATH="/home/akpolat/mysvn/buildroot/output/host/usr/lib:"
> > CFLAGS="-O2 -I/home/akpolat/mysvn/buildroot/output/host/usr/include"
> > LDFLAGS="-L/home/akpolat/mysvn/buildroot/output/host/lib
> > -L/home/akpolat/mysvn/buildroot/output/host/usr/lib
> > -Wl,-rpath,/home/akpolat/mysvn/buildroot/output/host/usr/lib"
>  ./configure
> > --prefix="/home/akpolat/mysvn/buildroot/output/host/usr"
> > --sysconfdir="/home/akpolat/mysvn/buildroot/output/host/etc"
> --enable-shared
> > --disable-static --disable-gtk-doc --disable-doc --disable-docs
> > --disable-documentation --with-xmlto=no --with-fop=no  --disable-static )
> > configure: WARNING: unrecognized options: --enable-shared,
> --disable-static,
> > --disable-gtk-doc, --disable-doc, --disable-docs,
> --disable-documentation,
> > --with-xmlto, --with-fop, --disable-static
> > checking for a BSD-compatible install... /usr/bin/install -c
> > checking whether build environment is sane... yes
> > checking for a thread-safe mkdir -p... /bin/mkdir -p
> > checking for gawk... gawk
> > checking whether make sets $(MAKE)... yes
> > checking whether make supports nested variables... yes
> > checking for gcc... /usr/bin/gcc
> > checking whether the C compiler works... yes
> > checking for C compiler default output file name... a.out
> > checking for suffix of executables...
> > checking whether we are cross compiling... no
> > checking for suffix of object files... o
> > checking whether we are using the GNU C compiler... yes
> > checking whether /usr/bin/gcc accepts -g... yes
> > checking for /usr/bin/gcc option to accept ISO C89... none needed
> > checking whether /usr/bin/gcc understands -c and -o together... yes
> > checking for style of include used by make... GNU
> > checking dependency style of /usr/bin/gcc... gcc3
> > checking how to run the C preprocessor... cpp
> > configure: error: in
> > `/home/akpolat/mysvn/buildroot/output/build/host-m4-1.4.17':
> > configure: error: C preprocessor "cpp" fails sanity check
> > See `config.log' for more details
> > make: ***
> >
> [/home/akpolat/mysvn/buildroot/output/build/host-m4-1.4.17/.stamp_configured]
> > Error 1
> >
>
> Could you send
> /home/akpolat/mysvn/buildroot/output/build/host-m4-1.4.17/config.log
> in attachment?
>
> Thanks,
> Thomas
>
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20140520/c67a2cda/attachment.html>
-------------- next part --------------
A non-text attachment was scrubbed...
Name: config.log
Type: text/x-log
Size: 33859 bytes
Desc: not available
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20140520/c67a2cda/attachment.bin>
