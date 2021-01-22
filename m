From: Francois Perrad <fperrad@gmail.com>
Date: Fri, 22 Jan 2021 19:30:11 +0100
Subject: [Buildroot] [PATCH 01/10] package/perl-http-cookies: bump to
 version 6.10
Message-ID: <20210122183020.874889-1-francois.perrad@gadz.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 package/perl-http-cookies/perl-http-cookies.hash | 4 ++--
 package/perl-http-cookies/perl-http-cookies.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/perl-http-cookies/perl-http-cookies.hash b/package/perl-http-cookies/perl-http-cookies.hash
index 0e812c619..15d9e7a86 100644
--- a/package/perl-http-cookies/perl-http-cookies.hash
+++ b/package/perl-http-cookies/perl-http-cookies.hash
@@ -1,6 +1,6 @@
 # retrieved by scancpan from http://cpan.metacpan.org/
-md5  ac30af9aa9715f1d64826a7e99721613  HTTP-Cookies-6.09.tar.gz
-sha256  903f017afaa5b78599cc90efc14ecccc8cc2ebfb636eb8c02f8f16ba861d1fe0  HTTP-Cookies-6.09.tar.gz
+md5  b4d7804231b1dfd10999d42283e0cf06  HTTP-Cookies-6.10.tar.gz
+sha256  e36f36633c5ce6b5e4b876ffcf74787cc5efe0736dd7f487bdd73c14f0bd7007  HTTP-Cookies-6.10.tar.gz
 
 # computed by scancpan
 sha256  82902ce20c8ed71d7f4e7a6a5b2b26e43a7e2e90c78098fb49aa49e03ac808e0  LICENSE
diff --git a/package/perl-http-cookies/perl-http-cookies.mk b/package/perl-http-cookies/perl-http-cookies.mk
index 1e63779b1..745fd10a7 100644
--- a/package/perl-http-cookies/perl-http-cookies.mk
+++ b/package/perl-http-cookies/perl-http-cookies.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PERL_HTTP_COOKIES_VERSION = 6.09
+PERL_HTTP_COOKIES_VERSION = 6.10
 PERL_HTTP_COOKIES_SOURCE = HTTP-Cookies-$(PERL_HTTP_COOKIES_VERSION).tar.gz
 PERL_HTTP_COOKIES_SITE = $(BR2_CPAN_MIRROR)/authors/id/O/OA/OALDERS
 PERL_HTTP_COOKIES_LICENSE = Artistic or GPL-1.0+
-- 
2.27.0
