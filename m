From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 27 Jul 2020 17:19:46 +0200
Subject: [Buildroot] [git commit] package/cegui: fix indentation
Message-ID: <20200727151517.9304E82B56@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=4aa8f5efd9faa416f20877affa153eb1a543cb5e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

No functional changes, only whitespace changes.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/cegui/cegui.mk | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/package/cegui/cegui.mk b/package/cegui/cegui.mk
index 12b2712f33..23919e0151 100644
--- a/package/cegui/cegui.mk
+++ b/package/cegui/cegui.mk
@@ -10,13 +10,13 @@ CEGUI_LICENSE = MIT
 CEGUI_LICENSE_FILES = COPYING
 CEGUI_INSTALL_STAGING = YES
 CEGUI_CONF_OPTS += -DCEGUI_BUILD_XMLPARSER_XERCES=OFF \
-		   -DCEGUI_HAS_MINIZIP_RESOURCE_PROVIDER=OFF \
-		   -DCEGUI_BUILD_RENDERER_OGRE=OFF
+	-DCEGUI_HAS_MINIZIP_RESOURCE_PROVIDER=OFF \
+	-DCEGUI_BUILD_RENDERER_OGRE=OFF
 CEGUI_DEPENDENCIES = glm \
-		$(if $(BR2_PACKAGE_LIBGLFW),libglfw) \
-		$(if $(BR2_PACKAGE_HAS_LIBGL),libgl) \
-		$(if $(BR2_PACKAGE_HAS_LIBGLES),libgles) \
-		$(if $(BR2_PACKAGE_LIBICONV),libiconv)
+	$(if $(BR2_PACKAGE_LIBGLFW),libglfw) \
+	$(if $(BR2_PACKAGE_HAS_LIBGL),libgl) \
+	$(if $(BR2_PACKAGE_HAS_LIBGLES),libgles) \
+	$(if $(BR2_PACKAGE_LIBICONV),libiconv)
 
 # libepoxy support cannot be enabled together with libglew
 ifeq ($(BR2_PACKAGE_LIBGLEW)$(BR2_PACKAGE_LIBGLU),yy)
