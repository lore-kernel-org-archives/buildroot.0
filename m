From: abinaya m <abi.laesr@gmail.com>
Date: Wed, 9 May 2018 16:07:42 +0530
Subject: [Buildroot] package_installation_problem
In-Reply-To: <CAAp1OY2Gg-S703wgVmwzL=_GzbW-6xaEp9XaNo1EYzHhVHVZJg@mail.gmail.com>
References: <CAAp1OY35UgMMmtK-CG+Y3JKLLy78u+KRbOwtR-FugwrVr804ww@mail.gmail.com>
 <28d9248a-a811-d361-adfe-05ad4c5a0635@mind.be>
 <CAAp1OY2Gg-S703wgVmwzL=_GzbW-6xaEp9XaNo1EYzHhVHVZJg@mail.gmail.com>
Message-ID: <CAAp1OY0=oB2zxHNDU+Jgm3RMsCrAH4PKnZ-y1nctNGZPvJE1Aw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Sir,

I have followed your steps. I have pasted below the log file. I am getting
error in make after performing the above steps. Kindly help. Thank you!

/usr/bin/gcc -L/home/sands/Documents/vineeth/buildroot-at91/output/host/lib
-Wl,-rpath,/home/sands/Documents/vineeth/buildroot-at91/output/host/lib
 buffer.o charsetConv.o codepages.o config.o copyfile.o devices.o
dirCache.o directory.o direntry.o expand.o fat.o fat_free.o file.o
file_name.o filter.o floppyd_io.o force_io.o hash.o init.o llong.o match.o
mainloop.o mattrib.o mbadblocks.o mcat.o mcd.o mclasserase.o mcopy.o mdel.o
mdir.o mdoctorfat.o mdu.o mformat.o minfo.o misc.o missFuncs.o
mk_direntry.o mlabel.o mmd.o mmount.o mmove.o mpartition.o mshortname.o
mshowfat.o mzip.o mtools.o patchlevel.o plain_io.o precmd.o privileges.o
scsi.o signal.o stream.o streamcache.o subdir.o unixdir.o tty.o vfat.o
xdf_io.o -o mtools
rm -f mattrib && ln -s mtools mattrib
rm -f mcat && ln -s mtools mcat
rm -f mcd && ln -s mtools mcd
rm -f mclasserase && ln -s mtools mclasserase
rm -f mcopy && ln -s mtools mcopy
rm -f mdel && ln -s mtools mdel
rm -f mdeltree && ln -s mtools mdeltree
rm -f mdir && ln -s mtools mdir
rm -f mdu && ln -s mtools mdu
rm -f mformat && ln -s mtools mformat
rm -f minfo && ln -s mtools minfo
rm -f mlabel && ln -s mtools mlabel
rm -f mmd && ln -s mtools mmd
rm -f mmount && ln -s mtools mmount
rm -f mmove && ln -s mtools mmove
rm -f mpartition && ln -s mtools mpartition
rm -f mrd && ln -s mtools mrd
rm -f mren && ln -s mtools mren
rm -f mtype && ln -s mtools mtype
rm -f mtoolstest && ln -s mtools mtoolstest
rm -f mshortname && ln -s mtools mshortname
rm -f mshowfat && ln -s mtools mshowfat
rm -f mbadblocks && ln -s mtools mbadblocks
rm -f mzip && ln -s mtools mzip
/usr/bin/gcc
-I/home/sands/Documents/vineeth/buildroot-at91/output/host/include
-DHAVE_CONFIG_H
-DSYSCONFDIR=\"/home/sands/Documents/vineeth/buildroot-at91/output/host/etc\"
-DCPU_x86_64 -DVENDOR_pc -DOS_linux_gnu -O2
-I/home/sands/Documents/vineeth/buildroot-at91/output/host/include -Wall
-fno-strict-aliasing -I.  -I.  -c mkmanifest.c
/usr/bin/gcc -L/home/sands/Documents/vineeth/buildroot-at91/output/host/lib
-Wl,-rpath,/home/sands/Documents/vineeth/buildroot-at91/output/host/lib
 missFuncs.o mkmanifest.o misc.o patchlevel.o -o mkmanifest
