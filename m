From: Francois Perrad <fperrad@gmail.com>
Date: Sun, 20 Aug 2017 10:03:15 +0200
Subject: [Buildroot] [PATCH 02/18] perl-http-cookies: bump to version 6.04
In-Reply-To: <20170820080331.12935-1-francois.perrad@gadz.org>
References: <20170820080331.12935-1-francois.perrad@gadz.org>
Message-ID: <20170820080331.12935-2-francois.perrad@gadz.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 package/perl-http-cookies/Config.in              | 4 ++--
 package/perl-http-cookies/perl-http-cookies.hash | 4 ++--
 package/perl-http-cookies/perl-http-cookies.mk   | 6 +++---
 3 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/package/perl-http-cookies/Config.in b/package/perl-http-cookies/Config.in
index cb5a3c1fa..4095fee82 100644
--- a/package/perl-http-cookies/Config.in
+++ b/package/perl-http-cookies/Config.in
@@ -3,6 +3,6 @@ config BR2_PACKAGE_PERL_HTTP_COOKIES
 	select BR2_PACKAGE_PERL_HTTP_DATE
 	select BR2_PACKAGE_PERL_HTTP_MESSAGE
 	help
-	  Objects that represent a "cookie jar"
+	  HTTP cookie jars
 
-	  http://github.com/gisle/http-cookies
+	  https://github.com/libwww-perl/http-cookies
diff --git a/package/perl-http-cookies/perl-http-cookies.hash b/package/perl-http-cookies/perl-http-cookies.hash
index 94e5f31c2..361d4db92 100644
--- a/package/perl-http-cookies/perl-http-cookies.hash
+++ b/package/perl-http-cookies/perl-http-cookies.hash
@@ -1,3 +1,3 @@
 # retrieved by scancpan from http://cpan.metacpan.org/
-md5    ecfd0eeb88512033352c2f13c9580f03 HTTP-Cookies-6.01.tar.gz
-sha256 f5d3ade383ce6389d80cb0d0356b643af80435bb036afd8edce335215ec5eb20 HTTP-Cookies-6.01.tar.gz
+md5    7bf1e277bd5c886bc18d21eb8423b65f HTTP-Cookies-6.04.tar.gz
+sha256 0cc7f079079dcad8293fea36875ef58dd1bfd75ce1a6c244cd73ed9523eb13d4 HTTP-Cookies-6.04.tar.gz
diff --git a/package/perl-http-cookies/perl-http-cookies.mk b/package/perl-http-cookies/perl-http-cookies.mk
index a4ef552ef..0777c0845 100644
--- a/package/perl-http-cookies/perl-http-cookies.mk
+++ b/package/perl-http-cookies/perl-http-cookies.mk
@@ -4,11 +4,11 @@
 #
 ################################################################################
 
-PERL_HTTP_COOKIES_VERSION = 6.01
+PERL_HTTP_COOKIES_VERSION = 6.04
 PERL_HTTP_COOKIES_SOURCE = HTTP-Cookies-$(PERL_HTTP_COOKIES_VERSION).tar.gz
-PERL_HTTP_COOKIES_SITE = $(BR2_CPAN_MIRROR)/authors/id/G/GA/GAAS
+PERL_HTTP_COOKIES_SITE = $(BR2_CPAN_MIRROR)/authors/id/O/OA/OALDERS
 PERL_HTTP_COOKIES_DEPENDENCIES = perl-http-date perl-http-message
 PERL_HTTP_COOKIES_LICENSE = Artistic or GPL-1.0+
-PERL_HTTP_COOKIES_LICENSE_FILES = README
+PERL_HTTP_COOKIES_LICENSE_FILES = LICENSE
 
 $(eval $(perl-package))
-- 
2.11.0
