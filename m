From: Paul Jones <paul@pauljones.id.au>
Date: Sun,  6 Jun 2010 09:29:04 +1000
Subject: [Buildroot] [PATCH 105/105] xkeyboard-config: Depends on
	host-intltool
Message-ID: <1275780544-14048-1-git-send-email-paul@pauljones.id.au>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Paul Jones <paul@pauljones.id.au>
---
 package/x11r7/xkeyboard-config/xkeyboard-config.mk |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/package/x11r7/xkeyboard-config/xkeyboard-config.mk b/package/x11r7/xkeyboard-config/xkeyboard-config.mk
index 9c9c8b5..eb790b8 100644
--- a/package/x11r7/xkeyboard-config/xkeyboard-config.mk
+++ b/package/x11r7/xkeyboard-config/xkeyboard-config.mk
@@ -10,6 +10,7 @@ XKEYBOARD_CONFIG_AUTORECONF = NO
 XKEYBOARD_CONFIG_INSTALL_STAGING = NO
 XKEYBOARD_CONFIG_INSTALL_TARGET = YES
 XKEYBOARD_CONFIG_INSTALL_TARGET_OPT = DESTDIR=$(TARGET_DIR) install
+XKEYBOARD_CONFIG_DEPENDENCIES = host-intltool
 
 XKEYBOARD_CONFIG_CONF_OPT = GMSGFMT=/usr/bin/msgfmt
 
-- 
1.7.0.4
