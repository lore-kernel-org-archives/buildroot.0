From: James Hilliard <james.hilliard1@gmail.com>
Date: Mon, 23 Nov 2020 19:12:59 -0700
Subject: [Buildroot] [PATCH 1/1] package/python-serial: bump to version 3.5
Message-ID: <20201124021259.2301618-1-james.hilliard1@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

License hash changed due to year update.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-serial/python-serial.hash | 6 +++---
 package/python-serial/python-serial.mk   | 4 ++--
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/python-serial/python-serial.hash b/package/python-serial/python-serial.hash
index 96209a9965..d885d3c0c8 100644
--- a/package/python-serial/python-serial.hash
+++ b/package/python-serial/python-serial.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/pyserial/json
-md5     ed6183b15519a0ae96675e9c3330c69b  pyserial-3.4.tar.gz
-sha256  6e2d401fdee0eab996cf734e67773a0143b932772ca8b42451440cfed942c627  pyserial-3.4.tar.gz
+md5  1cf25a76da59b530dbfc2cf99392dc83  pyserial-3.5.tar.gz
+sha256  3c77e014170dfffbd816e6ffc205e9842efb10be9f58ec16d3e8675b4925cddb  pyserial-3.5.tar.gz
 # Locally computed sha256 checksums
-sha256	a89d951d157e2c199fbbe7ecf8d41bc3bc93de166db524aa6b9b610dbccc832d  LICENSE.txt
+sha256  f91cb9813de6a5b142b8f7f2dede630b5134160aedaeaf55f4d6a7e2593ca3f3  LICENSE.txt
diff --git a/package/python-serial/python-serial.mk b/package/python-serial/python-serial.mk
index d583ac65ab..249ea9d5a3 100644
--- a/package/python-serial/python-serial.mk
+++ b/package/python-serial/python-serial.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_SERIAL_VERSION = 3.4
+PYTHON_SERIAL_VERSION = 3.5
 PYTHON_SERIAL_SOURCE = pyserial-$(PYTHON_SERIAL_VERSION).tar.gz
-PYTHON_SERIAL_SITE = https://files.pythonhosted.org/packages/cc/74/11b04703ec416717b247d789103277269d567db575d2fd88f25d9767fe3d
+PYTHON_SERIAL_SITE = https://files.pythonhosted.org/packages/1e/7d/ae3f0a63f41e4d2f6cb66a5b57197850f919f59e558159a4dd3a818f5082
 PYTHON_SERIAL_LICENSE = BSD-3-Clause
 PYTHON_SERIAL_LICENSE_FILES = LICENSE.txt
 PYTHON_SERIAL_SETUP_TYPE = setuptools
-- 
2.25.1
