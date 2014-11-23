From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun, 23 Nov 2014 20:56:53 +0100
Subject: [Buildroot] [PATCH next 3/3] package/tvheadend: Bump version
In-Reply-To: <1416772613-13447-1-git-send-email-bernd.kuhls@t-online.de>
References: <1416772613-13447-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <1416772613-13447-3-git-send-email-bernd.kuhls@t-online.de>
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
index 4921da4..0481731 100644
--- a/package/tvheadend/tvheadend.mk
+++ b/package/tvheadend/tvheadend.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-TVHEADEND_VERSION = c053acd84e5cc48a3e70047f228728bf039cfacd
+TVHEADEND_VERSION = d6bfd1ffe62e145a6a6e18d00ee722204ee898d4
 TVHEADEND_SITE = $(call github,tvheadend,tvheadend,$(TVHEADEND_VERSION))
 TVHEADEND_LICENSE = GPLv3+
 TVHEADEND_LICENSE_FILES = LICENSE.md
-- 
1.7.10.4
