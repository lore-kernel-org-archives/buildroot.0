From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Tue, 24 May 2016 16:31:49 -0300
Subject: [Buildroot] [PATCH] webkitgtk: security bump to version 2.12.3
Message-ID: <1464118309-8772-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes:
CVE-2016-1856 - allows remote attackers to execute arbitrary code or
cause a denial of service (memory corruption) via a crafted web site
CVE-2016-1857 - allows remote attackers to execute arbitrary code or
cause a denial of service (memory corruption) via a crafted web site

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/webkitgtk/webkitgtk.hash | 6 +++---
 package/webkitgtk/webkitgtk.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/webkitgtk/webkitgtk.hash b/package/webkitgtk/webkitgtk.hash
index 20959fd..faccb3f 100644
--- a/package/webkitgtk/webkitgtk.hash
+++ b/package/webkitgtk/webkitgtk.hash
@@ -1,4 +1,4 @@
-# From http://www.webkitgtk.org/releases/webkitgtk-2.12.2.tar.xz.sha1
-sha1	84d02caadd3d39805e83a4719e2424c1ba4a54d6	webkitgtk-2.12.2.tar.xz
+# From http://www.webkitgtk.org/releases/webkitgtk-2.12.3.tar.xz.sha1
+sha1	d6a0d598c09d2d56ba0862f8d9206e89d75317cb	webkitgtk-2.12.3.tar.xz
 # Calculated based on the hash above
-sha256	9dc49b908b1c37da739703e1402a7f07c4ea9093b8ecfb34f20e8f74e328f124	webkitgtk-2.12.2.tar.xz
+sha256	173cbb9a2eca23eee52e99965483ab25aa9c0569ef5b57041fc0c129cc26c307	webkitgtk-2.12.3.tar.xz
diff --git a/package/webkitgtk/webkitgtk.mk b/package/webkitgtk/webkitgtk.mk
index 8bed9c5..2479872 100644
--- a/package/webkitgtk/webkitgtk.mk
+++ b/package/webkitgtk/webkitgtk.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-WEBKITGTK_VERSION = 2.12.2
+WEBKITGTK_VERSION = 2.12.3
 WEBKITGTK_SITE = http://www.webkitgtk.org/releases
 WEBKITGTK_SOURCE = webkitgtk-$(WEBKITGTK_VERSION).tar.xz
 WEBKITGTK_INSTALL_STAGING = YES
-- 
2.7.3
