From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 10 Dec 2014 21:53:30 +0100
Subject: [Buildroot] [git commit] package: indentation cleanup
Message-ID: <20141210205350.BAAA18016A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=5d4734084d2809b5ffae241d62a485e7499ab53b
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Jerzy Grzegorek <jerzy.grzegorek@trzebnica.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 fs/common.mk               |    2 +-
 package/omniorb/omniorb.mk |    2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/fs/common.mk b/fs/common.mk
index d40f5ae..13bf4ad 100644
--- a/fs/common.mk
+++ b/fs/common.mk
@@ -106,7 +106,7 @@ endif
 endef
 
 define ROOTFS_TARGET
-$(call ROOTFS_TARGET_INTERNAL,$(1),$(call UPPERCASE,$(1)))
+	$(call ROOTFS_TARGET_INTERNAL,$(1),$(call UPPERCASE,$(1)))
 endef
 
 include $(sort $(wildcard fs/*/*.mk))
diff --git a/package/omniorb/omniorb.mk b/package/omniorb/omniorb.mk
index 25d3b73..82d6807 100644
--- a/package/omniorb/omniorb.mk
+++ b/package/omniorb/omniorb.mk
@@ -37,7 +37,7 @@ HOST_OMNIORB_CONF_OPTS += --disable-longdouble
 # required.  The tools however are host related and should never
 # be required on target.
 define OMNIORB_ENABLE_EXTRA_APPS
-$(SED) 's:SUBDIRS += lib:SUBDIRS += lib appl services:g' $(@D)/src/dir.mk
+	$(SED) 's:SUBDIRS += lib:SUBDIRS += lib appl services:g' $(@D)/src/dir.mk
 endef
 
 ifeq ($(BR2_PACKAGE_OMNIORB_WITH_APPS),y)
