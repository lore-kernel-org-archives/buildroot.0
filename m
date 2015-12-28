From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Mon, 28 Dec 2015 19:12:26 -0300
Subject: [Buildroot] [PATCH] gettext: bump to version 0.19.7
Message-ID: <1451340746-28040-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/gettext/gettext.hash | 6 +++---
 package/gettext/gettext.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/gettext/gettext.hash b/package/gettext/gettext.hash
index 33fe515..3236fda 100644
--- a/package/gettext/gettext.hash
+++ b/package/gettext/gettext.hash
@@ -1,3 +1,3 @@
-# From https://lists.gnu.org/archive/html/info-gnu/2015-09/msg00003.html
-md5 69d79254ee3b41df23f41c2f4fd720d9  gettext-0.19.6.tar.xz
-sha1 6033a0f87246c510dda9bfd8b3b3c488c0853156  gettext-0.19.6.tar.xz
+# From http://lists.gnu.org/archive/html/bug-gettext/2015-12/msg00019.html
+md5	f81e50556da41b44c1d59ac93474dca5	gettext-0.19.7.tar.xz
+sha1	4b2574b76d14c98270bf607a2a62f033524d8e8c	gettext-0.19.7.tar.xz
diff --git a/package/gettext/gettext.mk b/package/gettext/gettext.mk
index cb509f2..10034d6 100644
--- a/package/gettext/gettext.mk
+++ b/package/gettext/gettext.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GETTEXT_VERSION = 0.19.6
+GETTEXT_VERSION = 0.19.7
 GETTEXT_SITE = $(BR2_GNU_MIRROR)/gettext
 GETTEXT_SOURCE = gettext-$(GETTEXT_VERSION).tar.xz
 GETTEXT_INSTALL_STAGING = YES
-- 
2.4.10
