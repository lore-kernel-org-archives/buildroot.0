From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 28 Jul 2010 00:11:36 -0700
Subject: [Buildroot] [PATCH 0/3] Add support for uclibc NPTL toolchain.
Message-ID: <1280301099-5930-1-git-send-email-raj.khem@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi

The following set of patches is a revised list of nptl build
sequence support in BR internal toolchain.

First patch includes the patch suggested by Peter to have
proper dependency on gcc-intermediate and it is rebased on
current master.

second patch lets uclibc compile in new sequence.
0.9.28.x should not use gcc newer than 4.2.x it will
not build

Third patch lets gcc 4.2.4 compile for arm architecture
as BR uses --with-abi option.

I can build toolchains with following combos

0.9.28.3+gcc 4.2.4 
0.9.29+gcc 4.2.4
uclibc-snapshot/nptl + gcc 4.4.4

Please apply if ok

Thanks
-Khem
