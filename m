From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Sat, 21 Apr 2012 10:31:35 -0300
Subject: [Buildroot] [PATCH] lame: bump to version 3.99.5
Message-ID: <1335015095-6585-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/multimedia/lame/lame.mk |    6 ++++--
 1 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/package/multimedia/lame/lame.mk b/package/multimedia/lame/lame.mk
index fbf0dda..7b4b0ae 100644
--- a/package/multimedia/lame/lame.mk
+++ b/package/multimedia/lame/lame.mk
@@ -4,8 +4,10 @@
 #
 #############################################################
 
-LAME_VERSION = 3.99
-LAME_SITE = http://$(BR2_SOURCEFORGE_MIRROR).dl.sourceforge.net/sourceforge/lame
+LAME_VERSION_MAJOR = 3.99
+LAME_VERSION_MINOR = 5
+LAME_VERSION = $(LAME_VERSION_MAJOR).$(LAME_VERSION_MINOR)
+LAME_SITE = http://$(BR2_SOURCEFORGE_MIRROR).dl.sourceforge.net/project/lame/lame/$(LAME_VERSION_MAJOR)
 LAME_DEPENDENCIES = host-pkg-config
 LAME_INSTALL_STAGING = YES
 LAME_CONF_ENV = GTK_CONFIG=/bin/false
-- 
1.7.3.4
