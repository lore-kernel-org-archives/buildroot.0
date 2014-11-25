From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Tue, 25 Nov 2014 08:22:20 -0300
Subject: [Buildroot] [PATCH] grep: bump to version 2.21
Message-ID: <1416914540-6111-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Also add hash file.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/grep/grep.hash | 2 ++
 package/grep/grep.mk   | 2 +-
 2 files changed, 3 insertions(+), 1 deletion(-)
 create mode 100644 package/grep/grep.hash

diff --git a/package/grep/grep.hash b/package/grep/grep.hash
new file mode 100644
index 0000000..d27a26a
--- /dev/null
+++ b/package/grep/grep.hash
@@ -0,0 +1,2 @@
+# Locally calculated after checking signature
+sha256	5244a11c00dee8e7e5e714b9aaa053ac6cbfa27e104abee20d3c778e4bb0e5de	grep-2.21.tar.xz
diff --git a/package/grep/grep.mk b/package/grep/grep.mk
index 2c2477c..80f6e71 100644
--- a/package/grep/grep.mk
+++ b/package/grep/grep.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GREP_VERSION = 2.20
+GREP_VERSION = 2.21
 GREP_SITE = $(BR2_GNU_MIRROR)/grep
 GREP_SOURCE = grep-$(GREP_VERSION).tar.xz
 GREP_LICENSE = GPLv3+
-- 
2.0.4