/usr/bin/gcc
-I/home/sands/Documents/vineeth/buildroot-at91/output/host/include
-DHAVE_CONFIG_H
-DSYSCONFDIR=\"/home/sands/Documents/vineeth/buildroot-at91/output/host/etc\"
-DCPU_x86_64 -DVENDOR_pc -DOS_linux_gnu -O2
-I/home/sands/Documents/vineeth/buildroot-at91/output/host/include -Wall
-fno-strict-aliasing -I.  -I.  -c floppyd.c
floppyd.c: In function ?main?:
floppyd.c:959:6: warning: ignoring return value of ?setgid?, declared with
attribute warn_unused_result [-Wunused-result]
      setgid(run_gid);
      ^
floppyd.c:961:6: warning: ignoring return value of ?setuid?, declared with
attribute warn_unused_result [-Wunused-result]
      setuid(run_uid);
      ^
/usr/bin/gcc -L/home/sands/Documents/vineeth/buildroot-at91/output/host/lib
-Wl,-rpath,/home/sands/Documents/vineeth/buildroot-at91/output/host/lib
 floppyd.o llong.o -o floppyd   -lXau -lX11
/usr/bin/gcc
-I/home/sands/Documents/vineeth/buildroot-at91/output/host/include
-DHAVE_CONFIG_H
-DSYSCONFDIR=\"/home/sands/Documents/vineeth/buildroot-at91/output/host/etc\"
-DCPU_x86_64 -DVENDOR_pc -DOS_linux_gnu -O2
-I/home/sands/Documents/vineeth/buildroot-at91/output/host/include -Wall
-fno-strict-aliasing -I.  -I.  -c floppyd_installtest.c
/usr/bin/gcc -L/home/sands/Documents/vineeth/buildroot-at91/output/host/lib
-Wl,-rpath,/home/sands/Documents/vineeth/buildroot-at91/output/host/lib
 floppyd_installtest.o misc.o expand.o privileges.o -o floppyd_installtest

