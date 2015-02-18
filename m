From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Wed, 18 Feb 2015 07:05:45 -0300
Subject: [Buildroot] [PATCH] libunistring: bump to version 0.9.5
Message-ID: <1424253945-20211-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Also add hash file.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/libunistring/libunistring.hash | 2 ++
 package/libunistring/libunistring.mk   | 3 ++-
 2 files changed, 4 insertions(+), 1 deletion(-)
 create mode 100644 package/libunistring/libunistring.hash

diff --git a/package/libunistring/libunistring.hash b/package/libunistring/libunistring.hash
new file mode 100644
index 0000000..e272997
--- /dev/null
+++ b/package/libunistring/libunistring.hash
@@ -0,0 +1,2 @@
+# Locally calculated after checking pgp signature
+sha256	0b3f4dbea5124f56639a701376ed78e5f595e7b720cfbb0cf1f81f375894c77b	libunistring-0.9.5.tar.xz
diff --git a/package/libunistring/libunistring.mk b/package/libunistring/libunistring.mk
index fd77d12..0060518 100644
--- a/package/libunistring/libunistring.mk
+++ b/package/libunistring/libunistring.mk
@@ -4,8 +4,9 @@
 #
 ################################################################################
 
-LIBUNISTRING_VERSION = 0.9.4
+LIBUNISTRING_VERSION = 0.9.5
 LIBUNISTRING_SITE = $(BR2_GNU_MIRROR)/libunistring
+LIBUNISTRING_SOURCE = libunistring-$(LIBUNISTRING_VERSION).tar.xz
 LIBUNISTRING_INSTALL_STAGING = YES
 LIBUNISTRING_LICENSE = LGPLv3+
 LIBUNISTRING_LICENSE_FILES = COPYING.LIB
-- 
2.0.5
