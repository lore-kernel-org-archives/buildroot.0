From: Rahul Bedarkar <rahulbedarkar89@gmail.com>
Date: Mon, 17 Apr 2017 14:57:11 +0530
Subject: [Buildroot] [PATCH 2/4] sam-ba: use SPDX short identifier for
	license string
In-Reply-To: <1492421233-9868-1-git-send-email-rahulbedarkar89@gmail.com>
References: <1492421233-9868-1-git-send-email-rahulbedarkar89@gmail.com>
Message-ID: <1492421233-9868-2-git-send-email-rahulbedarkar89@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Rahul Bedarkar <rahulbedarkar89@gmail.com>
---
 package/sam-ba/sam-ba.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/sam-ba/sam-ba.mk b/package/sam-ba/sam-ba.mk
index 7fc65c0..43e061b 100644
--- a/package/sam-ba/sam-ba.mk
+++ b/package/sam-ba/sam-ba.mk
@@ -8,7 +8,7 @@ SAM_BA_SITE = http://www.atmel.com/dyn/resources/prod_documents
 SAM_BA_VERSION = 2.16
 SAM_BA_SOURCE = sam-ba_$(SAM_BA_VERSION)_linux.zip
 SAM_BA_LICENSE = SAM-BA license (sam-ba executable), \
-		BSD-2c like, BSD-4c (TCL and applets code)
+		BSD-2-Clause like, BSD-4-Clause (TCL and applets code)
 SAM_BA_LICENSE_FILES = doc/license.txt tcl_lib/boards.tcl \
 		applets/sam4c/libraries/libchip_sam4c/include/sam4c/sam4c32e-1.h
 
-- 
2.7.4