sed
"s%SYSCONFDIR%/home/sands/Documents/vineeth/buildroot-at91/output/host/etc/%g"
./mtools.tmpl.1 >mtools.1
sed
"s%SYSCONFDIR%/home/sands/Documents/vineeth/buildroot-at91/output/host/etc/%g"
./mtools.tmpl.5 >mtools.5
>>> host-mtools 4.0.18 Installing to host directory
PATH="/home/sands/Documents/vineeth/buildroot-at91/output/host/bin:/home/sands/Documents/vineeth/buildroot-at91/output/host/sbin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games"
PKG_CONFIG="/home/sands/Documents/vineeth/buildroot-at91/output/host/bin/pkg-config"
PKG_CONFIG_SYSROOT_DIR="/" PKG_CONFIG_ALLOW_SYSTEM_CFLAGS=1
PKG_CONFIG_ALLOW_SYSTEM_LIBS=1
PKG_CONFIG_LIBDIR="/home/sands/Documents/vineeth/buildroot-at91/output/host/lib/pkgconfig:/home/sands/Documents/vineeth/buildroot-at91/output/host/share/pkgconfig"
/usr/bin/make -j1 install -C
/home/sands/Documents/vineeth/buildroot-at91/output/build/host-mtools-4.0.18/
./mkinstalldirs /home/sands/Documents/vineeth/buildroot-at91/output/host/bin
/usr/bin/install -c mtools
/home/sands/Documents/vineeth/buildroot-at91/output/host/bin/mtools
./mkinstalldirs /home/sands/Documents/vineeth/buildroot-at91/output/host/bin
/usr/bin/install -c floppyd
/home/sands/Documents/vineeth/buildroot-at91/output/host/bin/floppyd
./mkinstalldirs /home/sands/Documents/vineeth/buildroot-at91/output/host/bin
/usr/bin/install -c floppyd_installtest
/home/sands/Documents/vineeth/buildroot-at91/output/host/bin/floppyd_installtest
/home/sands/Documents/vineeth/buildroot-at91/output/host/share/man/man1/floppyd.1
/home/sands/Documents/vineeth/buildroot-at91/output/host/share/man/man1/floppyd_installtest.1
/home/sands/Documents/vineeth/buildroot-at91/output/host/share/man/man1/mattrib.1
/home/sands/Documents/vineeth/buildroot-at91/output/host/share/man/man1/mbadblocks.1
/home/sands/Documents/vineeth/buildroot-at91/output/host/share/man/man1/mcat.1
/home/sands/Documents/vineeth/buildroot-at91/output/host/share/man/man1/mcd.1
/home/sands/Documents/vineeth/buildroot-at91/output/host/share/man/man1/mclasserase.1
/home/sands/Documents/vineeth/buildroot-at91/output/host/share/man/man1/mcopy.1
/home/sands/Documents/vineeth/buildroot-at91/output/host/share/man/man1/mdel.1
/home/sands/Documents/vineeth/buildroot-at91/output/host/share/man/man1/mdeltree.1
/home/sands/Documents/vineeth/buildroot-at91/output/host/share/man/man1/mdir.1
/home/sands/Documents/vineeth/buildroot-at91/output/host/share/man/man1/mdu.1
/home/sands/Documents/vineeth/buildroot-at91/output/host/share/man/man1/mformat.1
/home/sands/Documents/vineeth/buildroot-at91/output/host/share/man/man1/minfo.1
/home/sands/Documents/vineeth/buildroot-at91/output/host/share/man/man1/mkmanifest.1
/home/sands/Documents/vineeth/buildroot-at91/output/host/share/man/man1/mlabel.1
/home/sands/Documents/vineeth/buildroot-at91/output/host/share/man/man1/mmd.1
/home/sands/Documents/vineeth/buildroot-at91/output/host/share/man/man1/mmount.1
/home/sands/Documents/vineeth/buildroot-at91/output/host/share/man/man1/mmove.1
/home/sands/Documents/vineeth/buildroot-at91/output/host/share/man/man1/mpartition.1
/home/sands/Documents/vineeth/buildroot-at91/output/host/share/man/man1/mrd.1
/home/sands/Documents/vineeth/buildroot-at91/output/host/share/man/man1/mren.1
/home/sands/Documents/vineeth/buildroot-at91/output/host/share/man/man1/mshortname.1
/home/sands/Documents/vineeth/buildroot-at91/output/host/share/man/man1/mshowfat.1
/home/sands/Documents/vineeth/buildroot-at91/output/host/share/man/man1/mtoolstest.1
/home/sands/Documents/vineeth/buildroot-at91/output/host/share/man/man1/mtools.1
/home/sands/Documents/vineeth/buildroot-at91/output/host/share/man/man1/mtype.1
/home/sands/Documents/vineeth/buildroot-at91/output/host/share/man/man1/mzip.1
/home/sands/Documents/vineeth/buildroot-at91/output/host/share/man/man5/mtools.5
/home/sands/Documents/vineeth/buildroot-at91/output/host/bin/mattrib
/home/sands/Documents/vineeth/buildroot-at91/output/host/bin/mcat
/home/sands/Documents/vineeth/buildroot-at91/output/host/bin/mcd
/home/sands/Documents/vineeth/buildroot-at91/output/host/bin/mclasserase
/home/sands/Documents/vineeth/buildroot-at91/output/host/bin/mcopy
/home/sands/Documents/vineeth/buildroot-at91/output/host/bin/mdel
/home/sands/Documents/vineeth/buildroot-at91/output/host/bin/mdeltree
/home/sands/Documents/vineeth/buildroot-at91/output/host/bin/mdir
/home/sands/Documents/vineeth/buildroot-at91/output/host/bin/mdu
/home/sands/Documents/vineeth/buildroot-at91/output/host/bin/mformat
/home/sands/Documents/vineeth/buildroot-at91/output/host/bin/minfo
/home/sands/Documents/vineeth/buildroot-at91/output/host/bin/mlabel
/home/sands/Documents/vineeth/buildroot-at91/output/host/bin/mmd
/home/sands/Documents/vineeth/buildroot-at91/output/host/bin/mmount
/home/sands/Documents/vineeth/buildroot-at91/output/host/bin/mmove
/home/sands/Documents/vineeth/buildroot-at91/output/host/bin/mpartition
/home/sands/Documents/vineeth/buildroot-at91/output/host/bin/mrd
/home/sands/Documents/vineeth/buildroot-at91/output/host/bin/mren
/home/sands/Documents/vineeth/buildroot-at91/output/host/bin/mtype
/home/sands/Documents/vineeth/buildroot-at91/output/host/bin/mtoolstest
/home/sands/Documents/vineeth/buildroot-at91/output/host/bin/mshortname
/home/sands/Documents/vineeth/buildroot-at91/output/host/bin/mshowfat
/home/sands/Documents/vineeth/buildroot-at91/output/host/bin/mbadblocks
/home/sands/Documents/vineeth/buildroot-at91/output/host/bin/mzip
./mkinstalldirs /home/sands/Documents/vineeth/buildroot-at91/output/host/bin
/usr/bin/install -c mkmanifest
/home/sands/Documents/vineeth/buildroot-at91/output/host/bin/mkmanifest
/home/sands/Documents/vineeth/buildroot-at91/output/host/bin/mcheck
/home/sands/Documents/vineeth/buildroot-at91/output/host/bin/mxtar
/home/sands/Documents/vineeth/buildroot-at91/output/host/bin/uz
/home/sands/Documents/vineeth/buildroot-at91/output/host/bin/tgz
/home/sands/Documents/vineeth/buildroot-at91/output/host/bin/mcomp
/home/sands/Documents/vineeth/buildroot-at91/output/host/bin/amuFormat.sh
rm -f /home/sands/Documents/vineeth/buildroot-at91/output/host/bin/lz
cd /home/sands/Documents/vineeth/buildroot-at91/output/host/bin && ln -s uz
lz
./mkinstalldirs
/home/sands/Documents/vineeth/buildroot-at91/output/host/share/info
if test -f mtools.info; then \
  for i in mtools.info*; do \
    /usr/bin/install -c -m 644 $i
