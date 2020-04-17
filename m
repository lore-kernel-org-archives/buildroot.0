From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 17 Apr 2020 21:40:49 +0200
Subject: [Buildroot] [git commit] package/python-tabledata: bump to version
 1.1.2
Message-ID: <20200417192946.60F9C8EEBF@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=d99b20e66e848c69e23bfbdfc84cab11575fa47b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/python-tabledata/python-tabledata.hash | 6 +++---
 package/python-tabledata/python-tabledata.mk   | 4 ++--
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/python-tabledata/python-tabledata.hash b/package/python-tabledata/python-tabledata.hash
index 9d8564db30..5c9a538f66 100644
--- a/package/python-tabledata/python-tabledata.hash
+++ b/package/python-tabledata/python-tabledata.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/tabledata/json
-md5	3a97a7bd3f2687a139578a79353a8188  tabledata-0.9.1.tar.gz
-sha256	a2c59603ecb56cd2161a72978d56876377ba6a27a3e6d87e1874ba4d5ab02796  tabledata-0.9.1.tar.gz
+md5  7d1ab52001d85d19d86f08a5ad8aab58  tabledata-1.1.2.tar.gz
+sha256  db893596ab9066e5c4f002ae0fed70657e3b75cceb52dd1de5a0e145e338d830  tabledata-1.1.2.tar.gz
 # Locally computed sha256 checksums
-sha256	bebbdf0524a147f89a615fff53d79bdc90cbc7631550fb4b725cd3f3bdcd24f6  LICENSE
+sha256  bebbdf0524a147f89a615fff53d79bdc90cbc7631550fb4b725cd3f3bdcd24f6  LICENSE
diff --git a/package/python-tabledata/python-tabledata.mk b/package/python-tabledata/python-tabledata.mk
index c1381928c4..c1503e69cb 100644
--- a/package/python-tabledata/python-tabledata.mk
+++ b/package/python-tabledata/python-tabledata.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_TABLEDATA_VERSION = 0.9.1
+PYTHON_TABLEDATA_VERSION = 1.1.2
 PYTHON_TABLEDATA_SOURCE = tabledata-$(PYTHON_TABLEDATA_VERSION).tar.gz
-PYTHON_TABLEDATA_SITE = https://files.pythonhosted.org/packages/7d/20/7178ce0e3e34d5aff07e2280522b7e1bc23d4f2fbb916b765bbb41b22174
+PYTHON_TABLEDATA_SITE = https://files.pythonhosted.org/packages/73/7c/67eec8e92504b8e00e5cc0053a3401bd1441eefc70cecfa4427bfcf76b89
 PYTHON_TABLEDATA_SETUP_TYPE = setuptools
 PYTHON_TABLEDATA_LICENSE = MIT
 PYTHON_TABLEDATA_LICENSE_FILES = LICENSE
