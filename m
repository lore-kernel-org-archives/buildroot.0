From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 18 Feb 2015 23:29:43 +0100
Subject: [Buildroot] [git commit branch/next] libunistring: bump to version
	0.9.5
Message-ID: <20150218223039.9A8CD8178D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=b265f0e0719f5e32d37d26870992de0e63997e9a
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Also add hash file.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libunistring/libunistring.hash |    2 ++
 package/libunistring/libunistring.mk   |    3 ++-
 2 files changed, 4 insertions(+), 1 deletions(-)

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
