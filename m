From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 08 Aug 2015 10:58:11 -0000
Subject: [Buildroot] [git commit branch/next] perl-encode-locale: bump to
	version 1.05
Message-ID: <20150808105640.7A48B818F0@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=6aae4794d7297447df73d472cfab5470fdfecf8c
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/perl-encode-locale/perl-encode-locale.hash |    4 ++--
 package/perl-encode-locale/perl-encode-locale.mk   |    2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/perl-encode-locale/perl-encode-locale.hash b/package/perl-encode-locale/perl-encode-locale.hash
index d1abef5..1b6a6bc 100644
--- a/package/perl-encode-locale/perl-encode-locale.hash
+++ b/package/perl-encode-locale/perl-encode-locale.hash
@@ -1,3 +1,3 @@
 # retrieved by scancpan from http://cpan.metacpan.org/
-md5    0565984b048732e4fd1315212f21d462 Encode-Locale-1.04.tar.gz
-sha256 33aca4aa35829bd5c8c5e64ebfde86d0a2e8cd59dac2c4de707ffe9dc10bfbd4 Encode-Locale-1.04.tar.gz
+md5    fcfdb8e4ee34bcf62aed429b4a23db27 Encode-Locale-1.05.tar.gz
+sha256 176fa02771f542a4efb1dbc2a4c928e8f4391bf4078473bd6040d8f11adb0ec1 Encode-Locale-1.05.tar.gz
diff --git a/package/perl-encode-locale/perl-encode-locale.mk b/package/perl-encode-locale/perl-encode-locale.mk
index fd7148e..be18589 100644
--- a/package/perl-encode-locale/perl-encode-locale.mk
+++ b/package/perl-encode-locale/perl-encode-locale.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PERL_ENCODE_LOCALE_VERSION = 1.04
+PERL_ENCODE_LOCALE_VERSION = 1.05
 PERL_ENCODE_LOCALE_SOURCE = Encode-Locale-$(PERL_ENCODE_LOCALE_VERSION).tar.gz
 PERL_ENCODE_LOCALE_SITE = $(BR2_CPAN_MIRROR)/authors/id/G/GA/GAAS
 PERL_ENCODE_LOCALE_DEPENDENCIES = perl
