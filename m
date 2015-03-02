From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Mon,  2 Mar 2015 20:00:38 -0300
Subject: [Buildroot] [PATCH] libidn: bump to version 1.30
Message-ID: <1425337238-15597-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/libidn/libidn.hash | 4 ++--
 package/libidn/libidn.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/libidn/libidn.hash b/package/libidn/libidn.hash
index f486626..d41443e 100644
--- a/package/libidn/libidn.hash
+++ b/package/libidn/libidn.hash
@@ -1,2 +1,2 @@
-# From https://lists.gnu.org/archive/html/info-gnu/2014-08/msg00006.html
-sha256	fb82747dbbf9b36f703ed27293317d818d7e851d4f5773dedf3efa4db32a7c7c	libidn-1.29.tar.gz
+# From http://lists.gnu.org/archive/html/help-libidn/2015-03/msg00001.html
+sha1	557e1e37f0978e975b21bcdc243c198cb708bb75	libidn-1.30.tar.gz
diff --git a/package/libidn/libidn.mk b/package/libidn/libidn.mk
index fac9816..13436e9 100644
--- a/package/libidn/libidn.mk
+++ b/package/libidn/libidn.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBIDN_VERSION = 1.29
+LIBIDN_VERSION = 1.30
 LIBIDN_SITE = $(BR2_GNU_MIRROR)/libidn
 LIBIDN_INSTALL_STAGING = YES
 LIBIDN_CONF_ENV = EMACS="no"
-- 
2.0.5
