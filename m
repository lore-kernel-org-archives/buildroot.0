From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sun, 31 Aug 2014 23:26:28 +0200
Subject: [Buildroot] [PATCH v2 4/9] package/libplist: fix static link
In-Reply-To: <1409514922-9509-5-git-send-email-s.martin49@gmail.com> (Samuel
 Martin's message of "Sun, 31 Aug 2014 21:55:17 +0200")
References: <1409514922-9509-1-git-send-email-s.martin49@gmail.com>
 <1409514922-9509-5-git-send-email-s.martin49@gmail.com>
Message-ID: <87iol8mjuj.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Samuel" == Samuel Martin <s.martin49@gmail.com> writes:

 > - libplist depends on libm and optionnaly on zlib and libiconv (via
 >   libxml2), so add a patch fixing the build-system that way
 > - disable shared object build when BR2_PREFER_STATIC_LIB is set

 > Fixes:
 >   http://autobuild.buildroot.net/results/9a3/9a364e3d91634a2da2bc481da1dee0ad0e870941/

 > Signed-off-by: Samuel Martin <s.martin49@gmail.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
