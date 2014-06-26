From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Thu, 26 Jun 2014 16:21:03 -0300
Subject: [Buildroot] [PATCH 35/53] lite: add license information
In-Reply-To: <1403810481-10025-1-git-send-email-gustavo@zacarias.com.ar>
References: <1403810481-10025-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1403810481-10025-35-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/lite/lite.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/lite/lite.mk b/package/lite/lite.mk
index 1784d1f..ca971c1 100644
--- a/package/lite/lite.mk
+++ b/package/lite/lite.mk
@@ -11,6 +11,8 @@ LITE_INSTALL_STAGING = YES
 LITE_INSTALL_STAGING_OPT = DESTDIR=$(STAGING_DIR) LDFLAGS=-L$(STAGING_DIR)/usr/lib install
 LITE_CONF_ENV = DFB_CFLAGS=-I$(STAGING_DIR)/usr/include/directfb
 LITE_DEPENDENCIES = directfb
+LITE_LICENSE = LGPLv2.1+
+LITE_LICENSE_FILES = COPYING
 
 define LITE_FINALIZE_INSTALL
 	$(INSTALL) -d $(TARGET_DIR)/usr/share/LiTE/examples/
-- 
1.8.5.5
