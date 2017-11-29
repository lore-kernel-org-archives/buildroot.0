From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 29 Nov 2017 17:36:10 +0100
Subject: [Buildroot] [PATCH] libmicrohttpd: bump to version 0.9.57
In-Reply-To: <b4ba276730ebca078748a2a3d6ce79a7eabc8e22.1511877292.git.baruch@tkos.co.il>
 (Baruch Siach's message of "Tue, 28 Nov 2017 15:54:52 +0200")
References: <b4ba276730ebca078748a2a3d6ce79a7eabc8e22.1511877292.git.baruch@tkos.co.il>
Message-ID: <87wp29kpol.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Baruch" == Baruch Siach <baruch@tkos.co.il> writes:

 > Drop libgcrypt dependency for SSL support; with newer version of gnutls
 > libgcrypt is not needed.

 > Drop the LIBS fix for static linking with gnutls that has been
 > introduced in commit 2d3d6d258bb (libmicrohttpd: fix static linking with
 > gnutls). gnutls does not support static linking anymore.

 > Fix a comment typo.

 > Add license hash.

 > Cc: Bernd Kuhls <bernd.kuhls@t-online.de>
 > Signed-off-by: Baruch Siach <baruch@tkos.co.il>

Committed to next, thanks.

-- 
Bye, Peter Korsgaard
