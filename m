From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Thu,  6 Oct 2016 21:29:37 +0200
Subject: [Buildroot] [PATCH 10/21] package/python-rpi-gpio: bump version to
	0.6.2
In-Reply-To: <20161006192948.27956-1-bernd.kuhls@t-online.de>
References: <20161006192948.27956-1-bernd.kuhls@t-online.de>
Message-ID: <20161006192948.27956-10-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/python-rpi-gpio/python-rpi-gpio.hash | 6 +++---
 package/python-rpi-gpio/python-rpi-gpio.mk   | 4 ++--
 2 files changed, 5 insertions(+), 5 deletions(-)
 mode change 100755 => 100644 package/python-rpi-gpio/python-rpi-gpio.hash
 mode change 100755 => 100644 package/python-rpi-gpio/python-rpi-gpio.mk

diff --git a/package/python-rpi-gpio/python-rpi-gpio.hash b/package/python-rpi-gpio/python-rpi-gpio.hash
old mode 100755
new mode 100644
index 8b498f1..a502972
--- a/package/python-rpi-gpio/python-rpi-gpio.hash
+++ b/package/python-rpi-gpio/python-rpi-gpio.hash
@@ -1,3 +1,3 @@
-# md5sum from http://sourceforge.net/projects/raspberry-gpio-python/files/, sha256 calculated locally
-md5	254d0443a436eb241367c487274e7197	RPi.GPIO-0.6.1.tar.gz
-sha256	54e5fb06d9ea1a1389a497fb5a06dfa950c86303b0f4ba89b68c55999d1df064	RPi.GPIO-0.6.1.tar.gz
+# md5 from https://pypi.python.org/pypi/rpi-gpio/json, sha256 locally computed
+md5	9db86fd5f3bae872de9dbb068ee0b096  RPi.GPIO-0.6.2.tar.gz
+sha256	82acff0ef6bbe3cdf6f4dbdd73d96add5294bb94baf7f51c1d901861af3c2392  RPi.GPIO-0.6.2.tar.gz
diff --git a/package/python-rpi-gpio/python-rpi-gpio.mk b/package/python-rpi-gpio/python-rpi-gpio.mk
old mode 100755
new mode 100644
index 106b8dd..8f02d16
--- a/package/python-rpi-gpio/python-rpi-gpio.mk
+++ b/package/python-rpi-gpio/python-rpi-gpio.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_RPI_GPIO_VERSION = 0.6.1
+PYTHON_RPI_GPIO_VERSION = 0.6.2
 PYTHON_RPI_GPIO_SOURCE = RPi.GPIO-$(PYTHON_RPI_GPIO_VERSION).tar.gz
-PYTHON_RPI_GPIO_SITE = http://sourceforge.net/projects/raspberry-gpio-python/files
+PYTHON_RPI_GPIO_SITE = https://pypi.python.org/packages/c1/a8/de92cf6d04376f541ce250de420f4fe7cbb2b32a7128929a600bc89aede5
 PYTHON_RPI_GPIO_LICENSE = MIT
 PYTHON_RPI_GPIO_LICENSE_FILES = LICENCE.txt
 PYTHON_RPI_GPIO_SETUP_TYPE = distutils
-- 
2.9.3
