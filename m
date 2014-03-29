From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sat, 29 Mar 2014 22:44:00 +0100
Subject: [Buildroot] [PATCH 89/91] xapp_fstobdf: Bump version to 1.0.5
In-Reply-To: <1396129442-26428-1-git-send-email-bernd.kuhls@t-online.de>
References: <1396129442-26428-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <1396129442-26428-41-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Bernd Kuhls <berndkuhls@hotmail.com>


Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/x11r7/xapp_fstobdf/xapp_fstobdf.mk |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/x11r7/xapp_fstobdf/xapp_fstobdf.mk b/package/x11r7/xapp_fstobdf/xapp_fstobdf.mk
index b93f7dd..b57220f 100644
--- a/package/x11r7/xapp_fstobdf/xapp_fstobdf.mk
+++ b/package/x11r7/xapp_fstobdf/xapp_fstobdf.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XAPP_FSTOBDF_VERSION = 1.0.2
+XAPP_FSTOBDF_VERSION = 1.0.5
 XAPP_FSTOBDF_SOURCE = fstobdf-$(XAPP_FSTOBDF_VERSION).tar.bz2
 XAPP_FSTOBDF_SITE = http://xorg.freedesktop.org/releases/individual/app
 XAPP_FSTOBDF_LICENSE = MIT
-- 
1.7.10.4
