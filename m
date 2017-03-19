From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 19 Mar 2017 14:09:24 +0100
Subject: [Buildroot] [git commit] package/qt5multimedia: indentation cleanup
Message-ID: <20170319131837.E7B9680AC7@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=dff59eb5def008dddcbf957e2b0f0a550ef87d3c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Jerzy Grzegorek <jerzy.grzegorek@trzebnica.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/qt5/qt5multimedia/qt5multimedia.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/qt5/qt5multimedia/qt5multimedia.mk b/package/qt5/qt5multimedia/qt5multimedia.mk
index fccdd5d..0a95340 100644
--- a/package/qt5/qt5multimedia/qt5multimedia.mk
+++ b/package/qt5/qt5multimedia/qt5multimedia.mk
@@ -66,7 +66,7 @@ endif
 
 ifeq ($(BR2_PACKAGE_QT5BASE_EXAMPLES),y)
 define QT5MULTIMEDIA_INSTALL_TARGET_EXAMPLES
-       cp -dpfr $(STAGING_DIR)/usr/lib/qt/examples/multimedia* $(TARGET_DIR)/usr/lib/qt/examples/
+	cp -dpfr $(STAGING_DIR)/usr/lib/qt/examples/multimedia* $(TARGET_DIR)/usr/lib/qt/examples/
 endef
 endif
 
