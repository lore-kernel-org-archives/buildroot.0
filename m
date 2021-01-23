From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 23 Jan 2021 21:26:46 +0100
Subject: [Buildroot] [git commit] package/perl-uri: bump to version 5.06
Message-ID: <20210123200716.8D24880296@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=8ef5caae165d9e6604c2007a8b777ffebb0040c3
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/perl-uri/perl-uri.hash | 4 ++--
 package/perl-uri/perl-uri.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/perl-uri/perl-uri.hash b/package/perl-uri/perl-uri.hash
index 39f2f47653..c6cb7971f0 100644
--- a/package/perl-uri/perl-uri.hash
+++ b/package/perl-uri/perl-uri.hash
@@ -1,6 +1,6 @@
 # retrieved by scancpan from http://cpan.metacpan.org/
-md5  978454ba823a6908bad1c3c1804945d3  URI-5.05.tar.gz
-sha256  a5c113d2d02706d9fbdca6a86f290c5b05b2f86836d4e7fe1447f063261b79ec  URI-5.05.tar.gz
+md5  3dd176c522e9d39d88bcf1221fcd7ab2  URI-5.06.tar.gz
+sha256  68555c576763769be43340459b9db7e159378edcd7db6d7518e16efdabdeb0c1  URI-5.06.tar.gz
 
 # computed by scancpan
 sha256  65cd6f88516a30f56fd4e0080fb78ea69424fc89067470dc994e4abfba08664e  LICENSE
diff --git a/package/perl-uri/perl-uri.mk b/package/perl-uri/perl-uri.mk
index 1a4886590c..6eccb1b9bc 100644
--- a/package/perl-uri/perl-uri.mk
+++ b/package/perl-uri/perl-uri.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PERL_URI_VERSION = 5.05
+PERL_URI_VERSION = 5.06
 PERL_URI_SOURCE = URI-$(PERL_URI_VERSION).tar.gz
 PERL_URI_SITE = $(BR2_CPAN_MIRROR)/authors/id/O/OA/OALDERS
 PERL_URI_LICENSE = Artistic or GPL-1.0+
