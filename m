From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Wed, 29 Jun 2016 20:48:32 +0200
Subject: [Buildroot] [PATCH 2/2] package/python3: bump to version 3.5.2
In-Reply-To: <1467226112-17465-1-git-send-email-bernd.kuhls@t-online.de>
References: <1467226112-17465-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <1467226112-17465-2-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/python3/python3.hash | 6 +++---
 package/python3/python3.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python3/python3.hash b/package/python3/python3.hash
index 2894003..f6f70a2 100644
--- a/package/python3/python3.hash
+++ b/package/python3/python3.hash
@@ -1,4 +1,4 @@
-# From https://www.python.org/downloads/release/python-351/
-md5 e9ea6f2623fffcdd871b7b19113fde80 Python-3.5.1.tar.xz
+# From https://www.python.org/downloads/release/python-352/
+md5 8906efbacfcdc7c3c9198aeefafd159e Python-3.5.2.tar.xz
 # Locally computed
-sha256 c6d57c0c366d9060ab6c0cdf889ebf3d92711d466cc0119c441dbf2746f725c9 Python-3.5.1.tar.xz
+sha256 0010f56100b9b74259ebcd5d4b295a32324b58b517403a10d1a2aa7cb22bca40 Python-3.5.2.tar.xz
diff --git a/package/python3/python3.mk b/package/python3/python3.mk
index 8459b11..f33b337 100644
--- a/package/python3/python3.mk
+++ b/package/python3/python3.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 PYTHON3_VERSION_MAJOR = 3.5
-PYTHON3_VERSION = $(PYTHON3_VERSION_MAJOR).1
+PYTHON3_VERSION = $(PYTHON3_VERSION_MAJOR).2
 PYTHON3_SOURCE = Python-$(PYTHON3_VERSION).tar.xz
 PYTHON3_SITE = http://python.org/ftp/python/$(PYTHON3_VERSION)
 PYTHON3_LICENSE = Python software foundation license v2, others
-- 
2.8.1
