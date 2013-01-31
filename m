From: spdawson at gmail.com <spdawson@gmail.com>
Date: Thu, 31 Jan 2013 08:16:04 +0000
Subject: [Buildroot] [PATCH] neard: bump version to 0.9
Message-ID: <1359620164-20343-1-git-send-email-spdawson@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Simon Dawson <spdawson@gmail.com>

Signed-off-by: Simon Dawson <spdawson@gmail.com>
---
 package/neard/neard.mk |    3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/package/neard/neard.mk b/package/neard/neard.mk
index 3c9dd7c..c3466e6 100644
--- a/package/neard/neard.mk
+++ b/package/neard/neard.mk
@@ -3,7 +3,8 @@
 # neard
 #
 #############################################################
-NEARD_VERSION = 0.8
+
+NEARD_VERSION = 0.9
 NEARD_SITE = $(BR2_KERNEL_MIRROR)/linux/network/nfc
 NEARD_LICENSE = GPLv2
 NEARD_LICENSE_FILES = COPYING
-- 
1.7.10.4
