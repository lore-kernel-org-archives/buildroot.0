From: Francois Perrad <fperrad@gmail.com>
Date: Thu, 23 Jul 2015 11:21:35 +0200
Subject: [Buildroot] [PATCH 1/2] orbit: bump to version 2.2.3
Message-ID: <1437643296-30113-1-git-send-email-francois.perrad@gadz.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 package/orbit/orbit.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/orbit/orbit.mk b/package/orbit/orbit.mk
index 7df7790..fa30f38 100644
--- a/package/orbit/orbit.mk
+++ b/package/orbit/orbit.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-ORBIT_VERSION_UPSTREAM = 2.2.1
+ORBIT_VERSION_UPSTREAM = 2.2.3
 ORBIT_VERSION = $(ORBIT_VERSION_UPSTREAM)-1
 ORBIT_SUBDIR = orbit
 ORBIT_LICENSE = MIT
-- 
2.1.4
