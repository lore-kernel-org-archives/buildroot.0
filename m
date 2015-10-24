From: Francois Perrad <fperrad@gmail.com>
Date: Sat, 24 Oct 2015 18:26:57 +0200
Subject: [Buildroot] [PATCH 10/11] perl-uri: bump to version 1.69
In-Reply-To: <1445704018-9780-1-git-send-email-francois.perrad@gadz.org>
References: <1445704018-9780-1-git-send-email-francois.perrad@gadz.org>
Message-ID: <1445704018-9780-10-git-send-email-francois.perrad@gadz.org>
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
index ea8de44..c97555a 100644
--- a/package/perl-uri/perl-uri.hash
+++ b/package/perl-uri/perl-uri.hash
@@ -1,3 +1,3 @@
 # retrieved by scancpan from http://cpan.metacpan.org/
-md5    4a954ab8d79f831616ca817ba4b26cb9 URI-1.68.tar.gz
-sha256 c840d30f7657bfd4b2acbb311bd764232911cd3dc97e92415fbd0a242185c358 URI-1.68.tar.gz
+md5    3c56aee0300bce5a440ccbd558277ea0 URI-1.69.tar.gz
+sha256 b74b16ea626b6f8061821bb350674c638a98be1fc766eadb24fec6635998b42d URI-1.69.tar.gz
diff --git a/package/perl-uri/perl-uri.mk b/package/perl-uri/perl-uri.mk
index c51bb97..c80b582 100644
--- a/package/perl-uri/perl-uri.mk
+++ b/package/perl-uri/perl-uri.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PERL_URI_VERSION = 1.68
+PERL_URI_VERSION = 1.69
 PERL_URI_SOURCE = URI-$(PERL_URI_VERSION).tar.gz
 PERL_URI_SITE = $(BR2_CPAN_MIRROR)/authors/id/E/ET/ETHER
 PERL_URI_LICENSE = Artistic or GPLv1+
-- 
2.5.0
