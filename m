From: Carsten Schoenert <c.schoenert@gmail.com>
Date: Fri, 28 Jun 2013 20:52:34 +0200
Subject: [Buildroot] [PATCH 1/4] package/libxml2: bumping version to 2.9.1
Message-ID: <1372445557-15546-1-git-send-email-c.schoenert@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Carsten Schoenert <c.schoenert@gmail.com>


Signed-off-by: Carsten Schoenert <c.schoenert@gmail.com>
---
 package/libxml2/libxml2.mk |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/libxml2/libxml2.mk b/package/libxml2/libxml2.mk
index b714234..7116b82 100644
--- a/package/libxml2/libxml2.mk
+++ b/package/libxml2/libxml2.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBXML2_VERSION = 2.9.0
+LIBXML2_VERSION = 2.9.1
 LIBXML2_SITE = ftp://xmlsoft.org/libxml2
 LIBXML2_INSTALL_STAGING = YES
 LIBXML2_AUTORECONF = YES
-- 
1.7.10.4
