From: Grzegorz Blach <grzegorz@blach.pl>
Date: Mon, 18 May 2020 16:26:05 +0200
Subject: [Buildroot] [PATCH 1/2] package/python-crontab: bump to version
 2.5.1
Message-ID: <20200518142609.740711-1-grzegorz@blach.pl>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Grzegorz Blach <grzegorz@blach.pl>
---
 package/python-crontab/python-crontab.hash | 4 ++--
 package/python-crontab/python-crontab.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-crontab/python-crontab.hash b/package/python-crontab/python-crontab.hash
index d0e5725708..2247cf3d3d 100644
--- a/package/python-crontab/python-crontab.hash
+++ b/package/python-crontab/python-crontab.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/python-crontab/json
-md5  65fe16d44568de2671d334a637e64a3b  python-crontab-2.4.2.tar.gz
-sha256  ed9583cff430715d9560cbad28309429ac13f3fdb13051ac2288050e05abc392  python-crontab-2.4.2.tar.gz
+md5  7731a2253e853abfb6eceb8045368f22  python-crontab-2.5.1.tar.gz
+sha256  4bbe7e720753a132ca4ca9d4094915f40e9d9dc8a807a4564007651018ce8c31  python-crontab-2.5.1.tar.gz
 # Locally computed sha256 checksums
 sha256  da7eabb7bafdf7d3ae5e9f223aa5bdc1eece45ac569dc21b3b037520b4464768  COPYING
diff --git a/package/python-crontab/python-crontab.mk b/package/python-crontab/python-crontab.mk
index 0c6109dd7f..ddb1067db2 100644
--- a/package/python-crontab/python-crontab.mk
+++ b/package/python-crontab/python-crontab.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-PYTHON_CRONTAB_VERSION = 2.4.2
-PYTHON_CRONTAB_SITE = https://files.pythonhosted.org/packages/d1/c2/e92e801a0c504e62899d574a6d281d6e598861797c6798a664556d2bca8c
+PYTHON_CRONTAB_VERSION = 2.5.1
+PYTHON_CRONTAB_SITE = https://files.pythonhosted.org/packages/1b/7e/fb78b96de58a49b8ef807c321870ef4de3de5928fd71a40a400aed714310
 PYTHON_CRONTAB_SETUP_TYPE = setuptools
 PYTHON_CRONTAB_LICENSE = LGPL-3.0+
 PYTHON_CRONTAB_LICENSE_FILES = COPYING
-- 
2.26.2
