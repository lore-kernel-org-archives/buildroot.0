From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 27 Jul 2018 23:50:23 +0200
Subject: [Buildroot] [git commit] perl-crypt-blowfish: add missing license
 declaration
Message-ID: <20180727214915.3280D8A508@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=81f1a05b8a34cd894ee936105f6cdf3665e20fbd
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The license of this package is not standard, it is a combination of two
sets of statements coming from two different authors.

The license resembles the original 4-clause BSD license (thus including
advertising clause) but without the third clause about endorsement.
The label 'BSD-4-Clause-like' nevertheless seems the closest match.

Signed-off-by: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/perl-crypt-blowfish/perl-crypt-blowfish.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/perl-crypt-blowfish/perl-crypt-blowfish.mk b/package/perl-crypt-blowfish/perl-crypt-blowfish.mk
index f6644eb151..acb6d8af1d 100644
--- a/package/perl-crypt-blowfish/perl-crypt-blowfish.mk
+++ b/package/perl-crypt-blowfish/perl-crypt-blowfish.mk
@@ -7,6 +7,7 @@
 PERL_CRYPT_BLOWFISH_VERSION = 2.14
 PERL_CRYPT_BLOWFISH_SOURCE = Crypt-Blowfish-$(PERL_CRYPT_BLOWFISH_VERSION).tar.gz
 PERL_CRYPT_BLOWFISH_SITE = $(BR2_CPAN_MIRROR)/authors/id/D/DP/DPARIS
+PERL_CRYPT_BLOWFISH_LICENSE = BSD-4-Clause-like
 PERL_CRYPT_BLOWFISH_LICENSE_FILES = COPYRIGHT
 
 $(eval $(perl-package))
