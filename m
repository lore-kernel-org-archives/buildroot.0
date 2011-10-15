From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Sat, 15 Oct 2011 00:07:20 -0300
Subject: [Buildroot] [PATCH 06/25] sudo: bump to version 1.7.7
In-Reply-To: <1318648059-30431-1-git-send-email-gustavo@zacarias.com.ar>
References: <1318648059-30431-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1318648059-30431-6-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/sudo/sudo.mk |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/sudo/sudo.mk b/package/sudo/sudo.mk
index 4263762..9c62c49 100644
--- a/package/sudo/sudo.mk
+++ b/package/sudo/sudo.mk
@@ -4,7 +4,7 @@
 #
 #############################################################
 
-SUDO_VERSION = 1.7.6p2
+SUDO_VERSION = 1.7.7
 SUDO_SITE    = http://www.sudo.ws/sudo/dist
 
 SUDO_CONF_OPT = \
@@ -21,4 +21,4 @@ define SUDO_INSTALL_TARGET_CMDS
 	install -m 0440 -D $(@D)/sudoers $(TARGET_DIR)/etc/sudoers
 endef
 
-$(eval $(call AUTOTARGETS))
\ No newline at end of file
+$(eval $(call AUTOTARGETS))
-- 
1.7.3.4