/home/sands/Documents/vineeth/buildroot-at91/output/host/share/info/$i; \
  done; \
else \
  for i in ./mtools.info*; do \
    /usr/bin/install -c -m 644 $i
/home/sands/Documents/vineeth/buildroot-at91/output/host/share/info/`echo
$i | sed 's|^./||'`; \
  done; \
fi; \
if [ -n "" ] ; then \
--info-dir=/home/sands/Documents/vineeth/buildroot-at91/output/host/share/info
/home/sands/Documents/vineeth/buildroot-at91/output/host/share/info/
mtools.info; \
fi
patchelf-0.9.tar.bz2: OK (sha256:
a0f65c1ba148890e9f2f7823f4bedf7ecad5417772f64f994004f59a39014f83)
>>> host-patchelf 0.9 Extracting
bzcat /home/sands/Documents/vineeth/buildroot-at91/dl/patchelf-0.9.tar.bz2
| tar --strip-components=1 -C
/home/sands/Documents/vineeth/buildroot-at91/output/build/host-patchelf-0.9
 -xf -
>>> host-patchelf 0.9 Patching

Applying 0001-Remove-apparently-incorrect-usage-of-static.patch using
patch:
patching file src/patchelf.cc

Applying 0002-Extract-a-function-for-splitting-a-colon-separated-s.patch
using patch:
patching file src/patchelf.cc

