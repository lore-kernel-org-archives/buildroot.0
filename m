From: Rahul Bedarkar <rahul.bedarkar@imgtec.com>
Date: Thu, 15 Dec 2016 17:10:41 +0530
Subject: [Buildroot] [PATCH 2/2] tinyalsa: add license files
In-Reply-To: <1481802041-2365-1-git-send-email-rahul.bedarkar@imgtec.com>
References: <1481802041-2365-1-git-send-email-rahul.bedarkar@imgtec.com>
Message-ID: <1481802041-2365-2-git-send-email-rahul.bedarkar@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Rahul Bedarkar <rahul.bedarkar@imgtec.com>
---
 package/tinyalsa/tinyalsa.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/tinyalsa/tinyalsa.mk b/package/tinyalsa/tinyalsa.mk
index 0edb0bc..d44155f 100644
--- a/package/tinyalsa/tinyalsa.mk
+++ b/package/tinyalsa/tinyalsa.mk
@@ -7,6 +7,7 @@
 TINYALSA_VERSION = 1.1.0
 TINYALSA_SITE = $(call github,tinyalsa,tinyalsa,$(TINYALSA_VERSION))
 TINYALSA_LICENSE = BSD-3c
+TINYALSA_LICENSE_FILES = NOTICE
 TINYALSA_INSTALL_STAGING = YES
 
 define TINYALSA_BUILD_CMDS
-- 
2.6.2
