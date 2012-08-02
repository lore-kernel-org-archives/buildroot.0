From: spdawson at gmail.com <spdawson@gmail.com>
Date: Thu,  2 Aug 2012 09:09:53 +0100
Subject: [Buildroot] [PATCH] sam-ba: bump version to 2.12
Message-ID: <1343894993-3603-1-git-send-email-spdawson@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Simon Dawson <spdawson@gmail.com>

Signed-off-by: Simon Dawson <spdawson@gmail.com>
---
 package/sam-ba/sam-ba.mk |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/sam-ba/sam-ba.mk b/package/sam-ba/sam-ba.mk
index 9f39347..067bdf1 100644
--- a/package/sam-ba/sam-ba.mk
+++ b/package/sam-ba/sam-ba.mk
@@ -1,5 +1,5 @@
 SAM_BA_SITE    = http://www.atmel.com/dyn/resources/prod_documents/
-SAM_BA_VERSION = 2.11
+SAM_BA_VERSION = 2.12
 SAM_BA_SOURCE  = sam-ba_$(SAM_BA_VERSION).zip
 
 define HOST_SAM_BA_EXTRACT_CMDS
-- 
1.7.9.5