Applying 0003-Add-option-to-make-the-rpath-relative-under-a-specif.patch
using patch:
patching file src/patchelf.cc
>>> host-patchelf 0.9 Updating config.sub and config.guess
for file in config.guess config.sub; do for i in $(find
/home/sands/Documents/vineeth/buildroot-at91/output/build/host-patchelf-0.9
-name $file); do cp support/gnuconfig/$file $i; done; done
>>> host-patchelf 0.9 Patching libtool
>>> host-patchelf 0.9 Configuring
(cd
/home/sands/Documents/vineeth/buildroot-at91/output/build/host-patchelf-0.9/
&& rm -rf config.cache;
PATH="/home/sands/Documents/vineeth/buildroot-at91/output/host/bin:/home/sands/Documents/vineeth/buildroot-at91/output/host/sbin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games"
PKG_CONFIG="/home/sands/Documents/vineeth/buildroot-at91/output/host/bin/pkg-config"
PKG_CONFIG_SYSROOT_DIR="/" PKG_CONFIG_ALLOW_SYSTEM_CFLAGS=1
PKG_CONFIG_ALLOW_SYSTEM_LIBS=1
PKG_CONFIG_LIBDIR="/home/sands/Documents/vineeth/buildroot-at91/output/host/lib/pkgconfig:/home/sands/Documents/vineeth/buildroot-at91/output/host/share/pkgconfig"
AR="/usr/bin/ar" AS="/usr/bin/as" LD="/usr/bin/ld" NM="/usr/bin/nm"
CC="/usr/bin/gcc" GCC="/usr/bin/gcc" CXX="/usr/bin/g++" CPP="/usr/bin/cpp"
OBJCOPY="/usr/bin/objcopy" RANLIB="/usr/bin/ranlib"
CPPFLAGS="-I/home/sands/Documents/vineeth/buildroot-at91/output/host/include"
CFLAGS="-O2
-I/home/sands/Documents/vineeth/buildroot-at91/output/host/include"
CXXFLAGS="-O2
-I/home/sands/Documents/vineeth/buildroot-at91/output/host/include"
LDFLAGS="-L/home/sands/Documents/vineeth/buildroot-at91/output/host/lib
-Wl,-rpath,/home/sands/Documents/vineeth/buildroot-at91/output/host/lib"
INTLTOOL_PERL=/usr/bin/perl CFLAGS="-O2
-I/home/sands/Documents/vineeth/buildroot-at91/output/host/include"
LDFLAGS="-L/home/sands/Documents/vineeth/buildroot-at91/output/host/lib
-Wl,-rpath,/home/sands/Documents/vineeth/buildroot-at91/output/host/lib"
CONFIG_SITE=/dev/null ./configure
--prefix="/home/sands/Documents/vineeth/buildroot-at91/output/host"
--sysconfdir="/home/sands/Documents/vineeth/buildroot-at91/output/host/etc"
--localstatedir="/home/sands/Documents/vineeth/buildroot-at91/output/host/var"
--enable-shared --disable-static --disable-gtk-doc --disable-gtk-doc-html
--disable-doc --disable-docs --disable-documentation --disable-debug
--with-xmlto=no --with-fop=no --disable-dependency-tracking   )
configure: WARNING: unrecognized options: --enable-shared,
--disable-static, --disable-gtk-doc, --disable-gtk-doc-html, --disable-doc,
--disable-docs, --disable-documentation, --disable-debug, --with-xmlto,
--with-fop
checking for a BSD-compatible install... /usr/bin/install -c
checking whether build environment is sane... yes
checking for a thread-safe mkdir -p... /bin/mkdir -p
checking for gawk... gawk
checking whether make sets $(MAKE)... yes
checking whether make supports nested variables... yes
checking for style of include used by make... GNU
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
checking dependency style of /usr/bin/gcc... none
checking whether we are using the GNU C++ compiler... yes
checking whether /usr/bin/g++ accepts -g... yes
checking dependency style of /usr/bin/g++... none
Setting page size to 4096
checking that generated files are newer than configure... done
configure: creating ./config.status
config.status: creating Makefile
config.status: creating src/Makefile
config.status: creating tests/Makefile
config.status: creating patchelf.spec
config.status: executing depfiles commands
configure: WARNING: unrecognized options: --enable-shared,
--disable-static, --disable-gtk-doc, --disable-gtk-doc-html, --disable-doc,
--disable-docs, --disable-documentation, --disable-debug, --with-xmlto,
--with-fop
>>> host-patchelf 0.9 Building
PATH="/home/sands/Documents/vineeth/buildroot-at91/output/host/bin:/home/sands/Documents/vineeth/buildroot-at91/output/host/sbin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games"
PKG_CONFIG="/home/sands/Documents/vineeth/buildroot-at91/output/host/bin/pkg-config"
PKG_CONFIG_SYSROOT_DIR="/" PKG_CONFIG_ALLOW_SYSTEM_CFLAGS=1
PKG_CONFIG_ALLOW_SYSTEM_LIBS=1
PKG_CONFIG_LIBDIR="/home/sands/Documents/vineeth/buildroot-at91/output/host/lib/pkgconfig:/home/sands/Documents/vineeth/buildroot-at91/output/host/share/pkgconfig"
/usr/bin/make -j5  -C
/home/sands/Documents/vineeth/buildroot-at91/output/build/host-patchelf-0.9/
Making all in src
/usr/bin/g++ -DPACKAGE_NAME=\"patchelf\" -DPACKAGE_TARNAME=\"patchelf\"
-DPACKAGE_VERSION=\"0.9\" -DPACKAGE_STRING=\"patchelf\ 0.9\"
-DPACKAGE_BUGREPORT=\"\" -DPACKAGE_URL=\"\" -DPACKAGE=\"patchelf\"
-DVERSION=\"0.9\" -DPAGESIZE=4096 -I.
 -I/home/sands/Documents/vineeth/buildroot-at91/output/host/include -Wall
