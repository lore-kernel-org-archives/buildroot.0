From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Mon, 10 Jun 2019 16:20:08 +0200
Subject: [Buildroot] [git commit] package/perl-cookie-baker: bump to version
 0.11
Message-ID: <20190610142045.814058F689@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=ccdb0e88dd4ddca12f225c52e818b5ad7c506ee4
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/perl-cookie-baker/perl-cookie-baker.hash | 4 ++--
 package/perl-cookie-baker/perl-cookie-baker.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/perl-cookie-baker/perl-cookie-baker.hash b/package/perl-cookie-baker/perl-cookie-baker.hash
index 8d0d63b174..3b056c46c8 100644
--- a/package/perl-cookie-baker/perl-cookie-baker.hash
+++ b/package/perl-cookie-baker/perl-cookie-baker.hash
@@ -1,6 +1,6 @@
 # retrieved by scancpan from http://cpan.metacpan.org/
-md5    20f6f16689df949db86645652c1ebe38 Cookie-Baker-0.10.tar.gz
-sha256 b42bad15b12da4cdc5c90c902faf3ad484281a42203fa4e7652866434f6fa4dd Cookie-Baker-0.10.tar.gz
+md5    bc8f95893d6ec3093a62d1957e1908f2 Cookie-Baker-0.11.tar.gz
+sha256 59275f474e07c0aa3611e3e684b894e7db913333d8214420be63f12ec18cd7ab Cookie-Baker-0.11.tar.gz
 
 # computed by scancpan
 sha256 b4ce94671fa219074d4e91e2268652d6bf9764cebcc7a5e27bfc14897745ca4c LICENSE
diff --git a/package/perl-cookie-baker/perl-cookie-baker.mk b/package/perl-cookie-baker/perl-cookie-baker.mk
index 45ecdc96c1..27c88f3e57 100644
--- a/package/perl-cookie-baker/perl-cookie-baker.mk
+++ b/package/perl-cookie-baker/perl-cookie-baker.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PERL_COOKIE_BAKER_VERSION = 0.10
+PERL_COOKIE_BAKER_VERSION = 0.11
 PERL_COOKIE_BAKER_SOURCE = Cookie-Baker-$(PERL_COOKIE_BAKER_VERSION).tar.gz
 PERL_COOKIE_BAKER_SITE = $(BR2_CPAN_MIRROR)/authors/id/K/KA/KAZEBURO
 PERL_COOKIE_BAKER_DEPENDENCIES = host-perl-module-build-tiny
