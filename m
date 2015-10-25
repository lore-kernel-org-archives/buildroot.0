From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 25 Oct 2015 22:00:18 +0100
Subject: [Buildroot] [git commit] perl-net-http: bump to version 6.09
Message-ID: <20151025210816.62E2F818C6@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=44e883c30c9b9974415d031e261560c4dbff8fb5
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/perl-net-http/perl-net-http.hash |    4 ++--
 package/perl-net-http/perl-net-http.mk   |    4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/perl-net-http/perl-net-http.hash b/package/perl-net-http/perl-net-http.hash
index 9f5f11b..79f43c5 100644
--- a/package/perl-net-http/perl-net-http.hash
+++ b/package/perl-net-http/perl-net-http.hash
@@ -1,3 +1,3 @@
 # retrieved by scancpan from http://cpan.metacpan.org/
-md5    b6da691523456089d7a812ac398bc77e Net-HTTP-6.07.tar.gz
-sha256 9f31e0325a5a0930ad309fa019da9d208e57e236fb0598675ed883c820240364 Net-HTTP-6.07.tar.gz
+md5    3d84d17f64c7316d69e7eb7b4e292b9a Net-HTTP-6.09.tar.gz
+sha256 52762b939d84806908ba544581c5708375f7938c3c0e496c128ca3fbc425e58d Net-HTTP-6.09.tar.gz
diff --git a/package/perl-net-http/perl-net-http.mk b/package/perl-net-http/perl-net-http.mk
index a73dfec..9dbc4ab 100644
--- a/package/perl-net-http/perl-net-http.mk
+++ b/package/perl-net-http/perl-net-http.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PERL_NET_HTTP_VERSION = 6.07
+PERL_NET_HTTP_VERSION = 6.09
 PERL_NET_HTTP_SOURCE = Net-HTTP-$(PERL_NET_HTTP_VERSION).tar.gz
-PERL_NET_HTTP_SITE = $(BR2_CPAN_MIRROR)/authors/id/M/MS/MSCHILLI
+PERL_NET_HTTP_SITE = $(BR2_CPAN_MIRROR)/authors/id/E/ET/ETHER
 PERL_NET_HTTP_DEPENDENCIES = perl-uri
 PERL_NET_HTTP_LICENSE = Artistic or GPLv1+
 PERL_NET_HTTP_LICENSE_FILES = README
