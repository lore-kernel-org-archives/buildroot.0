From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 20 Aug 2018 19:18:26 +0200
Subject: [Buildroot] [git commit] package/libconfuse: security bump to
 version 3.2.2
Message-ID: <20180820171146.559B48838E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=0debf55bad558ebea7d4212b99ada444ef8baeb7
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes CVE-2018-14447: https://github.com/martinh/libconfuse/issues/109

Signed-off-by: Frank Hunleth <fhunleth@troodon-software.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libconfuse/libconfuse.hash | 6 +++---
 package/libconfuse/libconfuse.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/libconfuse/libconfuse.hash b/package/libconfuse/libconfuse.hash
index fa77af9cd1..adc93f99a3 100644
--- a/package/libconfuse/libconfuse.hash
+++ b/package/libconfuse/libconfuse.hash
@@ -1,5 +1,5 @@
-# From https://github.com/martinh/libconfuse/releases/download/v3.2.1/confuse-3.2.1.tar.xz.md5
-md5  ebd66bb669cf43e62a23ed00d475ba67  confuse-3.2.1.tar.xz
+# From https://github.com/martinh/libconfuse/releases/download/v3.2.2/confuse-3.2.2.tar.xz.md5
+md5  978996e421e5005e6a9f6f84948fac44  confuse-3.2.2.tar.xz
 # Locally computed
-sha256  23c63272baf2ef4e2cbbafad2cf57de7eb81f006ec347c00b954819824add25e  confuse-3.2.1.tar.xz
+sha256  a9240b653d02e8cfc52db48e8c4224426e528e1faa09b65e8ca08a197fad210b  confuse-3.2.2.tar.xz
 sha256  dc3ff4b62f851dd2e94a151061ffeb7d28ddfc880a442068dc5283dbaa927306  LICENSE
diff --git a/package/libconfuse/libconfuse.mk b/package/libconfuse/libconfuse.mk
index 9f265ae25f..b16bc9b7a7 100644
--- a/package/libconfuse/libconfuse.mk
+++ b/package/libconfuse/libconfuse.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBCONFUSE_VERSION = 3.2.1
+LIBCONFUSE_VERSION = 3.2.2
 LIBCONFUSE_SOURCE = confuse-$(LIBCONFUSE_VERSION).tar.xz
 LIBCONFUSE_SITE = https://github.com/martinh/libconfuse/releases/download/v$(LIBCONFUSE_VERSION)
 LIBCONFUSE_INSTALL_STAGING = YES
