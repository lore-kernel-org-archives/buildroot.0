From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Wed, 18 Mar 2015 11:06:24 -0300
Subject: [Buildroot] [PATCH] jhead: bump to version 3.00
Message-ID: <1426687584-21163-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Also add hash file.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/jhead/jhead.hash | 2 ++
 package/jhead/jhead.mk   | 2 +-
 2 files changed, 3 insertions(+), 1 deletion(-)
 create mode 100644 package/jhead/jhead.hash

diff --git a/package/jhead/jhead.hash b/package/jhead/jhead.hash
new file mode 100644
index 0000000..55af7a7
--- /dev/null
+++ b/package/jhead/jhead.hash
@@ -0,0 +1,2 @@
+# Locally calculated from download (no sig, hash)
+sha256	88cc01da018e242fe2e05db73f91b6288106858dd70f27506c4989a575d2895e	jhead-3.00.tar.gz
diff --git a/package/jhead/jhead.mk b/package/jhead/jhead.mk
index 27ac5f3..8a99915 100644
--- a/package/jhead/jhead.mk
+++ b/package/jhead/jhead.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-JHEAD_VERSION = 2.97
+JHEAD_VERSION = 3.00
 JHEAD_SITE = http://www.sentex.net/~mwandel/jhead
 JHEAD_LICENSE = Public Domain
 JHEAD_LICENSE_FILES = readme.txt
-- 
2.0.5
