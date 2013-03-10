From: Carsten Schoenert <c.schoenert@gmail.com>
Date: Sun, 10 Mar 2013 19:32:51 +0100
Subject: [Buildroot] [PATCH 10/10] sawman: bumping version to 1.6.3
In-Reply-To: <1362940371-25899-1-git-send-email-c.schoenert@gmail.com>
References: <1362940371-25899-1-git-send-email-c.schoenert@gmail.com>
Message-ID: <1362940371-25899-11-git-send-email-c.schoenert@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Carsten Schoenert <c.schoenert@gmail.com>

After switching directfb to 1.6.3 sawman must also be bumped to the
current version because the old version can't be builded with newer
libs and headers from directfb.

Signed-off-by: Carsten Schoenert <c.schoenert@gmail.com>
---
 package/sawman/sawman.mk |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/sawman/sawman.mk b/package/sawman/sawman.mk
index 0faae9c..b8c1121 100644
--- a/package/sawman/sawman.mk
+++ b/package/sawman/sawman.mk
@@ -3,7 +3,7 @@
 # SAWMAN
 #
 #############################################################
-SAWMAN_VERSION = 1.4.16
+SAWMAN_VERSION = 1.6.3
 SAWMAN_SOURCE = SaWMan-$(SAWMAN_VERSION).tar.gz
 SAWMAN_SITE = http://www.directfb.org/downloads/Extras
 SAWMAN_INSTALL_STAGING = YES
-- 
1.7.10.4
