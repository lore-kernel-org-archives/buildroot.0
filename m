From: cem akpolat <akpolatcem@gmail.com>
Date: Tue, 20 May 2014 13:31:16 +0200
Subject: [Buildroot] Fwd:  Fwd: how to assign cpp and c++ in buildroot?
In-Reply-To: <CAMm5YqoPu1QDkzdpoFfZfNCj0V+VeVkYcUPW=xzzqLB-eYAAuQ@mail.gmail.com>
References: <52E9D80E-B9AD-417A-BC0F-66A69C39FC21@gmail.com>
 <5F503FD3-3FBC-4ADB-9D17-BA0CB5606B6D@gmail.com>
 <20140520000920.20ae6b5b@free-electrons.com>
 <0727D305-97AD-471C-BA2D-D6A251B4FA90@gmail.com>
 <CAMm5YqqFDD0a_hA0fGdiLDuHLoaCVVgf2L_-wzQikpF4cm7FJw@mail.gmail.com>
 <CAAXf6LUF7eXsQvJRLoO0oHcefs9PGnUOVXGCNNhZ2YKV_SkGVA@mail.gmail.com>
 <20140520113955.475370b3@free-electrons.com>
 <CAMm5YqoPu1QDkzdpoFfZfNCj0V+VeVkYcUPW=xzzqLB-eYAAuQ@mail.gmail.com>
Message-ID: <CAMm5YqqZjnWaNQ+S5a+huY+tOfHgqv51St9HhQZ=69i-4u9PQw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Thomas,


I added two packages to buildroot, however, the compilation issue doesn't
stem from them. Nevertheless, I have removed them and did make distclean
and then compile it again.
the compilation result is below. I didn't touch package/Makefile.in. The
problem is that I am seeing it everywhere (on other PCs). I will send you
another make result on my other pc.


