From: Sagaert Johan <sagaert.johan@proximus.be>
Date: Thu,  2 Apr 2015 22:19:28 +0200
Subject: [Buildroot] [PATCH 1/1] install liblinphone in staging.
Message-ID: <1428005968-15846-1-git-send-email-sagaert.johan@proximus.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Make sure the liblinphone library gets installed too.
Signed-off-by: Sagaert Johan <sagaert.johan@proximus.be>
---
 package/linphone/linphone.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/linphone/linphone.mk b/package/linphone/linphone.mk
index daf56be..e0d4fa3 100644
--- a/package/linphone/linphone.mk
+++ b/package/linphone/linphone.mk
@@ -13,6 +13,7 @@ LINPHONE_CONF_OPTS = \
 	--disable-strict
 # configure is out of sync causing deplibs linking issues
 LINPHONE_AUTORECONF = YES
+LINPHONE_INSTALL_STAGING = YES
 LINPHONE_DEPENDENCIES = host-pkgconf ortp mediastreamer libeXosip2 speex
 LINPHONE_LICENSE = GPLv2+
 LINPHONE_LICENSE_FILES = COPYING
-- 
2.3.3
