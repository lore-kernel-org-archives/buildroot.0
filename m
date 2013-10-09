From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Wed,  9 Oct 2013 09:22:35 -0300
Subject: [Buildroot] [PATCH 1/3] linphone: add license
Message-ID: <1381321357-16419-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/linphone/linphone.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/linphone/linphone.mk b/package/linphone/linphone.mk
index 6fa1487..a4fc95c 100644
--- a/package/linphone/linphone.mk
+++ b/package/linphone/linphone.mk
@@ -12,6 +12,8 @@ LINPHONE_CONF_OPT = \
 	--disable-strict
 
 LINPHONE_DEPENDENCIES = host-pkgconf ortp mediastreamer libeXosip2 speex
+LINPHONE_LICENSE = GPLv2+
+LINPHONE_LICENSE_FILES = COPYING
 
 ifeq ($(BR2_PACKAGE_LIBGTK2)$(BR2_PACKAGE_XORG7),yy)
 LINPHONE_CONF_OPT += --enable-gtk_ui
-- 
1.8.1.5
