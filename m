From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Mon, 14 Dec 2015 10:11:08 -0300
Subject: [Buildroot] [PATCH 29/45] webkitgtk24: comma separate licenses
In-Reply-To: <1450098684-17399-1-git-send-email-gustavo@zacarias.com.ar>
References: <1450098684-17399-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1450098684-17399-30-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/webkitgtk24/webkitgtk24.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/webkitgtk24/webkitgtk24.mk b/package/webkitgtk24/webkitgtk24.mk
index 3be1cc7..712120c 100644
--- a/package/webkitgtk24/webkitgtk24.mk
+++ b/package/webkitgtk24/webkitgtk24.mk
@@ -8,7 +8,7 @@ WEBKITGTK24_VERSION = 2.4.9
 WEBKITGTK24_SITE = http://www.webkitgtk.org/releases
 WEBKITGTK24_SOURCE = webkitgtk-$(WEBKITGTK24_VERSION).tar.xz
 WEBKITGTK24_INSTALL_STAGING = YES
-WEBKITGTK24_LICENSE = LGPLv2+ BSD-2c
+WEBKITGTK24_LICENSE = LGPLv2+, BSD-2c
 WEBKITGTK24_LICENSE_FILES = \
 	Source/WebCore/LICENSE-APPLE \
 	Source/WebCore/LICENSE-LGPL-2
-- 
2.4.10
