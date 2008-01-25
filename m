From: Albert Causing <albertcausing@gmail.com>
Date: Fri, 25 Jan 2008 12:08:11 +0800
Subject: [Buildroot] also this one! please help i have makeinfo but dont
	know about this...
Message-ID: <afc3bae70801242008s5d34543fj3cf76599df4a83b0@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

bt buildroot # make
target/device/Via/epia-mii/linux.mk:75: warning: overriding commands
for target `/opt/buildroot/buildroot/build_i386/linux/.configured'
target/device/Soekris/net4521/linux.mk:84: warning: ignoring old
commands for target
`/opt/buildroot/buildroot/build_i386/linux/.configured'
target/device/Via/epia-mii/linux.mk:89: warning: overriding commands
for target `/opt/buildroot/buildroot/build_i386/buildroot-kernel'
target/device/Soekris/net4521/linux.mk:99: warning: ignoring old
commands for target
`/opt/buildroot/buildroot/build_i386/buildroot-kernel'
target/device/Via/epia-mii/linux.mk:99: warning: overriding commands
for target `/opt/buildroot/buildroot/build_i386/staging_dir/usr/include/linux/version.h'
target/device/Soekris/net4521/linux.mk:110: warning: ignoring old
commands for target
`/opt/buildroot/buildroot/build_i386/staging_dir/usr/include/linux/version.h'
target/device/Via/epia-mii/linux.mk:109: warning: overriding commands
for target `linuxclean'
target/device/Soekris/net4521/linux.mk:120: warning: ignoring old
commands for target `linuxclean'
target/device/Via/epia-mii/linux.mk:113: warning: overriding commands
for target `linux-dirclean'
target/device/Soekris/net4521/linux.mk:124: warning: ignoring old
commands for target `linux-dirclean'

Checking build system dependencies:
BUILDROOT_DL_DIR clean:                         Ok
CC clean:                                       Ok
CXX clean:                                      Ok
CPP clean:                                      Ok
CFLAGS clean:                                   Ok
INCLUDES clean:                                 Ok
CXXFLAGS clean:                                 Ok
which installed:                                Ok
sed works:                                      Ok (/usr/bin/sed)
GNU make version '3.81':                        Ok
C compiler '/usr/bin/gcc'
C compiler version '3.4.6':                     Ok
C++ compiler '/usr/bin/g++'
C++ compiler version '3.4.6':                   Ok
bison installed:                                Ok
flex installed:                                 Ok
gettext installed:                              Ok
makeinfo installed:                             Ok
Build system dependencies:                      Ok

rm -rf /opt/buildroot/buildroot/project_build_i386/uclibc/buildroot-config
mkdir -p /opt/buildroot/buildroot/project_build_i386/uclibc
cp -dpRf package/config/buildroot-config
/opt/buildroot/buildroot/project_build_i386/uclibc/buildroot-config
/usr/bin/make -j1 -C
/opt/buildroot/buildroot/toolchain_build_i386/binutils-2.18-build all
make[1]: Entering directory
`/opt/buildroot/buildroot/toolchain_build_i386/binutils-2.18-build'
make[2]: Entering directory
`/opt/buildroot/buildroot/toolchain_build_i386/binutils-2.18-build'
make[3]: Entering directory
`/opt/buildroot/buildroot/toolchain_build_i386/binutils-2.18-build/libiberty'
make[4]: Entering directory
`/opt/buildroot/buildroot/toolchain_build_i386/binutils-2.18-build/libiberty/testsuite'
make[4]: Nothing to be done for `all'.
make[4]: Leaving directory
`/opt/buildroot/buildroot/toolchain_build_i386/binutils-2.18-build/libiberty/testsuite'
make[3]: Leaving directory
`/opt/buildroot/buildroot/toolchain_build_i386/binutils-2.18-build/libiberty'
make[3]: Entering directory
`/opt/buildroot/buildroot/toolchain_build_i386/binutils-2.18-build/intl'
make[3]: Nothing to be done for `all'.
make[3]: Leaving directory
`/opt/buildroot/buildroot/toolchain_build_i386/binutils-2.18-build/intl'
make[3]: Entering directory
`/opt/buildroot/buildroot/toolchain_build_i386/binutils-2.18-build/bfd'
Making info in doc
make[4]: Entering directory
`/opt/buildroot/buildroot/toolchain_build_i386/binutils-2.18-build/bfd/doc'
restore=: && backupdir=".am$$" && \
        rm -rf $backupdir && mkdir $backupdir && \
        if (/opt/buildroot/buildroot/toolchain_build_i386/binutils-2.18/missing
makeinfo --split-size=5000000 --split-size=5000000 --version)
>/dev/null 2>&1; then \
          for f in bfd.info bfd.info-[0-9] bfd.info-[0-9][0-9]
bfd.i[0-9] bfd.i[0-9][0-9]; do \
            if test -f $f; then mv $f $backupdir; restore=mv; else :; fi; \
          done; \
        else :; fi && \
        if /opt/buildroot/buildroot/toolchain_build_i386/binutils-2.18/missing
makeinfo --split-size=5000000 --split-size=5000000   -I
/opt/buildroot/buildroot/toolchain_build_i386/binutils-2.18/bfd/doc \
         -o bfd.info `test -f 'bfd.texinfo' || echo
'/opt/buildroot/buildroot/toolchain_build_i386/binutils-2.18/bfd/doc/'`bfd.texinfo;
\
        then \
          rc=0; \
        else \
          rc=$?; \
          $restore $backupdir/* `echo "./bfd.info" | sed 's|[^/]*$||'`; \
        fi; \
        rm -rf $backupdir; exit $rc
WARNING: `makeinfo' is missing on your system.  You should only need it if
         you modified a `.texi' or `.texinfo' file, or any other file
         indirectly affecting the aspect of the manual.  The spurious
         call might also be the consequence of using a buggy `make' (AIX,
         DU, IRIX).  You might want to install the `Texinfo' package or
         the `GNU make' package.  Grab either from any GNU archive site.
make[4]: *** [bfd.info] Error 1
make[4]: Leaving directory
`/opt/buildroot/buildroot/toolchain_build_i386/binutils-2.18-build/bfd/doc'
Making info in po
make[4]: Entering directory
`/opt/buildroot/buildroot/toolchain_build_i386/binutils-2.18-build/bfd/po'
make[4]: Nothing to be done for `info'.
make[4]: Leaving directory
`/opt/buildroot/buildroot/toolchain_build_i386/binutils-2.18-build/bfd/po'
make[4]: Entering directory
`/opt/buildroot/buildroot/toolchain_build_i386/binutils-2.18-build/bfd'
make[4]: Nothing to be done for `info-am'.
make[4]: Leaving directory
`/opt/buildroot/buildroot/toolchain_build_i386/binutils-2.18-build/bfd'
make[3]: *** [info-recursive] Error 1
make[3]: Leaving directory
`/opt/buildroot/buildroot/toolchain_build_i386/binutils-2.18-build/bfd'
make[2]: *** [all-bfd] Error 2
make[2]: Leaving directory
`/opt/buildroot/buildroot/toolchain_build_i386/binutils-2.18-build'
make[1]: *** [all] Error 2
make[1]: Leaving directory
`/opt/buildroot/buildroot/toolchain_build_i386/binutils-2.18-build'
make: *** [/opt/buildroot/buildroot/toolchain_build_i386/binutils-2.18-build/binutils/objdump]
Error 2
bt buildroot #
bt buildroot # makeinfo
makeinfo: missing file argument.
Try `makeinfo --help' for more information.
bt buildroot #
