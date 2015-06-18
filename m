From: Yegor Yefremov <yegorslists@googlemail.com>
Date: Thu, 18 Jun 2015 18:50:12 +0200
Subject: [Buildroot] [PATCH] hdparm: bump to 9.48
Message-ID: <1434646212-1897-1-git-send-email-yegorslists@googlemail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
---
 package/hdparm/hdparm.hash | 4 ++--
 package/hdparm/hdparm.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/hdparm/hdparm.hash b/package/hdparm/hdparm.hash
index 12f8e07..7d70f0b 100644
--- a/package/hdparm/hdparm.hash
+++ b/package/hdparm/hdparm.hash
@@ -1,3 +1,3 @@
 # From http://sourceforge.net/projects/hdparm/files/hdparm/
-md5	1c75d0751a44928b6c4bc81fb16d7fe8	hdparm-9.45.tar.gz
-sha1	232855a97df0a28ddeeff9325814517668877f6c	hdparm-9.45.tar.gz
+md5	213efdbe7471fad3408198918e164354		hdparm-9.48.tar.gz
+sha1	1efce086ef47667cf8016861d3ce958969e70dfc	hdparm-9.48.tar.gz
diff --git a/package/hdparm/hdparm.mk b/package/hdparm/hdparm.mk
index 2a113d2..a2b3e8c 100644
--- a/package/hdparm/hdparm.mk
+++ b/package/hdparm/hdparm.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-HDPARM_VERSION = 9.45
+HDPARM_VERSION = 9.48
 HDPARM_SITE = http://downloads.sourceforge.net/project/hdparm/hdparm
 HDPARM_LICENSE = BSD-Style
 HDPARM_LICENSE_FILES = LICENSE.TXT
-- 
2.1.4
