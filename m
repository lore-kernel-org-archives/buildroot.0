From: Grzegorz Blach <grzegorz@blach.pl>
Date: Tue, 28 Apr 2020 15:07:47 +0200
Subject: [Buildroot] [PATCH 1/2] package/python-crontab: bump to version
 2.4.2
Message-ID: <20200428130748.459546-1-grzegorz@blach.pl>
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
index f22e782a69..d0e5725708 100644
--- a/package/python-crontab/python-crontab.hash
+++ b/package/python-crontab/python-crontab.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/python-crontab/json
-md5  663bd09882c7caaa18be3c0cc0c7e716  python-crontab-2.4.1.tar.gz
-sha256  2366c7aa373118315de7c082401907bacd28e8b1e4e0a6d702334d17b89e71aa  python-crontab-2.4.1.tar.gz
+md5  65fe16d44568de2671d334a637e64a3b  python-crontab-2.4.2.tar.gz
+sha256  ed9583cff430715d9560cbad28309429ac13f3fdb13051ac2288050e05abc392  python-crontab-2.4.2.tar.gz
 # Locally computed sha256 checksums
 sha256  da7eabb7bafdf7d3ae5e9f223aa5bdc1eece45ac569dc21b3b037520b4464768  COPYING
diff --git a/package/python-crontab/python-crontab.mk b/package/python-crontab/python-crontab.mk
index 2abb4eed74..0c6109dd7f 100644
--- a/package/python-crontab/python-crontab.mk
+++ b/package/python-crontab/python-crontab.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-PYTHON_CRONTAB_VERSION = 2.4.1
-PYTHON_CRONTAB_SITE = https://files.pythonhosted.org/packages/09/b1/31d3ccf2ad3d4f7727b325ad7ea77d042e1939c5cacbf1d7478e391cca51
+PYTHON_CRONTAB_VERSION = 2.4.2
+PYTHON_CRONTAB_SITE = https://files.pythonhosted.org/packages/d1/c2/e92e801a0c504e62899d574a6d281d6e598861797c6798a664556d2bca8c
 PYTHON_CRONTAB_SETUP_TYPE = setuptools
 PYTHON_CRONTAB_LICENSE = LGPL-3.0+
 PYTHON_CRONTAB_LICENSE_FILES = COPYING
-- 
2.26.2
