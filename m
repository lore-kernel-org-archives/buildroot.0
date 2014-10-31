From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Fri, 31 Oct 2014 22:07:01 +0100
Subject: [Buildroot] [PATCH v4 2/2] package/tvheadend: Bump version to
	current git master
In-Reply-To: <1414789621-10892-1-git-send-email-bernd.kuhls@t-online.de>
References: <1414789621-10892-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <1414789621-10892-2-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

---
v4: initial version

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/tvheadend/tvheadend.mk |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/tvheadend/tvheadend.mk b/package/tvheadend/tvheadend.mk
index 08d8e7e..f3d7863 100644
--- a/package/tvheadend/tvheadend.mk
+++ b/package/tvheadend/tvheadend.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-TVHEADEND_VERSION = 596b4e0b29937a6123b25940621fe17dccbefbb4
+TVHEADEND_VERSION = c053acd84e5cc48a3e70047f228728bf039cfacd
 TVHEADEND_SITE = $(call github,tvheadend,tvheadend,$(TVHEADEND_VERSION))
 TVHEADEND_LICENSE = GPLv3+
 TVHEADEND_LICENSE_FILES = LICENSE.md
-- 
1.7.10.4
