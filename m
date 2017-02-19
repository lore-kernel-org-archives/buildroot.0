From: Adam Duskett <aduskett@gmail.com>
Date: Sun, 19 Feb 2017 14:12:45 -0500
Subject: [Buildroot] [PATCH 48/58] python-rpi-gpio: bump to version 0.6.3
In-Reply-To: <20170219191255.1503-1-Adamduskett@outlook.com>
References: <20170219191255.1503-1-Adamduskett@outlook.com>
Message-ID: <20170219191255.1503-49-Adamduskett@outlook.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Adam Duskett <Adamduskett@outlook.com>
---
 package/python-rpi-gpio/python-rpi-gpio.hash | 6 +++---
 package/python-rpi-gpio/python-rpi-gpio.mk   | 4 ++--
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/python-rpi-gpio/python-rpi-gpio.hash b/package/python-rpi-gpio/python-rpi-gpio.hash
index a502972..e8d390d 100644
--- a/package/python-rpi-gpio/python-rpi-gpio.hash
+++ b/package/python-rpi-gpio/python-rpi-gpio.hash
@@ -1,3 +1,3 @@
-# md5 from https://pypi.python.org/pypi/rpi-gpio/json, sha256 locally computed
-md5	9db86fd5f3bae872de9dbb068ee0b096  RPi.GPIO-0.6.2.tar.gz
-sha256	82acff0ef6bbe3cdf6f4dbdd73d96add5294bb94baf7f51c1d901861af3c2392  RPi.GPIO-0.6.2.tar.gz
+# md5 from https://pypi.python.org/pypi/rpi_gpio/json, sha256 locally computed
+md5 e4abe1cfb5eacebe53078032256eb837 RPi.GPIO-0.6.3.tar.gz
+sha256 a5fc0eb5e401963b6c0a03650da6b42c4005f02d962b81241d96c98d0a578516 RPi.GPIO-0.6.3.tar.gz
diff --git a/package/python-rpi-gpio/python-rpi-gpio.mk b/package/python-rpi-gpio/python-rpi-gpio.mk
index 8f02d16..fd32674 100644
--- a/package/python-rpi-gpio/python-rpi-gpio.mk
+++ b/package/python-rpi-gpio/python-rpi-gpio.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_RPI_GPIO_VERSION = 0.6.2
+PYTHON_RPI_GPIO_VERSION = 0.6.3
 PYTHON_RPI_GPIO_SOURCE = RPi.GPIO-$(PYTHON_RPI_GPIO_VERSION).tar.gz
-PYTHON_RPI_GPIO_SITE = https://pypi.python.org/packages/c1/a8/de92cf6d04376f541ce250de420f4fe7cbb2b32a7128929a600bc89aede5
+PYTHON_RPI_GPIO_SITE = https://pypi.python.org/packages/e2/58/6e1b775606da6439fa3fd1550e7f714ac62aa75e162eed29dbec684ecb3e
 PYTHON_RPI_GPIO_LICENSE = MIT
 PYTHON_RPI_GPIO_LICENSE_FILES = LICENCE.txt
 PYTHON_RPI_GPIO_SETUP_TYPE = distutils
-- 
2.9.3
