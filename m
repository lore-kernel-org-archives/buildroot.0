From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 20 Jan 2017 20:33:09 +0100
Subject: [Buildroot] [git commit] perl-net-http: bump to version 6.12
Message-ID: <20170120194046.A2D1280DB7@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=9506e4f908988a6811772dbc8460d344e7dcb494
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/perl-net-http/Config.in          | 4 ++--
 package/perl-net-http/perl-net-http.hash | 4 ++--
 package/perl-net-http/perl-net-http.mk   | 6 +++---
 3 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/package/perl-net-http/Config.in b/package/perl-net-http/Config.in
index 6f18dd5..6321577 100644
--- a/package/perl-net-http/Config.in
+++ b/package/perl-net-http/Config.in
@@ -2,6 +2,6 @@ config BR2_PACKAGE_PERL_NET_HTTP
 	bool "perl-net-http"
 	select BR2_PACKAGE_PERL_URI
 	help
-	  The `Net::HTTP' class is a low-level HTTP client.
+	  Low-level HTTP connection (client)
 
-	  http://github.com/libwww-perl/net-http
+	  https://github.com/libwww-perl/Net-HTTP
diff --git a/package/perl-net-http/perl-net-http.hash b/package/perl-net-http/perl-net-http.hash
index 79f43c5..4dfad86 100644
--- a/package/perl-net-http/perl-net-http.hash
+++ b/package/perl-net-http/perl-net-http.hash
@@ -1,3 +1,3 @@
 # retrieved by scancpan from http://cpan.metacpan.org/
-md5    3d84d17f64c7316d69e7eb7b4e292b9a Net-HTTP-6.09.tar.gz
-sha256 52762b939d84806908ba544581c5708375f7938c3c0e496c128ca3fbc425e58d Net-HTTP-6.09.tar.gz
+md5    988c72ce2890df56e41df6695d108e5d Net-HTTP-6.12.tar.gz
+sha256 8565aff76b3d09084642f3a83c654fb4ced8220e8e19d35c78b661519b4c1be6 Net-HTTP-6.12.tar.gz
diff --git a/package/perl-net-http/perl-net-http.mk b/package/perl-net-http/perl-net-http.mk
index 9dbc4ab..ec74a3f 100644
--- a/package/perl-net-http/perl-net-http.mk
+++ b/package/perl-net-http/perl-net-http.mk
@@ -4,11 +4,11 @@
 #
 ################################################################################
 
-PERL_NET_HTTP_VERSION = 6.09
+PERL_NET_HTTP_VERSION = 6.12
 PERL_NET_HTTP_SOURCE = Net-HTTP-$(PERL_NET_HTTP_VERSION).tar.gz
-PERL_NET_HTTP_SITE = $(BR2_CPAN_MIRROR)/authors/id/E/ET/ETHER
+PERL_NET_HTTP_SITE = $(BR2_CPAN_MIRROR)/authors/id/O/OA/OALDERS
 PERL_NET_HTTP_DEPENDENCIES = perl-uri
 PERL_NET_HTTP_LICENSE = Artistic or GPLv1+
-PERL_NET_HTTP_LICENSE_FILES = README
+PERL_NET_HTTP_LICENSE_FILES = LICENSE
 
 $(eval $(perl-package))
