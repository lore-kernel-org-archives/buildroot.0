From: =?GB2312?B?xeHd7Q==?= <pbman2002@gmail.com>
Date: Thu, 26 Apr 2007 09:43:16 +0800
Subject: [Buildroot] Failed to build the toolchain for ARM7TDMI
Message-ID: <bc56c6d90704251843l7a0d278cn2ee437e77afefe2f@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Can anybody tell me what should I do,thx.  The following info was
displayed in terminal:

config.status: creating po/Makefile.in
config.status: executing depfiles commands
config.status: executing default commands
make[4]: Leaving directory
`/arm/src/buildroot/toolchain_build_arm_nofpu/binutils-2.17-build/bfd/po'
make[4]: Entering directory
`/arm/src/buildroot/toolchain_build_arm_nofpu/binutils-2.17-build/bfd/po'
make[4]: Nothing to be done for `info'.
make[4]: Leaving directory
`/arm/src/buildroot/toolchain_build_arm_nofpu/binutils-2.17-build/bfd/po'
make[4]: Entering directory
`/arm/src/buildroot/toolchain_build_arm_nofpu/binutils-2.17-build/bfd'
make[4]: Nothing to be done for `info-am'.
make[4]: Leaving directory
`/arm/src/buildroot/toolchain_build_arm_nofpu/binutils-2.17-build/bfd'
make[3]: *** [info-recursive] ?? 1
make[3]: Leaving directory
`/arm/src/buildroot/toolchain_build_arm_nofpu/binutils-2.17-build/bfd'
make[2]: *** [all-bfd] ?? 2
make[2]: Leaving directory
`/arm/src/buildroot/toolchain_build_arm_nofpu/binutils-2.17-build'
make[1]: *** [all] ?? 2
make[1]: Leaving directory
`/arm/src/buildroot/toolchain_build_arm_nofpu/binutils-2.17-build'
make: *** [/arm/src/buildroot/toolchain_build_arm_nofpu/binutils-2.17-build/binutils/objdump]
?? 2