(cd /home/cem/buildroot/buildroot-2014.02/output/build/expat-2.1.0/ && rm
-rf config.cache &&
PATH="/home/cem/buildroot/buildroot-2014.02/output/host/bin:/home/cem/buildroot/buildroot-2014.02/output/host/usr/bin:/home/cem/buildroot/buildroot-2014.02/output/host/usr/sbin/:/usr/lib/lightdm/lightdm:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games"
AR="/home/cem/buildroot/buildroot-2014.02/output/host/usr/bin/i586-buildroot-linux-uclibc-ar"
AS="/home/cem/buildroot/buildroot-2014.02/output/host/usr/bin/i586-buildroot-linux-uclibc-as"
LD="/home/cem/buildroot/buildroot-2014.02/output/host/usr/bin/i586-buildroot-linux-uclibc-ld"
NM="/home/cem/buildroot/buildroot-2014.02/output/host/usr/bin/i586-buildroot-linux-uclibc-nm"
CC="/home/cem/buildroot/buildroot-2014.02/output/host/usr/bin/i586-buildroot-linux-uclibc-gcc"
GCC="/home/cem/buildroot/buildroot-2014.02/output/host/usr/bin/i586-buildroot-linux-uclibc-gcc"
CPP="/home/cem/buildroot/buildroot-2014.02/output/host/usr/bin/i586-buildroot-linux-uclibc-g++
"
CXX="/home/cem/buildroot/buildroot-2014.02/output/host/usr/bin/i586-buildroot-linux-uclibc-g++"
FC="/home/cem/buildroot/buildroot-2014.02/output/host/usr/bin/i586-buildroot-linux-uclibc-gfortran"
RANLIB="/home/cem/buildroot/buildroot-2014.02/output/host/usr/bin/i586-buildroot-linux-uclibc-ranlib"
READELF="/home/cem/buildroot/buildroot-2014.02/output/host/usr/bin/i586-buildroot-linux-uclibc-readelf"
STRIP="/home/cem/buildroot/buildroot-2014.02/output/host/usr/bin/i586-buildroot-linux-uclibc-strip"
OBJCOPY="/home/cem/buildroot/buildroot-2014.02/output/host/usr/bin/i586-buildroot-linux-uclibc-objcopy"
OBJDUMP="/home/cem/buildroot/buildroot-2014.02/output/host/usr/bin/i586-buildroot-linux-uclibc-objdump"
AR_FOR_BUILD="/usr/bin/ar" AS_FOR_BUILD="/usr/bin/as"
CC_FOR_BUILD="/usr/bin/gcc" GCC_FOR_BUILD="/usr/bin/gcc"
CXX_FOR_BUILD="/usr/bin/g++" FC_FOR_BUILD="/usr/bin/ld"
LD_FOR_BUILD="/usr/bin/ld"
CPPFLAGS_FOR_BUILD="-I/home/cem/buildroot/buildroot-2014.02/output/host/usr/include"
CFLAGS_FOR_BUILD="-O2
-I/home/cem/buildroot/buildroot-2014.02/output/host/usr/include"
CXXFLAGS_FOR_BUILD="-O2
-I/home/cem/buildroot/buildroot-2014.02/output/host/usr/include"
LDFLAGS_FOR_BUILD="-L/home/cem/buildroot/buildroot-2014.02/output/host/lib
-L/home/cem/buildroot/buildroot-2014.02/output/host/usr/lib
-Wl,-rpath,/home/cem/buildroot/buildroot-2014.02/output/host/usr/lib"
FCFLAGS_FOR_BUILD=""
DEFAULT_ASSEMBLER="/home/cem/buildroot/buildroot-2014.02/output/host/usr/bin/i586-buildroot-linux-uclibc-as"
DEFAULT_LINKER="/home/cem/buildroot/buildroot-2014.02/output/host/usr/bin/i586-buildroot-linux-uclibc-ld"
CPPFLAGS="-D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64"
CFLAGS="-D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64
 -pipe -Os " CXXFLAGS="-D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE
-D_FILE_OFFSET_BITS=64  -pipe -Os " LDFLAGS="" FCFLAGS=""
PKG_CONFIG="/home/cem/buildroot/buildroot-2014.02/output/host/usr/bin/pkg-config"
STAGING_DIR="/home/cem/buildroot/buildroot-2014.02/output/host/usr/i586-buildroot-linux-uclibc/sysroot"
ac_cv_lbl_unaligned_fail=no ac_cv_func_mmap_fixed_mapped=yes
ac_cv_func_memcmp_working=yes ac_cv_have_decl_malloc=yes
gl_cv_func_malloc_0_nonnull=yes ac_cv_func_malloc_0_nonnull=yes
ac_cv_func_calloc_0_nonnull=yes ac_cv_func_realloc_0_nonnull=yes
lt_cv_sys_lib_search_path_spec="" ac_cv_c_bigendian=no  ./configure
--target=i586-buildroot-linux-uclibc --host=i586-buildroot-linux-uclibc
--build=x86_64-unknown-linux-gnu --prefix=/usr --exec-prefix=/usr
--sysconfdir=/etc --program-prefix="" --disable-gtk-doc --disable-doc
--disable-docs --disable-documentation --with-xmlto=no --with-fop=no
--disable-nls  --enable-ipv6 --enable-static --enable-shared   )
configure: WARNING: unrecognized options: --disable-gtk-doc, --disable-doc,
--disable-docs, --disable-documentation, --with-xmlto, --with-fop,
--disable-nls, --enable-ipv6
checking build system type... x86_64-unknown-linux-gnu
checking host system type... i586-buildroot-linux-uclibc
checking how to print strings... printf
checking for i586-buildroot-linux-uclibc-gcc...
/home/cem/buildroot/buildroot-2014.02/output/host/usr/bin/i586-buildroot-linux-uclibc-gcc
checking whether the C compiler works... yes
checking for C compiler default output file name... a.out
checking for suffix of executables...
checking whether we are cross compiling... yes
checking for suffix of object files... o
checking whether we are using the GNU C compiler... yes
checking whether
/home/cem/buildroot/buildroot-2014.02/output/host/usr/bin/i586-buildroot-linux-uclibc-gcc
accepts -g... yes
checking for
/home/cem/buildroot/buildroot-2014.02/output/host/usr/bin/i586-buildroot-linux-uclibc-gcc
option to accept ISO C89... none needed
checking for a sed that does not truncate output... /bin/sed
checking for grep that handles long lines and -e... /bin/grep
checking for egrep... /bin/grep -E
checking for fgrep... /bin/grep -F
checking for ld used by
/home/cem/buildroot/buildroot-2014.02/output/host/usr/bin/i586-buildroot-linux-uclibc-gcc...
/home/cem/buildroot/buildroot-2014.02/output/host/usr/bin/i586-buildroot-linux-uclibc-ld
checking if the linker
(/home/cem/buildroot/buildroot-2014.02/output/host/usr/bin/i586-buildroot-linux-uclibc-ld)
is GNU ld... yes
checking for BSD- or MS-compatible name lister (nm)...
/home/cem/buildroot/buildroot-2014.02/output/host/usr/bin/i586-buildroot-linux-uclibc-nm
checking the name lister
(/home/cem/buildroot/buildroot-2014.02/output/host/usr/bin/i586-buildroot-linux-uclibc-nm)
interface... BSD nm
checking whether ln -s works... yes
checking the maximum length of command line arguments... 3458764513820540925
checking whether the shell understands some XSI constructs... yes
checking whether the shell understands "+="... no
checking how to convert x86_64-unknown-linux-gnu file names to
i586-buildroot-linux-uclibc format... func_convert_file_noop
checking how to convert x86_64-unknown-linux-gnu file names to toolchain
format... func_convert_file_noop
checking for
/home/cem/buildroot/buildroot-2014.02/output/host/usr/bin/i586-buildroot-linux-uclibc-ld
option to reload object files... -r
checking for i586-buildroot-linux-uclibc-objdump...
/home/cem/buildroot/buildroot-2014.02/output/host/usr/bin/i586-buildroot-linux-uclibc-objdump
checking how to recognize dependent libraries... pass_all
checking for i586-buildroot-linux-uclibc-dlltool... dlltool
checking how to associate runtime and link libraries... printf %s\n
checking for i586-buildroot-linux-uclibc-ar...
/home/cem/buildroot/buildroot-2014.02/output/host/usr/bin/i586-buildroot-linux-uclibc-ar
checking for archiver @FILE support... @
checking for i586-buildroot-linux-uclibc-strip...
/home/cem/buildroot/buildroot-2014.02/output/host/usr/bin/i586-buildroot-linux-uclibc-strip
checking for i586-buildroot-linux-uclibc-ranlib...
/home/cem/buildroot/buildroot-2014.02/output/host/usr/bin/i586-buildroot-linux-uclibc-ranlib
checking for gawk... gawk
checking command to parse
/home/cem/buildroot/buildroot-2014.02/output/host/usr/bin/i586-buildroot-linux-uclibc-nm
output from
/home/cem/buildroot/buildroot-2014.02/output/host/usr/bin/i586-buildroot-linux-uclibc-gcc
object... ok
checking for sysroot... no
checking for i586-buildroot-linux-uclibc-mt... no
checking for mt... mt
configure: WARNING: using cross tools not prefixed with host triplet
checking if mt is a manifest tool... no
checking how to run the C preprocessor...
/home/cem/buildroot/buildroot-2014.02/output/host/usr/bin/i586-buildroot-linux-uclibc-g++
configure: error: in
`/home/cem/buildroot/buildroot-2014.02/output/build/expat-2.1.0':
configure: error: C preprocessor
"/home/cem/buildroot/buildroot-2014.02/output/host/usr/bin/i586-buildroot-linux-uclibc-g++
" fails sanity check
See `config.log' for more details
make: ***
[/home/cem/buildroot/buildroot-2014.02/output/build/expat-2.1.0/.stamp_configured]
Error 1
cem at galaxy:~/buildroot/buildroot-2014.02$
cem at galaxy:~/buildroot/buildroot-2014.02$

