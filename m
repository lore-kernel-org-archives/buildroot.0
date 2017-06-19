From: Rodrigo Rebello <rprebello@gmail.com>
Date: Mon, 19 Jun 2017 03:02:43 -0300
Subject: [Buildroot] [PATCH] irssi: drop obsolete configure option
Message-ID: <20170619060243.4696-1-rprebello@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The configure option --with-ncurses has been removed in version 1.0.0
and thus is no longer needed.

Signed-off-by: Rodrigo Rebello <rprebello@gmail.com>
---
 package/irssi/irssi.mk | 1 -
 1 file changed, 1 deletion(-)

diff --git a/package/irssi/irssi.mk b/package/irssi/irssi.mk
index 1fe4de83c..7e80f99a9 100644
--- a/package/irssi/irssi.mk
+++ b/package/irssi/irssi.mk
@@ -18,7 +18,6 @@ IRSSI_AUTORECONF = YES
 
 IRSSI_CONF_OPTS = \
 	--disable-glibtest \
-	--with-ncurses=$(STAGING_DIR)/usr \
 	--without-perl
 
 ifeq ($(BR2_PACKAGE_IRSSI_PROXY),y)
-- 
2.11.0
