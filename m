From: Francois Perrad <fperrad@gmail.com>
Date: Sat,  2 Mar 2013 11:39:00 +0100
Subject: [Buildroot] [PATCH 3/3] cpanminus: bump to version 1.6002
In-Reply-To: <1362220740-17593-1-git-send-email-francois.perrad@gadz.org>
References: <1362220740-17593-1-git-send-email-francois.perrad@gadz.org>
Message-ID: <1362220740-17593-3-git-send-email-francois.perrad@gadz.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 package/cpanminus/cpanminus.mk |    6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/cpanminus/cpanminus.mk b/package/cpanminus/cpanminus.mk
index f815199..cb3c0d7 100644
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
-- 
1.7.9.5
