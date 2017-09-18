From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 18 Sep 2017 09:44:58 +0200
Subject: [Buildroot] [PATCH] gd: security bump to version 2.2.5
In-Reply-To: <20170907144551.23275-1-peter@korsgaard.com> (Peter Korsgaard's
 message of "Thu, 7 Sep 2017 16:45:51 +0200")
References: <20170907144551.23275-1-peter@korsgaard.com>
Message-ID: <87zi9s30xx.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Peter" == Peter Korsgaard <peter@korsgaard.com> writes:

 > Fixes the following security issues:
 > CVE-2017-6362: Double-free in gdImagePngPtr()
 > CVE-2017-7890: Buffer over-read into uninitialized memory

 > Drop patches no more needed:

 > 0001-gdlib-config.patch: @LIBICONV@ is nowadays correct AC_SUBST'ed by
 > configure

 > 0002-gd_bmp-fix-build-with-uClibc.patch: upstream uses ceil() since
 > https://github.com/libgd/libgd/commit/6913dd3cd2a7c2914ad9622419f9343bfe956135

 > While we're at it, add a hash for the license file.

 > Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

Committed to 2017.02.x, thanks.

-- 
Bye, Peter Korsgaard
