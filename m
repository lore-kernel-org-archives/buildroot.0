From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Mon, 12 Sep 2011 00:08:17 +0200
Subject: [Buildroot] [git commit] jpeg: remove --program-prefix
Message-ID: <20110912052632.EEF908D58C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=8ea4d5b47bec2d83516f4c61436fc39800aac18b
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

--program-prefix is now set in the auto-target infrastructure.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@anciens.enib.fr>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/jpeg/jpeg.mk |    1 -
 1 files changed, 0 insertions(+), 1 deletions(-)

diff --git a/package/jpeg/jpeg.mk b/package/jpeg/jpeg.mk
index 30a6225..adbe330 100644
--- a/package/jpeg/jpeg.mk
+++ b/package/jpeg/jpeg.mk
@@ -8,7 +8,6 @@ JPEG_SITE = http://www.ijg.org/files/
 JPEG_SOURCE = jpegsrc.v$(JPEG_VERSION).tar.gz
 JPEG_INSTALL_STAGING = YES
 JPEG_INSTALL_TARGET = YES
-JPEG_CONF_OPT = --program-prefix=
 
 define JPEG_REMOVE_USELESS_TOOLS
 	rm -f $(addprefix $(TARGET_DIR)/usr/bin/,cjpeg djpeg jpegtrans rdjpgcom wrjpgcom)
-- 
1.7.3.4
