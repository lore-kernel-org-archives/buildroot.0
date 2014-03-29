From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sat, 29 Mar 2014 22:43:39 +0100
Subject: [Buildroot] [PATCH 68/91] xapp_rstart: Bump version to 1.0.5
In-Reply-To: <1396129442-26428-1-git-send-email-bernd.kuhls@t-online.de>
References: <1396129442-26428-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <1396129442-26428-20-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Bernd Kuhls <berndkuhls@hotmail.com>


Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/x11r7/xapp_rstart/xapp_rstart.mk |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/x11r7/xapp_rstart/xapp_rstart.mk b/package/x11r7/xapp_rstart/xapp_rstart.mk
index aa6a4b3..2bcc292 100644
--- a/package/x11r7/xapp_rstart/xapp_rstart.mk
+++ b/package/x11r7/xapp_rstart/xapp_rstart.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XAPP_RSTART_VERSION = 1.0.2
+XAPP_RSTART_VERSION = 1.0.5
 XAPP_RSTART_SOURCE = rstart-$(XAPP_RSTART_VERSION).tar.bz2
 XAPP_RSTART_SITE = http://xorg.freedesktop.org/releases/individual/app
 XAPP_RSTART_LICENSE = MIT
-- 
1.7.10.4
