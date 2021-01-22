From: Francois Perrad <fperrad@gmail.com>
Date: Fri, 22 Jan 2021 19:30:19 +0100
Subject: [Buildroot] [PATCH 09/10] package/perl-uri: bump to version 5.06
In-Reply-To: <20210122183020.874889-1-francois.perrad@gadz.org>
References: <20210122183020.874889-1-francois.perrad@gadz.org>
Message-ID: <20210122183020.874889-9-francois.perrad@gadz.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 package/perl-uri/perl-uri.hash | 4 ++--
 package/perl-uri/perl-uri.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/perl-uri/perl-uri.hash b/package/perl-uri/perl-uri.hash
index 39f2f4765..c6cb7971f 100644
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
index 1a4886590..6eccb1b9b 100644
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
-- 
2.27.0
