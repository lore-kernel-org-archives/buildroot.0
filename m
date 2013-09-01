From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun,  1 Sep 2013 16:01:43 +0200
Subject: [Buildroot] [PATCH] orbit: fix ORBIT_LICENSE_FILES
Message-ID: <1378044103-29830-1-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes:

  http://autobuild.buildroot.org/results/33e/33e4e65301679e46cd80a1a123f45647376e60ce/

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/orbit/orbit.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/orbit/orbit.mk b/package/orbit/orbit.mk
index af5f0af..ba1142f 100644
--- a/package/orbit/orbit.mk
+++ b/package/orbit/orbit.mk
@@ -7,7 +7,7 @@
 ORBIT_VERSION = 2.2.0
 ORBIT_SITE = http://github.com/downloads/keplerproject/orbit
 ORBIT_LICENSE = MIT
-ORBIT_LICENSE_FILES = COPYRIGHT
+ORBIT_LICENSE_FILES = doc/us/license.md
 
 define ORBIT_INSTALL_TARGET_CMDS
 	$(MAKE) -C $(@D) \
-- 
1.8.1.2
