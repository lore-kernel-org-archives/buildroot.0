From: Francois Perrad <fperrad@gmail.com>
Date: Sat, 27 Apr 2019 09:05:18 +0200
Subject: [Buildroot] [PATCH 1/4] package/perl-http-headers-fast: bump to
 version 0.22
Message-ID: <20190427070521.27791-1-francois.perrad@gadz.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 package/perl-http-headers-fast/perl-http-headers-fast.hash | 4 ++--
 package/perl-http-headers-fast/perl-http-headers-fast.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/perl-http-headers-fast/perl-http-headers-fast.hash b/package/perl-http-headers-fast/perl-http-headers-fast.hash
index 0cba0f95a..9282f2ef1 100644
--- a/package/perl-http-headers-fast/perl-http-headers-fast.hash
+++ b/package/perl-http-headers-fast/perl-http-headers-fast.hash
@@ -1,6 +1,6 @@
 # retrieved by scancpan from http://cpan.metacpan.org/
-md5    024fde06808fc47db61a62655afacb41 HTTP-Headers-Fast-0.21.tar.gz
-sha256 5e68ed8e3e67531e1d43c6a2cdfd0ee2daddf2e5b94c1a2648f3a6500a6f12d5 HTTP-Headers-Fast-0.21.tar.gz
+md5    a166a4d0ba47eca8ff9dffb760865f5f HTTP-Headers-Fast-0.22.tar.gz
+sha256 cc431db68496dd884db4bc0c0b7112c1f4a4f1dc68c4f5a3caa757a1e7481b48 HTTP-Headers-Fast-0.22.tar.gz
 
 # computed by scancpan
 sha256 511724425acf76d736145cfbf7c775b024c70ae8674ebf9a24dfda2c8e4032a3 LICENSE
diff --git a/package/perl-http-headers-fast/perl-http-headers-fast.mk b/package/perl-http-headers-fast/perl-http-headers-fast.mk
index fadf06d5b..d7bff6f99 100644
--- a/package/perl-http-headers-fast/perl-http-headers-fast.mk
+++ b/package/perl-http-headers-fast/perl-http-headers-fast.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PERL_HTTP_HEADERS_FAST_VERSION = 0.21
+PERL_HTTP_HEADERS_FAST_VERSION = 0.22
 PERL_HTTP_HEADERS_FAST_SOURCE = HTTP-Headers-Fast-$(PERL_HTTP_HEADERS_FAST_VERSION).tar.gz
 PERL_HTTP_HEADERS_FAST_SITE = $(BR2_CPAN_MIRROR)/authors/id/T/TO/TOKUHIROM
 PERL_HTTP_HEADERS_FAST_DEPENDENCIES = host-perl-module-build-tiny
-- 
2.20.1
