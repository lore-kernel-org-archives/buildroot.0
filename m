From: James Hilliard <james.hilliard1@gmail.com>
Date: Mon, 23 Nov 2020 19:07:37 -0700
Subject: [Buildroot] [PATCH 1/1] package/python-serial-asyncio: bump to
 version 0.5
Message-ID: <20201124020737.2280532-1-james.hilliard1@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

License hash changed due to year update.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-serial-asyncio/python-serial-asyncio.hash | 6 +++---
 package/python-serial-asyncio/python-serial-asyncio.mk   | 4 ++--
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/python-serial-asyncio/python-serial-asyncio.hash b/package/python-serial-asyncio/python-serial-asyncio.hash
index 268c7d83f5..f5d1d9e485 100644
--- a/package/python-serial-asyncio/python-serial-asyncio.hash
+++ b/package/python-serial-asyncio/python-serial-asyncio.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/pyserial-asyncio/json
-md5     67244fdc11cc31cf0ebf675c271c71d8  pyserial-asyncio-0.4.tar.gz
-sha256  c40677a8874d8c24d4423a97498746de776f6dbcd0efbb8fa43dcf011a589aee  pyserial-asyncio-0.4.tar.gz
+md5  64d15bfb20982b2129b02070321f49f3  pyserial-asyncio-0.5.tar.gz
+sha256  1641e5433a866eeaf6464b3ab88b741e7a89dd8cd0f851b3343b15f425138d33  pyserial-asyncio-0.5.tar.gz
 # Locally computed sha256 checksums
-sha256	f8ded3a7460d3b2850b0cf673e986c70e9d997fd0732d8ab3f3c84f1f191087d  LICENSE.txt
+sha256  ebc84abdbdec7f9fa6962612c110123897db47b79529d5ae41191ef584b88f2c  LICENSE.txt
diff --git a/package/python-serial-asyncio/python-serial-asyncio.mk b/package/python-serial-asyncio/python-serial-asyncio.mk
index 39c3476d9e..bc95f2c44a 100644
--- a/package/python-serial-asyncio/python-serial-asyncio.mk
+++ b/package/python-serial-asyncio/python-serial-asyncio.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_SERIAL_ASYNCIO_VERSION = 0.4
+PYTHON_SERIAL_ASYNCIO_VERSION = 0.5
 PYTHON_SERIAL_ASYNCIO_SOURCE = pyserial-asyncio-$(PYTHON_SERIAL_ASYNCIO_VERSION).tar.gz
-PYTHON_SERIAL_ASYNCIO_SITE = https://files.pythonhosted.org/packages/41/3f/e26f71269cbc0890a527a736d9afc5c0d5838a2c188be680558d635b7dc2
+PYTHON_SERIAL_ASYNCIO_SITE = https://files.pythonhosted.org/packages/e1/97/8dd1bf656796668ed4bd86058c815b130303a00a7b70cf79758e4918814a
 PYTHON_SERIAL_ASYNCIO_LICENSE = BSD-3-Clause
 PYTHON_SERIAL_ASYNCIO_LICENSE_FILES = LICENSE.txt
 PYTHON_SERIAL_ASYNCIO_SETUP_TYPE = setuptools
-- 
2.25.1
