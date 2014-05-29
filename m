From: Peter Korsgaard <jacmet@uclibc.org>
Date: Thu, 29 May 2014 23:18:15 +0200
Subject: [Buildroot] [PATCH] libfribidi: depend on host-pkgconf
In-Reply-To: <e29e05429fd22afb4a69057e36d7e26402845764.1401333533.git.baruch@tkos.co.il>
 (Baruch Siach's message of "Thu, 29 May 2014 06:18:53 +0300")
References: <e29e05429fd22afb4a69057e36d7e26402845764.1401333533.git.baruch@tkos.co.il>
Message-ID: <87zji08eso.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Baruch" == Baruch Siach <baruch@tkos.co.il> writes:

 > libfribidi needs macros from pkgconf to generate its configure script. Since
 > commit 5693f236a2a0 (libfribidi: bump version) we AUTORECONF, so host-pkgconf
 > is also needed.

 > Fixes:
 > http://autobuild.buildroot.net/results/5d7/5d76a8333fb05e903460ad51dc0737c18431d033/

 > Signed-off-by: Baruch Siach <baruch@tkos.co.il>

Committed, thanks.

-- 
Bye, Peter Korsgaard
