From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 05 Jan 2021 23:00:33 +0100
Subject: [Buildroot] [git commit] package/php: needs pcre2
In-Reply-To: <20210102205406.323BD817A8@busybox.osuosl.org> (Yann E. MORIN's
 message of "Sat, 2 Jan 2021 22:07:40 +0100")
References: <20210102205406.323BD817A8@busybox.osuosl.org>
Message-ID: <87mtxn59j2.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:

 > commit: https://git.buildroot.net/buildroot/commit/?id=fabb1243ab02dbeb6677a74e02a71b3d05b66f3a
 > branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

 > Since 2008 pcre is a hard-dependency of php:
 > https://github.com/php/php-src/commit/aa64c6727c2d33a647bdbd9769215044f7cf2967

 > Instead of optionally depending on the pcre2 package and building the
 > bundled pcre2 code of php in case BR2_PACKAGE_PCRE2 was not selected
 > we let php depend on pcre2.

 > While being at it rename the pcre-related configure option due to
 > upstream commit:
 > https://github.com/php/php-src/commit/c1a22f3d4e69cb87f8deeed7d03d9434e6901537

 > Fixes:
 > http://autobuild.buildroot.net/results/4a5/4a582af6b66c59a61b75a7047d8530202972ebdd/
 > because the pcre2 package already contains the fix for mips r6.

 > Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
 > [yann.morin.1998 at free.fr: keep the JIT option]
 > Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>

Committed to 2020.02.x and 2020.11.x, thanks.

-- 
Bye, Peter Korsgaard