-O2 -I/home/sands/Documents/vineeth/buildroot-at91/output/host/include -c
-o patchelf.o patchelf.cc
/usr/bin/g++ -Wall -O2
-I/home/sands/Documents/vineeth/buildroot-at91/output/host/include
-L/home/sands/Documents/vineeth/buildroot-at91/output/host/lib
-Wl,-rpath,/home/sands/Documents/vineeth/buildroot-at91/output/host/lib -o
patchelf patchelf.o
Making all in tests
make[3]: Nothing to be done for 'all'.
make[3]: Nothing to be done for 'all-am'.
>>> host-patchelf 0.9 Installing to host directory
PATH="/home/sands/Documents/vineeth/buildroot-at91/output/host/bin:/home/sands/Documents/vineeth/buildroot-at91/output/host/sbin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games"
PKG_CONFIG="/home/sands/Documents/vineeth/buildroot-at91/output/host/bin/pkg-config"
PKG_CONFIG_SYSROOT_DIR="/" PKG_CONFIG_ALLOW_SYSTEM_CFLAGS=1
PKG_CONFIG_ALLOW_SYSTEM_LIBS=1
PKG_CONFIG_LIBDIR="/home/sands/Documents/vineeth/buildroot-at91/output/host/lib/pkgconfig:/home/sands/Documents/vineeth/buildroot-at91/output/host/share/pkgconfig"
/usr/bin/make -j5 install -C
/home/sands/Documents/vineeth/buildroot-at91/output/build/host-patchelf-0.9/
Making install in src
make[4]: Nothing to be done for 'install-data-am'.
 /bin/mkdir -p
'/home/sands/Documents/vineeth/buildroot-at91/output/host/bin'
  /usr/bin/install -c patchelf
