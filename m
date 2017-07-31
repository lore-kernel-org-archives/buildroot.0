From: Adam Duskett <aduskett@gmail.com>
Date: Mon, 31 Jul 2017 10:22:10 -0400
Subject: [Buildroot] [PATCH v2 2/2] python-systemd: bump to version 234
In-Reply-To: <20170731142210.24593-1-aduskett@gmail.com>
References: <20170731142210.24593-1-aduskett@gmail.com>
Message-ID: <20170731142210.24593-2-aduskett@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Adam Duskett <aduskett@gmail.com>
---
Changes v1 -> v2:
  - Added to patch series.

 package/python-systemd/python-systemd.hash | 4 ++--
 package/python-systemd/python-systemd.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-systemd/python-systemd.hash b/package/python-systemd/python-systemd.hash
index a645bec0f..ae480b8fe 100644
--- a/package/python-systemd/python-systemd.hash
+++ b/package/python-systemd/python-systemd.hash
@@ -1,3 +1,3 @@
 # md5 from https://pypi.python.org/pypi/systemd-python/, sha256 locally computed
-md5 8438acab31e6f1e3e963d36f3de62faa systemd-python-233.tar.gz
-sha256 06a3768b744884565d7961b44f4a51d164765bc59692f0f85ea6f11330a17da4 systemd-python-233.tar.gz
+md5 5071ea5bcb976186e92a3f5e75df221d systemd-python-234.tar.gz
+sha256 fd0e44bf70eadae45aadc292cb0a7eb5b0b6372cd1b391228047d33895db83e7 systemd-python-234.tar.gz
diff --git a/package/python-systemd/python-systemd.mk b/package/python-systemd/python-systemd.mk
index 242a2ea12..3ccfd57ce 100644
--- a/package/python-systemd/python-systemd.mk
+++ b/package/python-systemd/python-systemd.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_SYSTEMD_VERSION = 233 # Should be kept in sync with $(SYSTEMD_VERSION)
+PYTHON_SYSTEMD_VERSION = 234 # Should be kept in sync with $(SYSTEMD_VERSION)
 PYTHON_SYSTEMD_SOURCE = systemd-python-$(PYTHON_SYSTEMD_VERSION).tar.gz
-PYTHON_SYSTEMD_SITE = https://pypi.python.org/packages/10/89/d66ae73bdbc2614e4f2e90ddf9ef80d22c28f3cd70071345c3640465c14c
+PYTHON_SYSTEMD_SITE = https://pypi.python.org/packages/e8/a8/00ba0f605837a8f69523e6c3a4fb14675a6430c163f836540129c50b3aef
 PYTHON_SYSTEMD_SETUP_TYPE = distutils
 PYTHON_SYSTEMD_LICENSE = LGPL-2.1
 PYTHON_SYSTEMD_LICENSE_FILES = LICENSE.txt
-- 
2.13.3
