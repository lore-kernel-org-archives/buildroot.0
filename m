From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Sat, 11 Oct 2014 18:55:04 -0300
Subject: [Buildroot] [PATCH 1/2] file: bump to version 5.20
Message-ID: <1413064505-23839-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/file/file.hash | 2 ++
 package/file/file.mk   | 2 +-
 2 files changed, 3 insertions(+), 1 deletion(-)
 create mode 100644 package/file/file.hash

diff --git a/package/file/file.hash b/package/file/file.hash
new file mode 100644
index 0000000..1043d74
--- /dev/null
+++ b/package/file/file.hash
@@ -0,0 +1,2 @@
+# Locally calculated
+sha256	5bc36bfbb83a009da25a7174848f1bc5824be03192a8fdce7f83dc897ed2d247	file-5.20.tar.gz
diff --git a/package/file/file.mk b/package/file/file.mk
index 5df024f..603e510 100644
--- a/package/file/file.mk
+++ b/package/file/file.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-FILE_VERSION = 5.19
+FILE_VERSION = 5.20
 FILE_SITE = ftp://ftp.astron.com/pub/file
 FILE_DEPENDENCIES = host-file zlib
 FILE_INSTALL_STAGING = YES
-- 
2.0.4
