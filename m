From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 5 Dec 2020 14:38:57 +0100
Subject: [Buildroot] [git commit] package/perl-http-cookies: bump to version
 6.09
Message-ID: <20201205132743.5A7D17FCEB@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=4db3fa2d4cb3d6c400badd73bada0c83e87eb507
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

diff LICENSE:
-This software is Copyright (c) 2002-2019 by Gisle Aas.
+This software is Copyright (c) 2002 by Gisle Aas.

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/perl-http-cookies/perl-http-cookies.hash | 6 +++---
 package/perl-http-cookies/perl-http-cookies.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/perl-http-cookies/perl-http-cookies.hash b/package/perl-http-cookies/perl-http-cookies.hash
index 4099ce707f..0e812c6192 100644
--- a/package/perl-http-cookies/perl-http-cookies.hash
+++ b/package/perl-http-cookies/perl-http-cookies.hash
@@ -1,6 +1,6 @@
 # retrieved by scancpan from http://cpan.metacpan.org/
-md5    8c663710244e70c85775393a8f5be443 HTTP-Cookies-6.08.tar.gz
-sha256 49ebb73576eb41063c04bc079477df094496deec805ae033f3be338c23c3af59 HTTP-Cookies-6.08.tar.gz
+md5  ac30af9aa9715f1d64826a7e99721613  HTTP-Cookies-6.09.tar.gz
+sha256  903f017afaa5b78599cc90efc14ecccc8cc2ebfb636eb8c02f8f16ba861d1fe0  HTTP-Cookies-6.09.tar.gz
 
 # computed by scancpan
-sha256 5204690d6efb272e6fde7c3e3b8aba5114e1458b706710eaf607041ac080344d LICENSE
+sha256  82902ce20c8ed71d7f4e7a6a5b2b26e43a7e2e90c78098fb49aa49e03ac808e0  LICENSE
diff --git a/package/perl-http-cookies/perl-http-cookies.mk b/package/perl-http-cookies/perl-http-cookies.mk
index 6f802d6447..1e63779b15 100644
--- a/package/perl-http-cookies/perl-http-cookies.mk
+++ b/package/perl-http-cookies/perl-http-cookies.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PERL_HTTP_COOKIES_VERSION = 6.08
+PERL_HTTP_COOKIES_VERSION = 6.09
 PERL_HTTP_COOKIES_SOURCE = HTTP-Cookies-$(PERL_HTTP_COOKIES_VERSION).tar.gz
 PERL_HTTP_COOKIES_SITE = $(BR2_CPAN_MIRROR)/authors/id/O/OA/OALDERS
 PERL_HTTP_COOKIES_LICENSE = Artistic or GPL-1.0+
