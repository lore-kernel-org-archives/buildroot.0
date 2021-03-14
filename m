From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 14 Mar 2021 14:00:12 +0100
Subject: [Buildroot] [git commit] package/python-rpi-ws281x: bump to version
 4.2.6
Message-ID: <20210314123646.4C0EB80AE8@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=f21d46bf99e2c3a86a86586bc3e82b214104cd30
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Grzegorz Blach <grzegorz@blach.pl>
[yann.morin.1998 at free.fr: move license fix to its own commit]
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/python-rpi-ws281x/python-rpi-ws281x.hash | 4 ++--
 package/python-rpi-ws281x/python-rpi-ws281x.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-rpi-ws281x/python-rpi-ws281x.hash b/package/python-rpi-ws281x/python-rpi-ws281x.hash
index 54d91a6df0..cb021a821d 100644
--- a/package/python-rpi-ws281x/python-rpi-ws281x.hash
+++ b/package/python-rpi-ws281x/python-rpi-ws281x.hash
@@ -1,6 +1,6 @@
 # md5, sha256 from https://pypi.org/pypi/rpi-ws281x/json
-md5  8eb175e05905ee7a00bb5fd2f1b15e40  rpi_ws281x-4.2.4.tar.gz
-sha256  7175e708d6085bc02a9d0b8227797d697e34fd00787030ae5f119fe2f4f90889  rpi_ws281x-4.2.4.tar.gz
+md5  5da00a092ac3755c4913f5a53451744b  rpi_ws281x-4.2.6.tar.gz
+sha256  65a9918fbdd9df1ac612ccc1a385d4a550f1bc74cc6bbf6b9035ad26dc41b3ce  rpi_ws281x-4.2.6.tar.gz
 # Locally computed sha256 checksums
 sha256  7bbf6337c1eee7169579e6acd398f31ea274dfa3a1689ab7e654ca3585d5a8a9  LICENSE
 sha256  7bbf6337c1eee7169579e6acd398f31ea274dfa3a1689ab7e654ca3585d5a8a9  lib/LICENSE
diff --git a/package/python-rpi-ws281x/python-rpi-ws281x.mk b/package/python-rpi-ws281x/python-rpi-ws281x.mk
index 1da2a77462..b8ba119919 100644
--- a/package/python-rpi-ws281x/python-rpi-ws281x.mk
+++ b/package/python-rpi-ws281x/python-rpi-ws281x.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_RPI_WS281X_VERSION = 4.2.4
+PYTHON_RPI_WS281X_VERSION = 4.2.6
 PYTHON_RPI_WS281X_SOURCE = rpi_ws281x-$(PYTHON_RPI_WS281X_VERSION).tar.gz
-PYTHON_RPI_WS281X_SITE = https://files.pythonhosted.org/packages/3b/99/0f74f2d303e03432d10b11dab240cb15afad1bc6ab9a1449c9bc08af2ee4
+PYTHON_RPI_WS281X_SITE = https://files.pythonhosted.org/packages/7f/1e/ea9ff56d9823fc55c79748630ffe0ceb30f619c9218743050bbf96d08704
 PYTHON_RPI_WS281X_SETUP_TYPE = setuptools
 PYTHON_RPI_WS281X_LICENSE = BSD-2-Clause
 PYTHON_RPI_WS281X_LICENSE_FILES = LICENSE lib/LICENSE
