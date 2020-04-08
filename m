From: Grzegorz Blach <grzegorz@blach.pl>
Date: Wed,  8 Apr 2020 13:48:08 +0200
Subject: [Buildroot] [PATCH 2/2] package/python-crontab: bump to version
 2.4.1
In-Reply-To: <20200408114809.8954-1-grzegorz@blach.pl>
References: <20200408114809.8954-1-grzegorz@blach.pl>
Message-ID: <20200408114809.8954-2-grzegorz@blach.pl>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Grzegorz Blach <grzegorz@blach.pl>
---
 package/python-crontab/python-crontab.hash | 6 +++---
 package/python-crontab/python-crontab.mk   | 4 ++--
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/python-crontab/python-crontab.hash b/package/python-crontab/python-crontab.hash
index c4f3636f5c..f22e782a69 100644
--- a/package/python-crontab/python-crontab.hash
+++ b/package/python-crontab/python-crontab.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/python-crontab/json
-md5	e1f2ca65e0218a85c724e3d6058da2a3  python-crontab-2.4.0.tar.gz
-sha256	3ac1608ff76032e6fc6e16b5fbf83b51557e0e066bf78e9f88571571e7bd7ae6  python-crontab-2.4.0.tar.gz
+md5  663bd09882c7caaa18be3c0cc0c7e716  python-crontab-2.4.1.tar.gz
+sha256  2366c7aa373118315de7c082401907bacd28e8b1e4e0a6d702334d17b89e71aa  python-crontab-2.4.1.tar.gz
 # Locally computed sha256 checksums
-sha256	da7eabb7bafdf7d3ae5e9f223aa5bdc1eece45ac569dc21b3b037520b4464768  COPYING
+sha256  da7eabb7bafdf7d3ae5e9f223aa5bdc1eece45ac569dc21b3b037520b4464768  COPYING
diff --git a/package/python-crontab/python-crontab.mk b/package/python-crontab/python-crontab.mk
index f6bf8d7072..2abb4eed74 100644
--- a/package/python-crontab/python-crontab.mk
+++ b/package/python-crontab/python-crontab.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-PYTHON_CRONTAB_VERSION = 2.4.0
-PYTHON_CRONTAB_SITE = https://files.pythonhosted.org/packages/bc/03/852f9c5f8da7f58abce06fe8ae769cbcf6502f1c60684b16bad72ffcced3
+PYTHON_CRONTAB_VERSION = 2.4.1
+PYTHON_CRONTAB_SITE = https://files.pythonhosted.org/packages/09/b1/31d3ccf2ad3d4f7727b325ad7ea77d042e1939c5cacbf1d7478e391cca51
 PYTHON_CRONTAB_SETUP_TYPE = setuptools
 PYTHON_CRONTAB_LICENSE = LGPL-3.0+
 PYTHON_CRONTAB_LICENSE_FILES = COPYING
-- 
2.18.2
