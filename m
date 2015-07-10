From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Fri, 10 Jul 2015 14:40:06 -0300
Subject: [Buildroot] [PATCH 1/4] libidn: bump to version 1.31
Message-ID: <1436550009-30590-1-git-send-email-gustavo@zacarias.com.ar>
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
index d41443e..6425d55 100644
--- a/package/libidn/libidn.hash
+++ b/package/libidn/libidn.hash
@@ -1,2 +1,2 @@
-# From http://lists.gnu.org/archive/html/help-libidn/2015-03/msg00001.html
-sha1	557e1e37f0978e975b21bcdc243c198cb708bb75	libidn-1.30.tar.gz
+# From http://lists.gnu.org/archive/html/help-libidn/2015-07/msg00011.html
+sha1	0bb34003a0fe05a91e60d346803401f16c82a1fb	libidn-1.31.tar.gz
diff --git a/package/libidn/libidn.mk b/package/libidn/libidn.mk
index 13436e9..e10fb6e 100644
--- a/package/libidn/libidn.mk
+++ b/package/libidn/libidn.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBIDN_VERSION = 1.30
+LIBIDN_VERSION = 1.31
 LIBIDN_SITE = $(BR2_GNU_MIRROR)/libidn
 LIBIDN_INSTALL_STAGING = YES
 LIBIDN_CONF_ENV = EMACS="no"
-- 
2.3.6
