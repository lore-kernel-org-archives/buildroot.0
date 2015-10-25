From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 25 Oct 2015 22:00:32 +0100
Subject: [Buildroot] [git commit] perl-uri: bump to version 1.69
Message-ID: <20151025210816.7C2F17FE27@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=ba6b7e78b2cfeabcc72f41822a2dcd850e00d88f
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/perl-uri/perl-uri.hash |    4 ++--
 package/perl-uri/perl-uri.mk   |    2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/perl-uri/perl-uri.hash b/package/perl-uri/perl-uri.hash
index ea8de44..c97555a 100644
--- a/package/perl-uri/perl-uri.hash
+++ b/package/perl-uri/perl-uri.hash
@@ -1,3 +1,3 @@
 # retrieved by scancpan from http://cpan.metacpan.org/
-md5    4a954ab8d79f831616ca817ba4b26cb9 URI-1.68.tar.gz
-sha256 c840d30f7657bfd4b2acbb311bd764232911cd3dc97e92415fbd0a242185c358 URI-1.68.tar.gz
+md5    3c56aee0300bce5a440ccbd558277ea0 URI-1.69.tar.gz
+sha256 b74b16ea626b6f8061821bb350674c638a98be1fc766eadb24fec6635998b42d URI-1.69.tar.gz
diff --git a/package/perl-uri/perl-uri.mk b/package/perl-uri/perl-uri.mk
index c51bb97..c80b582 100644
--- a/package/perl-uri/perl-uri.mk
+++ b/package/perl-uri/perl-uri.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PERL_URI_VERSION = 1.68
+PERL_URI_VERSION = 1.69
 PERL_URI_SOURCE = URI-$(PERL_URI_VERSION).tar.gz
 PERL_URI_SITE = $(BR2_CPAN_MIRROR)/authors/id/E/ET/ETHER
 PERL_URI_LICENSE = Artistic or GPLv1+
