From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Mon, 4 Mar 2013 17:17:48 +0100
Subject: [Buildroot] [git commit] cpanminus: bump to version 1.6002
Message-ID: <20130304161740.554229AEAC@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=1def3f8843a91dd546bcd52aa27937406fc43497
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/cpanminus/cpanminus.mk |    6 +++---
 1 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/cpanminus/cpanminus.mk b/package/cpanminus/cpanminus.mk
index e7e3f29..7e7b47d 100644
--- a/package/cpanminus/cpanminus.mk
+++ b/package/cpanminus/cpanminus.mk
@@ -4,9 +4,9 @@
 #
 #############################################################
 
-CPANMINUS_VERSION = 1.5018
-CPANMINUS_SOURCE = miyagawa-cpanminus-$(CPANMINUS_VERSION)-0-gee6cd30.tar.gz
-CPANMINUS_SITE = https://github.com/miyagawa/cpanminus/tarball/$(CPANMINUS_VERSION)
+CPANMINUS_VERSION = 1.6002
+CPANMINUS_SOURCE = $(CPANMINUS_VERSION).tar.gz
+CPANMINUS_SITE = https://github.com/miyagawa/cpanminus/archive
 CPANMINUS_DEPENDENCIES = host-qemu perl $(call qstrip,$(BR2_PACKAGE_CPANMINUS_NATIVE_DEPENDENCIES))
 
 CPANMINUS_RUN_PERL = $(QEMU_USER) $(STAGING_DIR)/usr/bin/perl
