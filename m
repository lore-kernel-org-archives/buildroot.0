From: Sagaert Johan <sagaert.johan@skynet.be>
Date: Fri,  6 Sep 2013 00:46:24 +0200
Subject: [Buildroot] [PATCH 1/1] gsl : bump version to 1.16
Message-ID: <1378421184-9146-1-git-send-email-sagaert.johan@skynet.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Signed-off-by: Sagaert Johan <sagaert.johan@skynet.be>
---
 package/gsl/gsl.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/gsl/gsl.mk b/package/gsl/gsl.mk
index c32a0eb..08266d4 100644
--- a/package/gsl/gsl.mk
+++ b/package/gsl/gsl.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GSL_VERSION = 1.15
+GSL_VERSION = 1.16
 GSL_SOURCE = gsl-$(GSL_VERSION).tar.gz
 GSL_SITE = $(BR2_GNU_MIRROR)/gsl
 GSL_INSTALL_STAGING = YES
-- 
1.8.3.2
