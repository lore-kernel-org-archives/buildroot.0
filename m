From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Wed, 11 Dec 2013 10:23:46 -0300
Subject: [Buildroot] [PATCH 13/16] flashrom: add licensing info
In-Reply-To: <1386768229-29485-1-git-send-email-gustavo@zacarias.com.ar>
References: <1386768229-29485-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1386768229-29485-13-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/flashrom/flashrom.mk | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/package/flashrom/flashrom.mk b/package/flashrom/flashrom.mk
index bca800b..df648f8 100644
--- a/package/flashrom/flashrom.mk
+++ b/package/flashrom/flashrom.mk
@@ -5,10 +5,11 @@
 ################################################################################
 
 FLASHROM_VERSION = 0.9.6.1
-FLASHROM_SOURCE  = flashrom-$(FLASHROM_VERSION).tar.bz2
-FLASHROM_SITE    = http://download.flashrom.org/releases
-
+FLASHROM_SOURCE = flashrom-$(FLASHROM_VERSION).tar.bz2
+FLASHROM_SITE = http://download.flashrom.org/releases
 FLASHROM_DEPENDENCIES = pciutils
+FLASHROM_LICENSE = GPLv2+
+FLASHROM_LICENSE_FILES = COPYING
 
 define FLASHROM_BUILD_CMDS
 	$(MAKE) $(TARGET_CONFIGURE_OPTS) -C $(@D)
-- 
1.8.3.2
