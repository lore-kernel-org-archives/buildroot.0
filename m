From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 28 Jan 2016 22:29:31 +0100
Subject: [Buildroot] [git commit] package/perl-uri: bump version to 1.71
Message-ID: <20160201224659.83D3C7FAE2@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=c9f3ebc268b36281aea239ee6a7469c8303394b2
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/perl-uri/perl-uri.hash | 4 ++--
 package/perl-uri/perl-uri.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/perl-uri/perl-uri.hash b/package/perl-uri/perl-uri.hash
index c97555a..8a265bf 100644
--- a/package/perl-uri/perl-uri.hash
+++ b/package/perl-uri/perl-uri.hash
@@ -1,3 +1,3 @@
 # retrieved by scancpan from http://cpan.metacpan.org/
-md5    3c56aee0300bce5a440ccbd558277ea0 URI-1.69.tar.gz
-sha256 b74b16ea626b6f8061821bb350674c638a98be1fc766eadb24fec6635998b42d URI-1.69.tar.gz
+md5    247c3da29a794f72730e01aa5a715daf URI-1.71.tar.gz
+sha256 9c8eca0d7f39e74bbc14706293e653b699238eeb1a7690cc9c136fb8c2644115 URI-1.71.tar.gz
diff --git a/package/perl-uri/perl-uri.mk b/package/perl-uri/perl-uri.mk
index c80b582..e7118fc 100644
--- a/package/perl-uri/perl-uri.mk
+++ b/package/perl-uri/perl-uri.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PERL_URI_VERSION = 1.69
+PERL_URI_VERSION = 1.71
 PERL_URI_SOURCE = URI-$(PERL_URI_VERSION).tar.gz
 PERL_URI_SITE = $(BR2_CPAN_MIRROR)/authors/id/E/ET/ETHER
 PERL_URI_LICENSE = Artistic or GPLv1+
