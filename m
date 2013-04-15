From: spdawson at gmail.com <spdawson@gmail.com>
Date: Mon, 15 Apr 2013 08:19:00 +0100
Subject: [Buildroot] [PATCH] sam-ba: add license information
Message-ID: <1366010340-10833-1-git-send-email-spdawson@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Simon Dawson <spdawson@gmail.com>

Signed-off-by: Simon Dawson <spdawson@gmail.com>
---
 package/sam-ba/sam-ba.mk |    8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/package/sam-ba/sam-ba.mk b/package/sam-ba/sam-ba.mk
index 067bdf1..da41897 100644
--- a/package/sam-ba/sam-ba.mk
+++ b/package/sam-ba/sam-ba.mk
@@ -1,6 +1,14 @@
+#############################################################
+#
+# sam-ba
+#
+#############################################################
+
 SAM_BA_SITE    = http://www.atmel.com/dyn/resources/prod_documents/
 SAM_BA_VERSION = 2.12
 SAM_BA_SOURCE  = sam-ba_$(SAM_BA_VERSION).zip
+SAM_BA_LICENSE = BSD-like
+SAM_BA_LICENSE_FILES = doc/readme.txt
 
 define HOST_SAM_BA_EXTRACT_CMDS
         unzip -d $(BUILD_DIR) $(DL_DIR)/$(SAM_BA_SOURCE)
-- 
1.7.10.4