'/home/sands/Documents/vineeth/buildroot-at91/output/host/bin'
Making install in tests
make[4]: Nothing to be done for 'install-exec-am'.
make[4]: Nothing to be done for 'install-data-am'.
make[4]: Nothing to be done for 'install-exec-am'.
 /bin/mkdir -p
'/home/sands/Documents/vineeth/buildroot-at91/output/host/share/doc/patchelf'
 /bin/mkdir -p
'/home/sands/Documents/vineeth/buildroot-at91/output/host/share/man/man1'
 /usr/bin/install -c -m 644 README
'/home/sands/Documents/vineeth/buildroot-at91/output/host/share/doc/patchelf'
 /usr/bin/install -c -m 644 patchelf.1
'/home/sands/Documents/vineeth/buildroot-at91/output/host/share/man/man1'
>>> water  Extracting
>>> water  Patching
>>> water  Configuring
>>> water  Building
*/usr/bin/make -j5
CC="/home/sands/Documents/vineeth/buildroot-at91/output/host/bin/arm-buildroot-linux-gnueabihf-gcc"
LD="/home/sands/Documents/vineeth/buildroot-at91/output/host/bin/arm-buildroot-linux-gnueabihf-ld"
-C /home/sands/Documents/vineeth/buildroot-at91/output/build/water all*
*make[2]: *** No rule to make target 'all'.  Stop.*
*package/pkg-generic.mk:247 <http://pkg-generic.mk:247>: recipe for target
'/home/sands/Documents/vineeth/buildroot-at91/output/build/water/.stamp_built'
failed*
*make[1]: ***
[/home/sands/Documents/vineeth/buildroot-at91/output/build/water/.stamp_built]
Error 2*
*Makefile:79: recipe for target '_all' failed*
*make: *** [_all] Error 2*




Thanks
With regards

On Wed, May 9, 2018 at 9:04 AM, abinaya m <abi.laesr@gmail.com> wrote:

