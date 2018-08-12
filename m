From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun, 12 Aug 2018 20:10:34 +0200
Subject: [Buildroot] [PATCH/next 2/2] package/gcc: fix build of
 gcc-7.3.0 with glibc-2.28
References: <20180812172909.21450-1-bernd.kuhls@t-online.de>
 <20180812172909.21450-2-bernd.kuhls@t-online.de>
 <20180812194851.37f58885@windsurf>
Message-ID: <qp964fxkpu.ln2@ID-313208.user.individual.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

Am Sun, 12 Aug 2018 19:48:51 +0200 schrieb Thomas Petazzoni:

> What about the older gcc versions we support ?

upstream has no patches for these versions:

> 4.9.4

https://gcc.gnu.org/git/?p=gcc.git;a=history;f=libsanitizer/sanitizer_common/sanitizer_platform_limits_posix.cc;h=196eb3b3c6458b30c2b1a47e0d5ef514b3063044;hb=refs/heads/gcc-4_9-branch

> 5.5.0

https://gcc.gnu.org/git/?p=gcc.git;a=history;f=libsanitizer/sanitizer_common/sanitizer_platform_limits_posix.cc;h=0d5b11f6e15f55a3193ced0f329461c9b9633185;hb=refs/heads/gcc-5-branch

> 6.4.0

https://gcc.gnu.org/git/?p=gcc.git;a=history;f=libsanitizer/sanitizer_common/sanitizer_platform_limits_posix.cc;h=6992f2cd8ac56bcd5102f7440d71137b4458871d;hb=refs/heads/gcc-6-branch

> or1k-musl-5.4.0-20170218

Could not find an upstream branch at gcc.gnu.org.

Regards, Bernd
