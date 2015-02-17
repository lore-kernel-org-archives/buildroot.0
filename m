From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Tue, 17 Feb 2015 09:57:43 -0300
Subject: [Buildroot] [PATCH 1/2] libnspr: bump to version 4.10.8
Message-ID: <1424177864-24520-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Also add hash file.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/libnspr/libnspr.hash | 2 ++
 package/libnspr/libnspr.mk   | 2 +-
 2 files changed, 3 insertions(+), 1 deletion(-)
 create mode 100644 package/libnspr/libnspr.hash

diff --git a/package/libnspr/libnspr.hash b/package/libnspr/libnspr.hash
new file mode 100644
index 0000000..632422f
--- /dev/null
+++ b/package/libnspr/libnspr.hash
@@ -0,0 +1,2 @@
+# From https://ftp.mozilla.org/pub/mozilla.org/nspr/releases/v4.10.8/src/SHA256SUMS
+sha256	507ea57c525c0c524dae4857a642b4ef5c9d795518754c7f83422d22fe544a15	nspr-4.10.8.tar.gz
diff --git a/package/libnspr/libnspr.mk b/package/libnspr/libnspr.mk
index c4f86cc..91a740a 100644
--- a/package/libnspr/libnspr.mk
+++ b/package/libnspr/libnspr.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBNSPR_VERSION = 4.10.7
+LIBNSPR_VERSION = 4.10.8
 LIBNSPR_SOURCE = nspr-$(LIBNSPR_VERSION).tar.gz
 LIBNSPR_SITE = https://ftp.mozilla.org/pub/mozilla.org/nspr/releases/v$(LIBNSPR_VERSION)/src
 LIBNSPR_SUBDIR = nspr
-- 
2.0.5
