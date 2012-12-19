From: Sven Neumann <s.neumann@raumfeld.com>
Date: Wed, 19 Dec 2012 11:54:31 +0100
Subject: [Buildroot] [PATCH] orc: bump to version 0.4.16
Message-ID: <1355914471-18864-1-git-send-email-s.neumann@raumfeld.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The gstreamer-1.0 plug-ins require this version for ORC
acceleration.

Signed-off-by: Sven Neumann <s.neumann@raumfeld.com>
---
 package/orc/orc.mk |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/orc/orc.mk b/package/orc/orc.mk
index 842ef25..77cb29f 100644
--- a/package/orc/orc.mk
+++ b/package/orc/orc.mk
@@ -3,7 +3,7 @@
 # orc
 #
 #############################################################
-ORC_VERSION = 0.4.14
+ORC_VERSION = 0.4.16
 ORC_SITE = http://code.entropywave.com/download/orc/
 ORC_INSTALL_STAGING = YES
 ORC_DEPENDENCIES = host-orc
-- 
1.7.10.4
