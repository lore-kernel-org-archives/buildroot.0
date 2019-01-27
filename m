From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 27 Jan 2019 11:23:07 +0100
Subject: [Buildroot] [git commit] perl-type-tiny: bump to version 1.004004
Message-ID: <20190127102332.8020A8E255@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=eaf2e397f177065643f41952d50d9831b8a831a4
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/perl-type-tiny/perl-type-tiny.hash | 8 ++++----
 package/perl-type-tiny/perl-type-tiny.mk   | 2 +-
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/perl-type-tiny/perl-type-tiny.hash b/package/perl-type-tiny/perl-type-tiny.hash
index a9e028f878..d6b3639dcf 100644
--- a/package/perl-type-tiny/perl-type-tiny.hash
+++ b/package/perl-type-tiny/perl-type-tiny.hash
@@ -1,7 +1,7 @@
 # retrieved by scancpan from http://cpan.metacpan.org/
-md5    fad12549fe5b904173e18a05e82e5166 Type-Tiny-1.004002.tar.gz
-sha256 e52c7e9593052aed157a15d473b5c25a1dbb3454bf3cd6913df94cc9bb2be707 Type-Tiny-1.004002.tar.gz
+md5    a7fe90a6d53d2cd57381e60e682f828f Type-Tiny-1.004004.tar.gz
+sha256 081281ea004cdd89003d938aa52c1398e24411dd8f7163b14d0977a13f7062be Type-Tiny-1.004004.tar.gz
 
 # computed by scancpan
-sha256 0caa5aef37fdb3eddc52419d193df594550c621b84f5990830482f9f8226adde COPYRIGHT
-sha256 c614dadb36b02257ab492e3d4341e52f3f03fe8147cafd2b7da03b3b5c0361e9 LICENSE
+sha256 57e58f271bf6bca0bb22ab9e72b04c9e12010b0a898453a2fcde49fb9ff28afc COPYRIGHT
+sha256 5c791221f0dde289392a38a5921b66d4a1be8248cc64ee6de15f3c2426892673 LICENSE
diff --git a/package/perl-type-tiny/perl-type-tiny.mk b/package/perl-type-tiny/perl-type-tiny.mk
index d3cdd28bd9..aa7306416b 100644
--- a/package/perl-type-tiny/perl-type-tiny.mk
+++ b/package/perl-type-tiny/perl-type-tiny.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PERL_TYPE_TINY_VERSION = 1.004002
+PERL_TYPE_TINY_VERSION = 1.004004
 PERL_TYPE_TINY_SOURCE = Type-Tiny-$(PERL_TYPE_TINY_VERSION).tar.gz
 PERL_TYPE_TINY_SITE = $(BR2_CPAN_MIRROR)/authors/id/T/TO/TOBYINK
 PERL_TYPE_TINY_LICENSE = Artistic or GPL-1.0+
