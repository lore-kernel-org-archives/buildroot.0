From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Fri, 19 Dec 2014 19:19:51 +0100
Subject: [Buildroot] [PATCH 1/1] package/libbluray: bump version to 0.6.2
Message-ID: <1419013191-12262-1-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

- old SITE is now password-protected
- add hash

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/libbluray/libbluray.hash |    2 ++
 package/libbluray/libbluray.mk   |    4 ++--
 2 files changed, 4 insertions(+), 2 deletions(-)
 create mode 100644 package/libbluray/libbluray.hash

diff --git a/package/libbluray/libbluray.hash b/package/libbluray/libbluray.hash
new file mode 100644
index 0000000..b7bc201
--- /dev/null
+++ b/package/libbluray/libbluray.hash
@@ -0,0 +1,2 @@
+# Hashes from: http://get.videolan.org/libbluray/0.6.2/libbluray-0.6.2.tar.bz2.sha512
+sha512 20fbc5f34d7d025efaac1b6398c18b94b603a52bfb6dd0f021059d3bd4c3cf785e715698cd09e5d1c97a7ed11bbd146b29aa363650620eef1efca08053fc033a  libbluray-0.6.2.tar.bz2
diff --git a/package/libbluray/libbluray.mk b/package/libbluray/libbluray.mk
index ead57a3..b53f21c 100644
--- a/package/libbluray/libbluray.mk
+++ b/package/libbluray/libbluray.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-LIBBLURAY_VERSION = 0.5.0
-LIBBLURAY_SITE = ftp://ftp.videolan.org/pub/videolan/libbluray/$(LIBBLURAY_VERSION)
+LIBBLURAY_VERSION = 0.6.2
+LIBBLURAY_SITE = http://get.videolan.org/libbluray/$(LIBBLURAY_VERSION)
 LIBBLURAY_SOURCE = libbluray-$(LIBBLURAY_VERSION).tar.bz2
 LIBBLURAY_INSTALL_STAGING = YES
 LIBBLURAY_LICENSE = LGPLv2.1+
-- 
1.7.10.4
