From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 18 May 2021 13:55:51 +0200
Subject: [Buildroot] [git commit branch/next] package/python-pytest-asyncio:
 bump version to 0.15.1
Message-ID: <20210518112729.1A8E287B47@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=0b4cb8faeb0c4247d5d8589e7500d23f576d19bd
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Signed-off-by: Marcin Niestroj <m.niestroj@grinn-global.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/python-pytest-asyncio/python-pytest-asyncio.hash | 4 ++--
 package/python-pytest-asyncio/python-pytest-asyncio.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-pytest-asyncio/python-pytest-asyncio.hash b/package/python-pytest-asyncio/python-pytest-asyncio.hash
index 40541f54ba..4949919ecb 100644
--- a/package/python-pytest-asyncio/python-pytest-asyncio.hash
+++ b/package/python-pytest-asyncio/python-pytest-asyncio.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/pytest-asyncio/json
-md5  b63593bc08f445f6e3f14c34128a68ed  pytest-asyncio-0.14.0.tar.gz
-sha256  9882c0c6b24429449f5f969a5158b528f39bde47dc32e85b9f0403965017e700  pytest-asyncio-0.14.0.tar.gz
+md5  8940c41c342b5bafe2ebb0d6e5c320ec  pytest-asyncio-0.15.1.tar.gz
+sha256  2564ceb9612bbd560d19ca4b41347b54e7835c2f792c504f698e05395ed63f6f  pytest-asyncio-0.15.1.tar.gz
 # Locally computed sha256 checksums
 sha256  cb5e8e7e5f4a3988e1063c142c60dc2df75605f4c46515e776e3aca6df976e14  LICENSE
diff --git a/package/python-pytest-asyncio/python-pytest-asyncio.mk b/package/python-pytest-asyncio/python-pytest-asyncio.mk
index 0645db3eb7..bd2e0083a9 100644
--- a/package/python-pytest-asyncio/python-pytest-asyncio.mk
+++ b/package/python-pytest-asyncio/python-pytest-asyncio.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_PYTEST_ASYNCIO_VERSION = 0.14.0
+PYTHON_PYTEST_ASYNCIO_VERSION = 0.15.1
 PYTHON_PYTEST_ASYNCIO_SOURCE = pytest-asyncio-$(PYTHON_PYTEST_ASYNCIO_VERSION).tar.gz
-PYTHON_PYTEST_ASYNCIO_SITE = https://files.pythonhosted.org/packages/65/09/9472d4db0625cf56d40f4e405f955faf6469be00858a273b71332f3fcd1f
+PYTHON_PYTEST_ASYNCIO_SITE = https://files.pythonhosted.org/packages/de/c1/b2b0119e30f61f7ec8b44f129f6fde46a1a7329de17110f124639aa8896b
 PYTHON_PYTEST_ASYNCIO_SETUP_TYPE = setuptools
 PYTHON_PYTEST_ASYNCIO_LICENSE = Apache-2.0
 PYTHON_PYTEST_ASYNCIO_LICENSE_FILES = LICENSE
