From: Grzegorz Blach <grzegorz@blach.pl>
Date: Wed, 29 Jan 2020 13:51:09 +0100
Subject: [Buildroot] [PATCH] package/python-rpi-ws281x: Bump to version 4.2.3
Message-ID: <20200129125110.259038-1-grzegorz@blach.pl>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Grzegorz Blach <grzegorz@blach.pl>
---
 package/python-rpi-ws281x/python-rpi-ws281x.hash | 6 +++---
 package/python-rpi-ws281x/python-rpi-ws281x.mk   | 4 ++--
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/python-rpi-ws281x/python-rpi-ws281x.hash b/package/python-rpi-ws281x/python-rpi-ws281x.hash
index b009014fb1..5333baabb6 100644
--- a/package/python-rpi-ws281x/python-rpi-ws281x.hash
+++ b/package/python-rpi-ws281x/python-rpi-ws281x.hash
@@ -1,6 +1,6 @@
-# md5, sha256 from https://pypi.org/pypi/rpi_ws281x/json
-md5	7914013f6e0ee17ce23d51622d60761d  rpi_ws281x-4.2.2.tar.gz
-sha256	d06cd31217dec40d715a3a07ccb2b4b0b0719527c5aa020cbdd77d0c0b31d113  rpi_ws281x-4.2.2.tar.gz
+# md5, sha256 from https://pypi.org/pypi/rpi-ws281x/json
+md5	17a714941043621e81f592e6a137dd92  rpi_ws281x-4.2.3.tar.gz
+sha256	265a395410cc7199f779c4209ca3970b7211896b86dbaa4731bdc3569d2e595f  rpi_ws281x-4.2.3.tar.gz
 # Locally computed sha256 checksums
 sha256	7bbf6337c1eee7169579e6acd398f31ea274dfa3a1689ab7e654ca3585d5a8a9  LICENSE
 sha256	7bbf6337c1eee7169579e6acd398f31ea274dfa3a1689ab7e654ca3585d5a8a9  lib/LICENSE
diff --git a/package/python-rpi-ws281x/python-rpi-ws281x.mk b/package/python-rpi-ws281x/python-rpi-ws281x.mk
index 6c83cab417..899ad3d1e3 100644
--- a/package/python-rpi-ws281x/python-rpi-ws281x.mk
+++ b/package/python-rpi-ws281x/python-rpi-ws281x.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_RPI_WS281X_VERSION = 4.2.2
+PYTHON_RPI_WS281X_VERSION = 4.2.3
 PYTHON_RPI_WS281X_SOURCE = rpi_ws281x-$(PYTHON_RPI_WS281X_VERSION).tar.gz
-PYTHON_RPI_WS281X_SITE = https://files.pythonhosted.org/packages/3b/b3/cdc84887ead3f15b9f3f2b5fe2b48168757a606c6d08feb53536a8afb396
+PYTHON_RPI_WS281X_SITE = https://files.pythonhosted.org/packages/03/6c/46fad1bace9d5917190fd76e1550ec6727010cff6d3e5818b8c3a5405ba3
 PYTHON_RPI_WS281X_SETUP_TYPE = setuptools
 PYTHON_RPI_WS281X_LICENSE = MIT
 PYTHON_RPI_WS281X_LICENSE_FILES = LICENSE lib/LICENSE
-- 
2.25.0
