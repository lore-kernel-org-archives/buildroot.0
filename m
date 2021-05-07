From: Marcin Niestroj <m.niestroj@grinn-global.com>
Date: Fri,  7 May 2021 19:43:55 +0200
Subject: [Buildroot] [PATCH] package/python-pytest: bump to version 6.2.4
Message-ID: <20210507174355.1546239-1-m.niestroj@grinn-global.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Marcin Niestroj <m.niestroj@grinn-global.com>
---
 package/python-pytest/python-pytest.hash | 4 ++--
 package/python-pytest/python-pytest.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-pytest/python-pytest.hash b/package/python-pytest/python-pytest.hash
index 8c2a85c922..667493a5dc 100644
--- a/package/python-pytest/python-pytest.hash
+++ b/package/python-pytest/python-pytest.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/pytest/json
-md5	91a421ffffe3310096b4273b2fa13819  pytest-6.1.2.tar.gz
-sha256	c0a7e94a8cdbc5422a51ccdad8e6f1024795939cc89159a0ae7f0b316ad3823e  pytest-6.1.2.tar.gz
+md5	78d75c37901f5df462afc86acaa443cd  pytest-6.2.4.tar.gz
+sha256	50bcad0a0b9c5a72c8e4e7c9855a3ad496ca6a881a3641b4260605450772c54b  pytest-6.2.4.tar.gz
 # Locally computer sha256
 sha256	7898b9b164d4f93fd9a562fd0f592935518b48c4745303964110eb7f7fe64faf  LICENSE
diff --git a/package/python-pytest/python-pytest.mk b/package/python-pytest/python-pytest.mk
index d47ec0f430..6463b23687 100644
--- a/package/python-pytest/python-pytest.mk
+++ b/package/python-pytest/python-pytest.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_PYTEST_VERSION = 6.1.2
+PYTHON_PYTEST_VERSION = 6.2.4
 PYTHON_PYTEST_SOURCE = pytest-$(PYTHON_PYTEST_VERSION).tar.gz
-PYTHON_PYTEST_SITE = https://files.pythonhosted.org/packages/d4/df/bd7c25c4fe809a17315b3fc9878edf48d31dde7b431b6836848b063c0428
+PYTHON_PYTEST_SITE = https://files.pythonhosted.org/packages/5b/98/92bbda5f83ed995ef8953349ef30c77c934abcc251c42ab3d7787a40c49c
 PYTHON_PYTEST_SETUP_TYPE = setuptools
 PYTHON_PYTEST_LICENSE = MIT
 PYTHON_PYTEST_LICENSE_FILES = LICENSE
-- 
2.31.1
