From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Sat, 14 May 2016 12:29:11 -0300
Subject: [Buildroot] [PATCH] file: bump to version 5.27
Message-ID: <1463239751-13395-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/file/file.hash | 2 +-
 package/file/file.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/file/file.hash b/package/file/file.hash
index 2c53af1..d20fe46 100644
--- a/package/file/file.hash
+++ b/package/file/file.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256	2ef32b4ec936b0ff7b59a021dce56086a716663b6df1138c7ea597d396bf50cf	file-5.26.tar.gz
+sha256	c2e7d509b1167c4915901ecd257ee924d229a348bf988df6d1934ef0fa34a1a7	file-5.27.tar.gz
diff --git a/package/file/file.mk b/package/file/file.mk
index 282b2da..0154c10 100644
--- a/package/file/file.mk
+++ b/package/file/file.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-FILE_VERSION = 5.26
+FILE_VERSION = 5.27
 FILE_SITE = ftp://ftp.astron.com/pub/file
 FILE_DEPENDENCIES = host-file zlib
 FILE_CONF_ENV = ac_cv_prog_cc_c99='-std=gnu99'
-- 
2.7.3
