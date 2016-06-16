From: James Knight <james.d.knight@live.com>
Date: Thu, 16 Jun 2016 01:13:53 -0400
Subject: [Buildroot] [PATCH 1/1] google-material-design-icons: bump to
	version 2.2.3
Message-ID: <BLU436-SMTP1070923830570CD7BC8E305A0560@phx.gbl>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Aside from the version number increase, a newly added category `places`
is available; appending to the current icon list.

Signed-off-by: James Knight <james.d.knight@live.com>
---
 .../google-material-design-icons/google-material-design-icons.hash    | 2 +-
 package/google-material-design-icons/google-material-design-icons.mk  | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/google-material-design-icons/google-material-design-icons.hash b/package/google-material-design-icons/google-material-design-icons.hash
index 7bcfcb5..9a66336 100644
--- a/package/google-material-design-icons/google-material-design-icons.hash
+++ b/package/google-material-design-icons/google-material-design-icons.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256  87d7c8515207edecd3438a96bdf5129df91e0b29261d5f8c52f672957c11af65  2.0.0.tar.gz
+sha256  769547061a51f81623bf5174767c08fc587fd6946339592fbd6cd0dd45f56b4c  2.2.3.tar.gz
diff --git a/package/google-material-design-icons/google-material-design-icons.mk b/package/google-material-design-icons/google-material-design-icons.mk
index 3228d13..d410a45 100644
--- a/package/google-material-design-icons/google-material-design-icons.mk
+++ b/package/google-material-design-icons/google-material-design-icons.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GOOGLE_MATERIAL_DESIGN_ICONS_VERSION = 2.0.0
+GOOGLE_MATERIAL_DESIGN_ICONS_VERSION = 2.2.3
 GOOGLE_MATERIAL_DESIGN_ICONS_SOURCE = \
 	$(GOOGLE_MATERIAL_DESIGN_ICONS_VERSION).tar.gz
 GOOGLE_MATERIAL_DESIGN_ICONS_SITE = \
@@ -14,7 +14,7 @@ GOOGLE_MATERIAL_DESIGN_ICONS_LICENSE_FILES = LICENSE
 
 GOOGLE_MATERIAL_DESIGN_ICONS_LIST = \
 	action alert av communication content device editor file \
-	hardware image maps navigation notification social toggle
+	hardware image maps navigation notification places social toggle
 
 ifneq ($(BR2_PACKAGE_GOOGLE_MATERIAL_DESIGN_ICONS_TYPE_PNG)$(BR2_PACKAGE_GOOGLE_MATERIAL_DESIGN_ICONS_TYPE_SVG),)
 define GOOGLE_MATERIAL_DESIGN_ICONS_INSTALL_ICONS_IMAGES
-- 
2.8.1.windows.1
