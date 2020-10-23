From: Francois Perrad <fperrad@gmail.com>
Date: Fri, 23 Oct 2020 22:07:25 +0200
Subject: [Buildroot] [PATCH 11/11] package/perl-uri: bump to version 5.05
In-Reply-To: <20201023200725.1407498-1-francois.perrad@gadz.org>
References: <20201023200725.1407498-1-francois.perrad@gadz.org>
Message-ID: <20201023200725.1407498-11-francois.perrad@gadz.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 package/perl-uri/perl-uri.hash | 6 +++---
 package/perl-uri/perl-uri.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/perl-uri/perl-uri.hash b/package/perl-uri/perl-uri.hash
index 02287a064..39f2f4765 100644
--- a/package/perl-uri/perl-uri.hash
+++ b/package/perl-uri/perl-uri.hash
@@ -1,6 +1,6 @@
 # retrieved by scancpan from http://cpan.metacpan.org/
-md5    c236e0142adecc1b1104da664bc43a79 URI-1.76.tar.gz
-sha256 b2c98e1d50d6f572483ee538a6f4ccc8d9185f91f0073fd8af7390898254413e URI-1.76.tar.gz
+md5  978454ba823a6908bad1c3c1804945d3  URI-5.05.tar.gz
+sha256  a5c113d2d02706d9fbdca6a86f290c5b05b2f86836d4e7fe1447f063261b79ec  URI-5.05.tar.gz
 
 # computed by scancpan
-sha256 65cd6f88516a30f56fd4e0080fb78ea69424fc89067470dc994e4abfba08664e LICENSE
+sha256  65cd6f88516a30f56fd4e0080fb78ea69424fc89067470dc994e4abfba08664e  LICENSE
diff --git a/package/perl-uri/perl-uri.mk b/package/perl-uri/perl-uri.mk
index 730b39052..1a4886590 100644
--- a/package/perl-uri/perl-uri.mk
+++ b/package/perl-uri/perl-uri.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PERL_URI_VERSION = 1.76
+PERL_URI_VERSION = 5.05
 PERL_URI_SOURCE = URI-$(PERL_URI_VERSION).tar.gz
 PERL_URI_SITE = $(BR2_CPAN_MIRROR)/authors/id/O/OA/OALDERS
 PERL_URI_LICENSE = Artistic or GPL-1.0+
-- 
2.25.1
