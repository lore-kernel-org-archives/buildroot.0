From: yegorslists at googlemail.com <yegorslists@googlemail.com>
Date: Wed, 16 Mar 2016 16:41:46 +0100
Subject: [Buildroot] [PATCH 1/4] mc: bump to version 4.8.16
Message-ID: <1458142909-26392-1-git-send-email-yegorslists@googlemail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Yegor Yefremov <yegorslists@googlemail.com>

Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
---
 package/mc/mc.hash | 4 ++--
 package/mc/mc.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/mc/mc.hash b/package/mc/mc.hash
index 810d144..a93432b 100644
--- a/package/mc/mc.hash
+++ b/package/mc/mc.hash
@@ -1,2 +1,2 @@
-# Hash from http://ftp.midnight-commander.org/mc-4.8.15.sha256:
-sha256  cf4e8f5dfe419830d56ca7e5f2495898e37ebcd05da1e47ff7041446c87fba16  mc-4.8.15.tar.xz
+# Hash from http://ftp.midnight-commander.org/mc-4.8.16.sha256:
+sha256  bbbcbe3097d3160f865d24aa38ff122f1c59752b5ef153ca4ade5ac0f82b7020  mc-4.8.16.tar.xz
diff --git a/package/mc/mc.mk b/package/mc/mc.mk
index eb4b104..05e5243 100644
--- a/package/mc/mc.mk
+++ b/package/mc/mc.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-MC_VERSION = 4.8.15
+MC_VERSION = 4.8.16
 MC_SOURCE = mc-$(MC_VERSION).tar.xz
 MC_SITE = http://ftp.midnight-commander.org
 MC_LICENSE = GPLv3+
-- 
2.7.0
