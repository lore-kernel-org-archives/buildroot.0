From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Sun, 17 Apr 2016 11:51:14 -0300
Subject: [Buildroot] [PATCH] file: bump to version 5.26
Message-ID: <1460904674-6064-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/file/file.hash | 2 +-
 package/file/file.mk   | 3 ++-
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/package/file/file.hash b/package/file/file.hash
index 2eac7a5..2c53af1 100644
--- a/package/file/file.hash
+++ b/package/file/file.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256 3735381563f69fb4239470b8c51b876a80425348b8285a7cded8b61d6b890eca  file-5.25.tar.gz
+sha256	2ef32b4ec936b0ff7b59a021dce56086a716663b6df1138c7ea597d396bf50cf	file-5.26.tar.gz
diff --git a/package/file/file.mk b/package/file/file.mk
index 4d13547..282b2da 100644
--- a/package/file/file.mk
+++ b/package/file/file.mk
@@ -4,9 +4,10 @@
 #
 ################################################################################
 
-FILE_VERSION = 5.25
+FILE_VERSION = 5.26
 FILE_SITE = ftp://ftp.astron.com/pub/file
 FILE_DEPENDENCIES = host-file zlib
+FILE_CONF_ENV = ac_cv_prog_cc_c99='-std=gnu99'
 FILE_INSTALL_STAGING = YES
 FILE_LICENSE = BSD-2c, one file BSD-4c, one file BSD-3c
 FILE_LICENSE_FILES = COPYING src/mygetopt.h src/vasprintf.c
-- 
2.7.3
