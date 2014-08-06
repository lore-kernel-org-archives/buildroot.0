From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 6 Aug 2014 19:43:44 +0200
Subject: [Buildroot] [git commit] rpi-userland: .mk: Indent rules with tabs
Message-ID: <20140806174355.A94DE9D389@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=6934024a84bcc58c6ca9e6b22bc4cd5846cfb078
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Beno??t Th??baudeau <benoit.thebaudeau@advansee.com>
Acked-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/rpi-userland/rpi-userland.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/rpi-userland/rpi-userland.mk b/package/rpi-userland/rpi-userland.mk
index 20f68fa..81ed95c 100644
--- a/package/rpi-userland/rpi-userland.mk
+++ b/package/rpi-userland/rpi-userland.mk
@@ -14,7 +14,7 @@ RPI_USERLAND_CONF_OPT = -DVMCS_INSTALL_PREFIX=/usr
 RPI_USERLAND_PROVIDES = libegl libgles libopenmax libopenvg
 
 define RPI_USERLAND_POST_TARGET_CLEANUP
-    rm -Rf $(TARGET_DIR)/usr/src
+	rm -Rf $(TARGET_DIR)/usr/src
 endef
 RPI_USERLAND_POST_INSTALL_TARGET_HOOKS += RPI_USERLAND_POST_TARGET_CLEANUP
 
