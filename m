From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 11 Dec 2013 22:26:03 +0100
Subject: [Buildroot] [git commit] flashrom: add licensing info
Message-ID: <20131211213615.9150A9A383@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=e809308c3562a53721d383da485785d3014d9717
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/flashrom/flashrom.mk |    7 ++++---
 1 files changed, 4 insertions(+), 3 deletions(-)

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
