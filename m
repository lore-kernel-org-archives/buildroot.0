From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 1 Sep 2018 14:45:22 +0200
Subject: [Buildroot] [git commit] qt5webengine: rename chromium.inc to
 chromium-latest.inc
Message-ID: <20180901124503.C147B821DA@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=b36fd21f2c55f73b36e262816a8f5c5cfe81236c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

For consistency with chromium-lts.inc, rename chromium.inc to
chromium-latest.inc.

Signed-off-by: Laurent Hartanerot <laurent.hartanerot@atos.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/qt5/qt5webengine/{chromium.inc => chromium-latest.inc} | 0
 package/qt5/qt5webengine/qt5webengine.mk                       | 2 +-
 2 files changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/qt5/qt5webengine/chromium.inc b/package/qt5/qt5webengine/chromium-latest.inc
similarity index 100%
rename from package/qt5/qt5webengine/chromium.inc
rename to package/qt5/qt5webengine/chromium-latest.inc
diff --git a/package/qt5/qt5webengine/qt5webengine.mk b/package/qt5/qt5webengine/qt5webengine.mk
index 7caaec9c7a..c4ae961126 100644
--- a/package/qt5/qt5webengine/qt5webengine.mk
+++ b/package/qt5/qt5webengine/qt5webengine.mk
@@ -13,7 +13,7 @@ QT5WEBENGINE_DEPENDENCIES = ffmpeg libglib2 libvpx opus webp qt5base \
 QT5WEBENGINE_INSTALL_STAGING = YES
 
 ifeq ($(BR2_PACKAGE_QT5_VERSION_LATEST),y)
-include package/qt5/qt5webengine/chromium.inc
+include package/qt5/qt5webengine/chromium-latest.inc
 else
 include package/qt5/qt5webengine/chromium-lts.inc
 endif
