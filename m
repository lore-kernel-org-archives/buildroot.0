From: Benjamin Delagoutte <BDE@teamlog.com>
Date: Thu, 07 Sep 2006 11:13:18 +0200
Subject: [Buildroot] Buildroot not designed for stable uClibc
Message-ID: <1157620398.4012.12.camel@localhost>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

I noticed uClibc-0.9.28 asks on the command line for undefined configs
when building toolchain with Buildroot, because .config syntax has
changed since 0.9.28 version.

For instance, HAS_FPU was renamed to UCLIBC_HAS_FPU, BUILD_UCLIBC_LDSO
and DL_FINI_CRT_COMPAT were removed.

Is it not recommended to use latest uClibc stable release in Buildroot ?
May I fall into some caveheats ? What benefits can I expect using uClibc
snapshots ?

Thank you !

Benjamin
