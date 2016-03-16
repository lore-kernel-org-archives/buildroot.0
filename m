From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Wed, 16 Mar 2016 21:47:20 +0100
Subject: [Buildroot] [PATCH 1/1] package/tvheadend: bump version
Message-ID: <1458161240-10454-1-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes
http://autobuild.buildroot.net/results/4e4/4e403fa4aba6196ddc362cfe9c1e37743fa3cede/

and other atomic-related build errors by this upstream commit:
https://github.com/tvheadend/tvheadend/commit/f0472eebaa539c61e958432cded2b7cac41f758f

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/tvheadend/tvheadend.hash | 2 +-
 package/tvheadend/tvheadend.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/tvheadend/tvheadend.hash b/package/tvheadend/tvheadend.hash
index 5737c2f..14d0fb0 100644
--- a/package/tvheadend/tvheadend.hash
+++ b/package/tvheadend/tvheadend.hash
@@ -1,2 +1,2 @@
 # Locally computed
-sha256	5e59b2659badfe921fc324162dbfbfb69da8fe7eac21478651287fd56784ab11	tvheadend-3927788bb71ad0041a00d0daa35fae1cb6355b55.tar.gz
+sha256	9f25c79247ba59a6eb9ff8b9843b2e6cbc2702fa339a0ed89d24beb9017066e3	tvheadend-7adea4a102475fbeb0267a9ab160e1e0644f11c2.tar.gz
diff --git a/package/tvheadend/tvheadend.mk b/package/tvheadend/tvheadend.mk
index 40d8c6e..3398faf 100644
--- a/package/tvheadend/tvheadend.mk
+++ b/package/tvheadend/tvheadend.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-TVHEADEND_VERSION = 3927788bb71ad0041a00d0daa35fae1cb6355b55
+TVHEADEND_VERSION = 7adea4a102475fbeb0267a9ab160e1e0644f11c2
 TVHEADEND_SITE = $(call github,tvheadend,tvheadend,$(TVHEADEND_VERSION))
 TVHEADEND_LICENSE = GPLv3+
 TVHEADEND_LICENSE_FILES = LICENSE.md
-- 
2.7.0
