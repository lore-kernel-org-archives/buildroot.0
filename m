From: Bernhard Fischer <rep.dot.nop@gmail.com>
Date: Mon, 30 Apr 2007 14:54:00 +0200
Subject: [Buildroot] Failed to build the toolchain for ARM7TDMI
In-Reply-To: <bc56c6d90704251843l7a0d278cn2ee437e77afefe2f@mail.gmail.com>
References: <bc56c6d90704251843l7a0d278cn2ee437e77afefe2f@mail.gmail.com>
Message-ID: <20070430125400.GB18543@aon.at>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, Apr 26, 2007 at 09:43:16AM +0800, ???? wrote:
>Can anybody tell me what should I do,thx.  The following info was
>displayed in terminal:
>
>config.status: creating po/Makefile.in
>config.status: executing depfiles commands
>config.status: executing default commands
>make[4]: Leaving directory
>`/arm/src/buildroot/toolchain_build_arm_nofpu/binutils-2.17-build/bfd/po'
>make[4]: Entering directory
>`/arm/src/buildroot/toolchain_build_arm_nofpu/binutils-2.17-build/bfd/po'
>make[4]: Nothing to be done for `info'.
>make[4]: Leaving directory
>`/arm/src/buildroot/toolchain_build_arm_nofpu/binutils-2.17-build/bfd/po'
>make[4]: Entering directory
>`/arm/src/buildroot/toolchain_build_arm_nofpu/binutils-2.17-build/bfd'
>make[4]: Nothing to be done for `info-am'.
>make[4]: Leaving directory
>`/arm/src/buildroot/toolchain_build_arm_nofpu/binutils-2.17-build/bfd'
>make[3]: *** [info-recursive] ???? 1

An error should have been printed here. Do a
$ make binutils-clean binutils-dirclean
and paste the first error you get from running
$ make
afterwards.
