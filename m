From: Adam McLaurin <buildroot@irotas.net>
Date: Fri, 29 May 2009 10:36:25 -0400
Subject: [Buildroot] 202: Illegal number: gcc
In-Reply-To: <133898.99840.qm@web111905.mail.gq1.yahoo.com>
References: <133898.99840.qm@web111905.mail.gq1.yahoo.com>
Message-ID: <1243607785.23414.1317827639@webmail.messagingengine.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

I get the same error on my Ubuntu box, and have for as long as I
can remember.

On Fri, 29 May 2009 05:58 -0700, "Peter Weichai"
<peterweichai@yahoo.com> wrote:

  Hi Guys,
  I'm trying to build buildroot on my ubuntu system. I encountered
  the below problem. Need advice. The error might due to my gcc and
  g++? Any idea how to solve it?
  Thanks in advance
  Checking build system dependencies:
  BUILDROOT_DL_DIR clean:                Ok
  CC clean:                    Ok
  CXX clean:                    Ok
  CPP clean:                    Ok
  CFLAGS clean:                    Ok
  INCLUDES clean:                    Ok
  CXXFLAGS clean:                    Ok
  which installed:                Ok
  sed works:                    Ok (/bin/sed)
  GNU make version '3.81':            Ok
  [: 202: Illegal number: gcc
  C compiler '/usr/bin/gcc'
  C compiler version 'gcc':            Ok
  [: 233: Illegal number: g++
  C++ compiler '/usr/bin/g++'
  C++ compiler version 'g++':            Ok
  bison installed:                Ok
  flex installed:                    Ok
  gettext installed:                Ok
  makeinfo installed:                Ok
  Build system dependencies:            Ok
  rm -rf
  /home/peter/lab/buildroot/project_build_arm/uclibc/buildroot-conf
  ig
  mkdir -p /home/peter/lab/buildroot/project_build_arm/uclibc
  cp -dpRf package/config/buildroot-config
  /home/peter/lab/buildroot/project_build_arm/uclibc/buildroot-conf
  ig
  /usr/bin/make -j1 -C
  /home/peter/lab/buildroot/toolchain_build_arm/binutils-2.18-build
  all
  make[1]: Entering directory
  `/home/peter/lab/buildroot/toolchain_build_arm/binutils-2.18-buil
  d'
  make[2]: Entering directory
  `/home/peter/lab/buildroot/toolchain_build_arm/binutils-2.18-buil
  d'
  make[3]: Entering directory
  `/home/peter/lab/buildroot/toolchain_build_arm/binutils-2.18-buil
  d/libiberty'
  make[4]: Entering directory
  `/home/peter/lab/buildroot/toolchain_build_arm/binutils-2.18-buil
  d/libiberty/testsuite'
  make[4]: Nothing to be done for `all'.
  make[4]: Leaving directory
  `/home/peter/lab/buildroot/toolchain_build_arm/binutils-2.18-buil
  d/libiberty/testsuite'
  make[3]: Leaving directory
  `/home/peter/lab/buildroot/toolchain_build_arm/binutils-2.18-buil
  d/libiberty'
  make[3]: Entering directory
  `/home/peter/lab/buildroot/toolchain_build_arm/binutils-2.18-buil
  d/intl'
  make[3]: Nothing to be done for `all'.
  make[3]: Leaving directory
  `/home/peter/lab/buildroot/toolchain_build_arm/binutils-2.18-buil
  d/intl'
  make[3]: Entering directory
  `/home/peter/lab/buildroot/toolchain_build_arm/binutils-2.18-buil
  d/bfd'
  Making info in doc
  make[4]: Entering directory
  `/home/peter/lab/buildroot/toolchain_build_arm/binutils-2.18-buil
  d/bfd/doc'
  restore=: && backupdir=".am$$" && \
      rm -rf $backupdir && mkdir $backupdir && \
      if
  (/home/peter/lab/buildroot/toolchain_build_arm/binutils-2.18/miss
  ing makeinfo --split-size=5000000 --split-size=5000000 --version)
  >/dev/null 2>&1; then \
        for f in bfd.info bfd.info-[0-9] bfd.info-[0-9][0-9]
  bfd.i[0-9] bfd.i[0-9][0-9]; do \
          if test -f $f; then mv $f $backupdir; restore=mv; else :;
  fi; \
        done; \
      else :; fi && \
      if
  /home/peter/lab/buildroot/toolchain_build_arm/binutils-2.18/missi
  ng makeinfo --split-size=5000000 --split-size=5000000   -I
  /home/peter/lab/buildroot/toolchain_build_arm/binutils-2.18/bfd/d
  oc \
       -o bfd.info `test -f 'bfd.texinfo' || echo
  '/home/peter/lab/buildroot/toolchain_build_arm/binutils-2.18/bfd/
  doc/'`bfd.texinfo; \
      then \
        rc=0; \
      else \
        rc=$?; \
        $restore $backupdir/* `echo "./bfd.info" | sed
  's|[^/]*$||'`; \
      fi; \
      rm -rf $backupdir; exit $rc
  WARNING: `makeinfo' is missing on your system.  You should only
  need it if
           you modified a `.texi' or `.texinfo' file, or any other
  file
           indirectly affecting the aspect of the manual.  The
  spurious
           call might also be the consequence of using a buggy
  `make' (AIX,
           DU, IRIX).  You might want to install the `Texinfo'
  package or
           the `GNU make' package.  Grab either from any GNU
  archive site.
  make[4]: *** [bfd.info] Error 1
  make[4]: Leaving directory
  `/home/peter/lab/buildroot/toolchain_build_arm/binutils-2.18-buil
  d/bfd/doc'
  Making info in po
  make[4]: Entering directory
  `/home/peter/lab/buildroot/toolchain_build_arm/binutils-2.18-buil
  d/bfd/po'
  make[4]: Nothing to be done for `info'.
  make[4]: Leaving directory
  `/home/peter/lab/buildroot/toolchain_build_arm/binutils-2.18-buil
  d/bfd/po'
  make[4]: Entering directory
  `/home/peter/lab/buildroot/toolchain_build_arm/binutils-2.18-buil
  d/bfd'
  make[4]: Nothing to be done for `info-am'.
  make[4]: Leaving directory
  `/home/peter/lab/buildroot/toolchain_build_arm/binutils-2.18-buil
  d/bfd'
  make[3]: *** [info-recursive] Error 1
  make[3]: Leaving directory
  `/home/peter/lab/buildroot/toolchain_build_arm/binutils-2.18-buil
  d/bfd'
  make[2]: *** [all-bfd] Error 2
  make[2]: Leaving directory
  `/home/peter/lab/buildroot/toolchain_build_arm/binutils-2.18-buil
  d'
  make[1]: *** [all] Error 2
  make[1]: Leaving directory
  `/home/peter/lab/buildroot/toolchain_build_arm/binutils-2.18-buil
  d'
  make: ***
  [/home/peter/lab/buildroot/toolchain_build_arm/binutils-2.18-buil
  d/binutils/objdump] Error 2
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20090529/2179bbc6/attachment-0001.htm>
