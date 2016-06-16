From: Ludovic Desroches <ludovic.desroches@atmel.com>
Date: Thu, 16 Jun 2016 09:45:00 +0200
Subject: [Buildroot] [PATCH] sam-ba: bump to version 2.16
Message-ID: <20160616074500.14292-1-ludovic.desroches@atmel.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Update also the file name since the pattern has changed.

Signed-off-by: Ludovic Desroches <ludovic.desroches@atmel.com>
---
 package/sam-ba/sam-ba.mk | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/sam-ba/sam-ba.mk b/package/sam-ba/sam-ba.mk
index 2a3c2a1..aede615 100644
--- a/package/sam-ba/sam-ba.mk
+++ b/package/sam-ba/sam-ba.mk
@@ -5,8 +5,8 @@
 ################################################################################
 
 SAM_BA_SITE = http://www.atmel.com/dyn/resources/prod_documents
-SAM_BA_VERSION = 2.15
-SAM_BA_SOURCE = sam-ba_$(SAM_BA_VERSION).zip
+SAM_BA_VERSION = 2.16
+SAM_BA_SOURCE = sam-ba_$(SAM_BA_VERSION)_linux.zip
 SAM_BA_LICENSE = BSD-like (partly binary-only)
 SAM_BA_LICENSE_FILES = doc/readme.txt
 
-- 
2.9.0
