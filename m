From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Mon,  9 Jun 2014 12:56:23 +0200
Subject: [Buildroot] [PATCH 2/2] package/tvheadend: Bump version
In-Reply-To: <1402311383-31619-1-git-send-email-bernd.kuhls@t-online.de>
References: <1402311383-31619-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <1402311383-31619-2-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/tvheadend/tvheadend.mk |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/tvheadend/tvheadend.mk b/package/tvheadend/tvheadend.mk
index 86166cd..c582c07 100644
--- a/package/tvheadend/tvheadend.mk
+++ b/package/tvheadend/tvheadend.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-TVHEADEND_VERSION = 0ebca1b3dbb6a18d8adcf66a32b5922ce769b9b5
+TVHEADEND_VERSION = fd24558503967375d0b9058ac2a4c594de971cd2
 TVHEADEND_SITE = $(call github,tvheadend,tvheadend,$(TVHEADEND_VERSION))
 TVHEADEND_LICENSE = GPLv3+
 TVHEADEND_LICENSE_FILES = LICENSE.md
-- 
1.7.10.4