Thanks
Cem


Cem Akpolat


On Tue, May 20, 2014 at 11:39 AM, Thomas Petazzoni <
thomas.petazzoni@free-electrons.com> wrote:

> Dear Thomas De Schampheleire,
>
> On Tue, 20 May 2014 10:58:43 +0200, Thomas De Schampheleire wrote:
>
> > >  [7m>>> expat 2.1.0 Configuring [27m
> > > (cd /home/cem/buildroot/buildroot-2014.02/output/build/expat-2.1.0/ &&
> rm
> > > -rf config.cache &&
> > >
> PATH="/home/cem/buildroot/buildroot-2014.02/output/host/bin:/home/cem/buildroot/buildroot-2014.02/output/host/usr/bin:/home/cem/buildroot/buildroot-2014.02/output/host/usr/sbin/:/usr/lib/lightdm/lightdm:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games"
> > >
> AR="/home/cem/buildroot/buildroot-2014.02/output/host/usr/bin/i586-buildroot-linux-uclibc-ar"
> > >
> AS="/home/cem/buildroot/buildroot-2014.02/output/host/usr/bin/i586-buildroot-linux-uclibc-as"
> > >
> LD="/home/cem/buildroot/buildroot-2014.02/output/host/usr/bin/i586-buildroot-linux-uclibc-ld"
> > >
> NM="/home/cem/buildroot/buildroot-2014.02/output/host/usr/bin/i586-buildroot-linux-uclibc-nm"
> > >
> CC="/home/cem/buildroot/buildroot-2014.02/output/host/usr/bin/i586-buildroot-linux-uclibc-gcc"
> > >
> GCC="/home/cem/buildroot/buildroot-2014.02/output/host/usr/bin/i586-buildroot-linux-uclibc-gcc"
> > >
> CPP="/home/cem/buildroot/buildroot-2014.02/output/host/usr/bin/i586-buildroot-linux-uclibc-g++
> > > "
> > >
> CXX="/home/cem/buildroot/buildroot-2014.02/output/host/usr/bin/i586-buildroot-linux-uclibc-g++"
> >
> > Are you sure that you do not have any custom TARGET_CPP variable in
> > your environment, or made custom changes to buildroot?
> > The above command is composed using: (package/Makefile.in)
> >
> >                 GCC="$(TARGET_CC)" \
> >                 CPP="$(TARGET_CPP)" \
> >                 CXX="$(TARGET_CXX)" \
> >
> > and these variables TARGET_xxxx are defined in the same file as:
> >
> > TARGET_CC       = $(TARGET_CROSS)gcc
> > TARGET_CPP      = $(TARGET_CROSS)cpp
> > TARGET_CXX      = $(TARGET_CROSS)g++
> >
> > I think the error you experience can only happen if you would have a
> > custom TARGET_CPP in your environment, which would overwrite the
> > definition above. The fact that there is an extra space between the
> > 'g++' and the closing quote " also makes me believe you have something
> > custom in your environment/makefiles.
>
> FWIW, I've just built 'expat' here, and here is what I see:
>
> (cd /home/thomas/projets/buildroot/output/build/expat-2.1.0/ && rm -rf
> config.cache &&
> PATH="/home/thomas/projets/buildroot/output/host/bin:/home/thomas/projets/buildroot/output/host/sbin:/home/thomas/projets/buildroot/output/host/usr/bin:/home/thomas/projets/buildroot/output/host/usr/sbin:/usr/lib/lightdm/lightdm:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games:/home/thomas/sys/bin"
> AR="/home/thomas/projets/buildroot/output/host/usr/bin/arm-linux-ar"
> AS="/home/thomas/projets/buildroot/output/host/usr/bin/arm-linux-as"
> LD="/home/thomas/projets/buildroot/output/host/usr/bin/arm-linux-ld"
> NM="/home/thomas/projets/buildroot/output/host/usr/bin/arm-linux-nm"
> CC="/home/thomas/projets/buildroot/output/host/usr/bin/arm-linux-gcc"
> GCC="/home/thomas/projets/buildroot/output/host/usr/bin/arm-linux-gcc"
> CPP="/home/thomas/projets/buildroot/output/host/usr/bin/arm-linux-cpp"
> CXX="/home/thomas/projets/buildroot/output/host/usr/bin/arm-linux-g++"
>
> So here, the value of the CPP variable is correct, which confirms what
> Thomas DS is suggesting.
>
> Best regards,
>
> Thomas
> --
> Thomas Petazzoni, CTO, Free Electrons
> Embedded Linux, Kernel and Android engineering
> http://free-electrons.com
>
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20140520/8b12a84b/attachment.html>