> Dear Sir,
>
> Thank you very much! I will follow your steps.
> *> By the way, please avoid using HTML mail.*
>  Kindly let me know how to communicate with you through mailing list.
> which is the proper way to discuss our queries?
>
> Thanks
> With regards
>
> On Wed, May 9, 2018 at 2:13 AM, Arnout Vandecappelle <arnout@mind.be>
> wrote:
>
>>  Hi Abinaya,
>>
>>  I don't see anything immediately wrong with what you posted. Well,
>> there's a
>> lot wrong (see below), but nothing that would cause the executable not to
>> be
>> installed.
>>
>>  Can you check that the package is indeed built? I.e., output/build/water*
>> exists and contains the ammu executable. If it isn't, then you either
>> didn't
>> select the package, or you didn't do 'make' after selecting it.
>>
>>  Also, if you run 'make', then modify something in the water sources,
>> then run
>> 'make' again, the package will not be rebuilt. You have to do that
>> explictily:
>> 'make water-dirclean; make'.
>>
>>  By the way, please avoid using HTML mail.
>>
>> On 08-05-18 11:21, abinaya m wrote:
>> > Dear sir,
>> >      i am abi.i would like to  created a simple c program with Make
>> file that
>> > output want to be store in /etc/bin file for customized os of
>>
>>  I guess you mean /bin, not /etc/bin.
>>
>> > *atmel-sama5-D3-xplained*. There is no error after "make".but the
>> executable
>> > file is not present in bin file after make.now only i started buildroot
>> from the
>> > scratch.kindly help me sir.
>> >
>> > i followed these steps:
>> >
>> > *STEP 1:*
>> > *
>> > *
>> > *create a folder as "asd" in / /home/laptop105/sama5_abi/abi_package/asd
>> Directory
>> >
>> > *inside the directory water.c and Makefile
>> >
>> > *water.c file:*
>> >                 #include <stdio.h>
>> >                 int main(){
>> > while(1)
>> > {
>> > printf("bulidroot world\n");
>> > sleep(1);
>> > }
>> > return 0;
>> > }
>> >
>> > *Makefile:*
>> >
>> >
>> > OBJS=water.o
>> >
>> > all:water
>>
>>  You don't define a 'water' target... So I guess you actually used a
>> different
>> makefile, otherwise it would error out.
>>
>> >
>> > helloworld:$(OBJS)
>> > $(CC) $(LDFLAGS) -o ammu $(OBJS)
>> >
>> > $(OBJS): %.o:%.c
>> > $(CC) $(CFLAGS) -c -o $@ $<
>> > clean:
>> > rm -f $ (OBJ)
>> >
>> > install:
>> > cp ammu $ (DESTDIR) / bin / ammu
>>
>>  I guess there are actually no spaces there, or it would error out. Well,
>> you
>> never call the install target anyway.
>>
>> >
>> > *STEP 2:*
>> >       directory ---> bulidroot-at91/package/water   inside that
>> Config.in &
>> > water.mk <http://water.mk>
>> >
>> > *Config.in:*
>> >         config BR2_PACKAGE_WATER
>> >     bool "water"
>> >     help
>> >       Hello World package says hello world to you
>> >       see http://water.com for more on this software
>> >
>> > *water.mk <http://water.mk>:*
>> >
>> >
>> > WATER_VERSION:= 1.0.0
>>
>>  Buildroot has the convention to use = assignments, not :=, except in the
>> cases
>> where really needed. Also we put spaces around the =.
>>
>> > WATER_SITE:= /home/laptop105/sama5_abi/abi_package/asd
>>
>>  It's probably better to use a relative path here (relative to buildroot
>> dir).
>>
>> > WATER_SITE_METHOD:=local
>> > WATER_INSTALL_TARGET:=YES
>>
>>  This is the default so not needed.
>>
>> >
>> > define WATER_BUILD_CMDS
>> >         $(MAKE) CC="$(TARGET_CC)" LD="$(TARGET_LD)" -C $(@D) all
>> > endef
>> >
>> > define WATER_INSTALL_TARGET_CMDS
>> >         $(INSTALL) -D -m 0755 $(@D)/ammu $(TARGET_DIR)/bin
>>
>>  You should give the full path as the last argument, so:
>>
>>         $(INSTALL) -D -m 0755 $(@D)/ammu $(TARGET_DIR)/bin/ammu
>>
>>
>> > endef
>> >
>> > define WATER_PERMISSIONS
>> >        /bin/ammuf 4755 0 0 - - - - -
>>
>>  You really want to make it setuid? Normally, you shouldn't need a
>> _PERMISSIONS
>> entry at all.
>>
>> > endef
>> >
>> > $(eval $(generic-package))
>> >
>> > *STEP 3:**
>> > *
>> > *
>> > *
>> > *buildroot-at91/package/Config.in inside the  file i put*
>> > *
>> > *
>> > *
>> > menu "Misc"
>> >     *source "package/water/Config.in"*
>> > endmenu
>> >
>> > *
>> > *
>> > *STEP 4:*
>> > *    *
>> > *                    make atmel_sama5d3_xplained_mmc_defconfig*
>> > *                    make menuconfig*
>> > *
>>
>>  Another 'make' is needed here.
>>
>>  Regards,
>>  Arnout
>>
>> > *
>> >
>> > *
>> > *
>> > *
>> > *
>> >
>> >
>> > Thanks
>> > With regards
>> > abinaya
>> >
>> >
>> >
>> > _______________________________________________
>> > buildroot mailing list
>> > buildroot at busybox.net
>> > http://lists.busybox.net/mailman/listinfo/buildroot
>> >
>>
>> --
>> Arnout Vandecappelle                          arnout at mind be
>> Senior Embedded Software Architect            +32-16-286500
>> Essensium/Mind                                http://www.mind.be
>> G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
>> LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
>> GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
>>
>
>
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20180509/cc0343f5/attachment.html>
