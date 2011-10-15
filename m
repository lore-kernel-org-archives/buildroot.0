From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sat, 15 Oct 2011 23:04:13 +0200
Subject: [Buildroot] [git commit] sudo: bump to version 1.7.7
Message-ID: <20111015213655.F41568E273@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=2b87acaa8b2256a22fb9cd3db85cef311655d1e6
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
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
