From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Thu,  6 Oct 2016 21:29:29 +0200
Subject: [Buildroot] [PATCH 02/21] package/python-pillow: bump version to
	3.4.0
In-Reply-To: <20161006192948.27956-1-bernd.kuhls@t-online.de>
References: <20161006192948.27956-1-bernd.kuhls@t-online.de>
Message-ID: <20161006192948.27956-2-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/python-pillow/python-pillow.hash | 7 +++----
 package/python-pillow/python-pillow.mk   | 4 ++--
 2 files changed, 5 insertions(+), 6 deletions(-)

diff --git a/package/python-pillow/python-pillow.hash b/package/python-pillow/python-pillow.hash
index fa6834e..ed195f6 100644
--- a/package/python-pillow/python-pillow.hash
+++ b/package/python-pillow/python-pillow.hash
@@ -1,4 +1,3 @@
-https://pypi.python.org/pypi?:action=show_md5&digest=3bc85204223b52e96ed05c9441507eed
-md5 3bc85204223b52e96ed05c9441507eed  Pillow-3.3.1.tar.gz
-# sha256 locally computed
-sha256 3491ca65d9fdba4db094ab3f8e17170425e7dd670e507921a665a1975d1b3df1  Pillow-3.3.1.tar.gz
+# md5 from https://pypi.python.org/pypi/pillow/json, sha256 locally computed
+md5	1ea45914e8cc375fb385da2555b37267  Pillow-3.4.0.tar.gz
+sha256	51027d511f4ab991f628f6f7b9b0fbf18f584ee8a67160410afe3b19685b9d50  Pillow-3.4.0.tar.gz
diff --git a/package/python-pillow/python-pillow.mk b/package/python-pillow/python-pillow.mk
index 9116e12..f06ce8d 100644
--- a/package/python-pillow/python-pillow.mk
+++ b/package/python-pillow/python-pillow.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_PILLOW_VERSION = 3.3.1
+PYTHON_PILLOW_VERSION = 3.4.0
 PYTHON_PILLOW_SOURCE = Pillow-$(PYTHON_PILLOW_VERSION).tar.gz
-PYTHON_PILLOW_SITE = https://pypi.python.org/packages/7b/32/e6978aed8fba6398c00eec25f12798fb57647a6cef4f85db1567e3d086ef
+PYTHON_PILLOW_SITE = https://pypi.python.org/packages/51/1d/6456623ea7e155249c0e82cf92715c42ba1902759d1eeff6ac5c3107e747
 PYTHON_PILLOW_LICENSE = PIL Software License
 PYTHON_PILLOW_LICENSE_FILES = LICENSE
 PYTHON_PILLOW_SETUP_TYPE = setuptools
-- 
2.9.3
