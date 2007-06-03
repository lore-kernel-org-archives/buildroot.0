From: Ormund Williams <ormundw@panix.com>
Date: Sun, 03 Jun 2007 16:09:44 -0400
Subject: [Buildroot] build failed on the latest svn version using	uclibc
	0.9.29/NPTL
In-Reply-To: <200705241736.30384.wangbj@lzu.edu.cn>
References: <200705241736.30384.wangbj@lzu.edu.cn>
Message-ID: <1180901384.4532.24.camel@localhost.localdomain>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, 2007-05-24 at 17:36 +0800, Wang, Baojun wrote:
> platform is: i386/i686
> 
> error messages:
> 
> 
> Checking build system dependencies:
> CC clean:                                       Ok
> CXX clean:                                      Ok
> CPP clean:                                      Ok
> CFLAGS clean:                                   Ok
> INCLUDES clean:                                 Ok
> CXXFLAGS clean:                                 Ok
> which installed:                                Ok
> sed works:                                      Ok (/bin/sed)
> GNU make version '3.81':                        Ok
> C compiler '/usr/bin/gcc'
> C compiler version '4.1.2':                     Ok
> C++ compiler '/usr/bin/c++'
> C++ compiler version '4.1.2':                   Ok
> bison installed:                                Ok
> flex installed:                                 Ok
> gettext installed:                              Ok
> makeinfo installed:                             Ok
> Build system dependencies:                      Ok
> 
> make 
> MAKE="make -j1" -C /home/wangbj/build/buildroot-x86/toolchain_build_i686/uClibc-0.9.29 
> \
>                 PREFIX= \
>                 DEVEL_PREFIX=/ \
>                 RUNTIME_PREFIX=/ \
>                 HOSTCC="gcc" \
>                 all
> make[1]: Entering directory 
> `/home/wangbj/build/buildroot-x86/toolchain_build_i686/uClibc-0.9.29'
> make[2]: `conf' is up to date.
>   CC ldso/ldso/ldso.oS
> In file included 
> from ./libpthread/linuxthreads/sysdeps/i386/i686/pt-machine.h:73,
>                  from ./libpthread/linuxthreads/sysdeps/i386/pt-machine.h:24,
>                  from ./libpthread/linuxthreads/sysdeps/i386/tls.h:23,
>                  from ./include/bits/uClibc_errno.h:35,
>                  from ./include/errno.h:62,
>                  from ./include/bits/syscalls.h:14,
>                  from ./include/sys/syscall.h:34,
>                  from ./ldso/ldso/i386/dl-syscalls.h:3,
>                  from ./ldso/include/dl-syscall.h:12,
>                  from ./ldso/include/ldso.h:36,
>                  from ldso/ldso/ldso.c:33:
> ./libpthread/linuxthreads/sysdeps/i386/i686/../useldt.h:25:20: error: 
> sysdep.h: No such file or directory
> make[1]: *** [ldso/ldso/ldso.oS] Error 1
> make[1]: Leaving directory 
> `/home/wangbj/build/buildroot-x86/toolchain_build_i686/uClibc-0.9.29'
> make: *** 
> 
Is there a solution for this?  Google brings me back to this post and another
one from April.
