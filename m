From: spdawson at gmail.com <spdawson@gmail.com>
Date: Wed, 27 Nov 2013 22:23:57 +0000
Subject: [Buildroot] [PATCH] sam-ba: patch to latest version
Message-ID: <1385591037-3398-1-git-send-email-spdawson@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Simon Dawson <spdawson@gmail.com>

Apply the latest Atmel patch for sam-ba version 2.12

Signed-off-by: Simon Dawson <spdawson@gmail.com>
---
 package/sam-ba/sam-ba.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/sam-ba/sam-ba.mk b/package/sam-ba/sam-ba.mk
index 8e24fa6..4dc0568 100644
--- a/package/sam-ba/sam-ba.mk
+++ b/package/sam-ba/sam-ba.mk
@@ -7,6 +7,7 @@
 SAM_BA_SITE    = http://www.atmel.com/dyn/resources/prod_documents/
 SAM_BA_VERSION = 2.12
 SAM_BA_SOURCE  = sam-ba_$(SAM_BA_VERSION).zip
+SAM_BA_PATCH = sam-ba_$(SAM_BA_VERSION)_patch5.gz
 SAM_BA_LICENSE = BSD-like (partly binary-only)
 SAM_BA_LICENSE_FILES = doc/readme.txt
 
-- 
1.8.3.2
