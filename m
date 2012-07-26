From: Jonathan Liu <net147@gmail.com>
Date: Fri, 27 Jul 2012 00:19:35 +1000
Subject: [Buildroot] [PATCH] crosstool-ng: bump to version 1.15.3
Message-ID: <1343312375-8339-1-git-send-email-net147@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Jonathan Liu <net147@gmail.com>
---
 package/crosstool-ng/crosstool-ng.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/crosstool-ng/crosstool-ng.mk b/package/crosstool-ng/crosstool-ng.mk
index 4bf0258..379d400 100644
--- a/package/crosstool-ng/crosstool-ng.mk
+++ b/package/crosstool-ng/crosstool-ng.mk
@@ -1,4 +1,4 @@
-CROSSTOOL_NG_VERSION           = 1.15.2
+CROSSTOOL_NG_VERSION           = 1.15.3
 CROSSTOOL_NG_SOURCE            = crosstool-ng-$(CROSSTOOL_NG_VERSION).tar.bz2
 CROSSTOOL_NG_SITE              = http://crosstool-ng.org/download/crosstool-ng/
 CROSSTOOL_NG_INSTALL_TARGET    = NO
-- 
1.7.11.2
