From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 23 Jan 2021 21:26:45 +0100
Subject: [Buildroot] [git commit] package/perl-http-cookies: bump to version
 6.10
Message-ID: <20210123200715.B6BFF811F8@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=4c7d9bda77ba270a94231ef87d5647feff4aea99
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/perl-http-cookies/perl-http-cookies.hash | 4 ++--
 package/perl-http-cookies/perl-http-cookies.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/perl-http-cookies/perl-http-cookies.hash b/package/perl-http-cookies/perl-http-cookies.hash
index 0e812c6192..15d9e7a86f 100644
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
index 1e63779b15..745fd10a7c 100644
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
