From: Francois Perrad <fperrad@gmail.com>
Date: Wed,  4 Dec 2019 09:33:49 +0100
Subject: [Buildroot] [PATCH 7/8] package/perl-http-cookies: bump to version
 6.08
In-Reply-To: <20191204083351.6134-1-francois.perrad@gadz.org>
References: <20191204083351.6134-1-francois.perrad@gadz.org>
Message-ID: <20191204083351.6134-7-francois.perrad@gadz.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

years updated in LICENSE:
< This software is copyright (c) 2002-2017 by Gisle Aas.
> This software is copyright (c) 2002-2019 by Gisle Aas.

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 package/perl-http-cookies/perl-http-cookies.hash | 6 +++---
 package/perl-http-cookies/perl-http-cookies.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/perl-http-cookies/perl-http-cookies.hash b/package/perl-http-cookies/perl-http-cookies.hash
index 7cf83bffe..4099ce707 100644
--- a/package/perl-http-cookies/perl-http-cookies.hash
+++ b/package/perl-http-cookies/perl-http-cookies.hash
@@ -1,6 +1,6 @@
 # retrieved by scancpan from http://cpan.metacpan.org/
-md5    e9dfe58dc6a1044a7e1c07a440cd043d HTTP-Cookies-6.05.tar.gz
-sha256 58e1cd041bfcf33c2ab4140de7a757234809b8cf072afa727a6f3ffe84b66f5d HTTP-Cookies-6.05.tar.gz
+md5    8c663710244e70c85775393a8f5be443 HTTP-Cookies-6.08.tar.gz
+sha256 49ebb73576eb41063c04bc079477df094496deec805ae033f3be338c23c3af59 HTTP-Cookies-6.08.tar.gz
 
 # computed by scancpan
-sha256 f67a84709b8757e38e389ea9ab7cdef424d2b7cf999a92556ffd0b61ff87600d LICENSE
+sha256 5204690d6efb272e6fde7c3e3b8aba5114e1458b706710eaf607041ac080344d LICENSE
diff --git a/package/perl-http-cookies/perl-http-cookies.mk b/package/perl-http-cookies/perl-http-cookies.mk
index ee5ad9271..6f802d644 100644
--- a/package/perl-http-cookies/perl-http-cookies.mk
+++ b/package/perl-http-cookies/perl-http-cookies.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PERL_HTTP_COOKIES_VERSION = 6.05
+PERL_HTTP_COOKIES_VERSION = 6.08
 PERL_HTTP_COOKIES_SOURCE = HTTP-Cookies-$(PERL_HTTP_COOKIES_VERSION).tar.gz
 PERL_HTTP_COOKIES_SITE = $(BR2_CPAN_MIRROR)/authors/id/O/OA/OALDERS
 PERL_HTTP_COOKIES_LICENSE = Artistic or GPL-1.0+
-- 
2.20.1
