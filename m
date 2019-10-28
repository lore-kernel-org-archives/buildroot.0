From: Francois Perrad <fperrad@gmail.com>
Date: Mon, 28 Oct 2019 20:25:13 +0100
Subject: [Buildroot] [PATCH 1/8] package/perl-http-cookies: bump to version
 6.05
Message-ID: <20191028192520.8656-1-francois.perrad@gadz.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 package/perl-http-cookies/Config.in              | 2 +-
 package/perl-http-cookies/perl-http-cookies.hash | 4 ++--
 package/perl-http-cookies/perl-http-cookies.mk   | 2 +-
 3 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/perl-http-cookies/Config.in b/package/perl-http-cookies/Config.in
index fd869f064..3ca461bf8 100644
--- a/package/perl-http-cookies/Config.in
+++ b/package/perl-http-cookies/Config.in
@@ -5,4 +5,4 @@ config BR2_PACKAGE_PERL_HTTP_COOKIES
 	help
 	  HTTP cookie jars.
 
-	  https://github.com/libwww-perl/http-cookies
+	  https://github.com/libwww-perl/HTTP-Cookies
diff --git a/package/perl-http-cookies/perl-http-cookies.hash b/package/perl-http-cookies/perl-http-cookies.hash
index e504063fa..7cf83bffe 100644
--- a/package/perl-http-cookies/perl-http-cookies.hash
+++ b/package/perl-http-cookies/perl-http-cookies.hash
@@ -1,6 +1,6 @@
 # retrieved by scancpan from http://cpan.metacpan.org/
-md5    7bf1e277bd5c886bc18d21eb8423b65f HTTP-Cookies-6.04.tar.gz
-sha256 0cc7f079079dcad8293fea36875ef58dd1bfd75ce1a6c244cd73ed9523eb13d4 HTTP-Cookies-6.04.tar.gz
+md5    e9dfe58dc6a1044a7e1c07a440cd043d HTTP-Cookies-6.05.tar.gz
+sha256 58e1cd041bfcf33c2ab4140de7a757234809b8cf072afa727a6f3ffe84b66f5d HTTP-Cookies-6.05.tar.gz
 
 # computed by scancpan
 sha256 f67a84709b8757e38e389ea9ab7cdef424d2b7cf999a92556ffd0b61ff87600d LICENSE
diff --git a/package/perl-http-cookies/perl-http-cookies.mk b/package/perl-http-cookies/perl-http-cookies.mk
index 74ffe8f42..ee5ad9271 100644
--- a/package/perl-http-cookies/perl-http-cookies.mk
+++ b/package/perl-http-cookies/perl-http-cookies.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PERL_HTTP_COOKIES_VERSION = 6.04
+PERL_HTTP_COOKIES_VERSION = 6.05
 PERL_HTTP_COOKIES_SOURCE = HTTP-Cookies-$(PERL_HTTP_COOKIES_VERSION).tar.gz
 PERL_HTTP_COOKIES_SITE = $(BR2_CPAN_MIRROR)/authors/id/O/OA/OALDERS
 PERL_HTTP_COOKIES_LICENSE = Artistic or GPL-1.0+
-- 
2.20.1
