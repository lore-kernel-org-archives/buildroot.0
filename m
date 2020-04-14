From: James Hilliard <james.hilliard1@gmail.com>
Date: Mon, 13 Apr 2020 19:26:24 -0600
Subject: [Buildroot] [PATCH 1/1] package/python-certifi: bump to version
 2020.4.5.1
Message-ID: <20200414012624.36568-1-james.hilliard1@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-certifi/python-certifi.hash | 6 +++---
 package/python-certifi/python-certifi.mk   | 4 ++--
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/python-certifi/python-certifi.hash b/package/python-certifi/python-certifi.hash
index 122ad55cad..698653d3c2 100644
--- a/package/python-certifi/python-certifi.hash
+++ b/package/python-certifi/python-certifi.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/certifi/json
-md5	cadd4e373fc08f649fa39b82aed9ad96  certifi-2019.9.11.tar.gz
-sha256	e4f3620cfea4f83eedc95b24abd9cd56f3c4b146dd0177e83a21b4eb49e21e50  certifi-2019.9.11.tar.gz
+md5  8e90cfd6fc5ddd7e3011958d8a7fcab4  certifi-2020.4.5.1.tar.gz
+sha256  51fcb31174be6e6664c5f69e3e1691a2d72a1a12e90f872cbdb1567eb47b6519  certifi-2020.4.5.1.tar.gz
 # Locally computed sha256 checksums
-sha256	6a70a4bf6b010016d59a64b8ae4ad8dc7f5ef16f1fb453cc2ecd771c5a341131  LICENSE
+sha256  6a70a4bf6b010016d59a64b8ae4ad8dc7f5ef16f1fb453cc2ecd771c5a341131  LICENSE
diff --git a/package/python-certifi/python-certifi.mk b/package/python-certifi/python-certifi.mk
index e614b8356e..324657dea6 100644
--- a/package/python-certifi/python-certifi.mk
+++ b/package/python-certifi/python-certifi.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_CERTIFI_VERSION = 2019.9.11
+PYTHON_CERTIFI_VERSION = 2020.4.5.1
 PYTHON_CERTIFI_SOURCE = certifi-$(PYTHON_CERTIFI_VERSION).tar.gz
-PYTHON_CERTIFI_SITE = https://files.pythonhosted.org/packages/62/85/7585750fd65599e88df0fed59c74f5075d4ea2fe611deceb95dd1c2fb25b
+PYTHON_CERTIFI_SITE = https://files.pythonhosted.org/packages/b8/e2/a3a86a67c3fc8249ed305fc7b7d290ebe5e4d46ad45573884761ef4dea7b
 PYTHON_CERTIFI_SETUP_TYPE = setuptools
 PYTHON_CERTIFI_LICENSE = ISC (Python code), MPL-2.0 (cacert.pem)
 PYTHON_CERTIFI_LICENSE_FILES = LICENSE
-- 
2.20.1
