From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun,  7 Jul 2013 18:13:53 +0200
Subject: [Buildroot] [PATCH] package/tvheadend: bump version
Message-ID: <1373213633-18190-1-git-send-email-yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: "Yann E. MORIN" <yann.morin.1998@free.fr>

... for a truck-load of memory-leak and other various fixes.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
---
 package/tvheadend/tvheadend.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/tvheadend/tvheadend.mk b/package/tvheadend/tvheadend.mk
index 4f9a148..2a09263 100644
--- a/package/tvheadend/tvheadend.mk
+++ b/package/tvheadend/tvheadend.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-TVHEADEND_VERSION           = 6cb8eaa
+TVHEADEND_VERSION           = 5956233
 TVHEADEND_SITE              = git://github.com/tvheadend/tvheadend.git
 TVHEADEND_LICENSE           = GPLv3+
 TVHEADEND_LICENSE_FILES     = LICENSE
-- 
1.8.1.2
