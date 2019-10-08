From: haylocki at yahoo.co.uk <haylocki@yahoo.co.uk>
Date: Tue,  8 Oct 2019 21:08:06 +0100
Subject: [Buildroot] [PATCH] Signed-off-by: Ian Haylock
 <haylocki@yahoo.co.uk>
Message-ID: <20191008200806.25257-1-haylocki@yahoo.co.uk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Ian Haylock <haylocki@yahoo.co.uk>

package/python-rpi-gpio: bump version to 0.7.0
---
 package/python-rpi-gpio/python-rpi-gpio.hash | 7 ++++---
 package/python-rpi-gpio/python-rpi-gpio.mk   | 4 ++--
 2 files changed, 6 insertions(+), 5 deletions(-)

diff --git a/package/python-rpi-gpio/python-rpi-gpio.hash b/package/python-rpi-gpio/python-rpi-gpio.hash
index e8d390daf5..03a5344c25 100644
--- a/package/python-rpi-gpio/python-rpi-gpio.hash
+++ b/package/python-rpi-gpio/python-rpi-gpio.hash
@@ -1,3 +1,4 @@
-# md5 from https://pypi.python.org/pypi/rpi_gpio/json, sha256 locally computed
-md5 e4abe1cfb5eacebe53078032256eb837 RPi.GPIO-0.6.3.tar.gz
-sha256 a5fc0eb5e401963b6c0a03650da6b42c4005f02d962b81241d96c98d0a578516 RPi.GPIO-0.6.3.tar.gz
+# md5 from https://pypi.python.org/pypi/rpi_gpio/json
+# sha256 from https://pypi.python.org/pypi/rpi_gpio/json
+md5 777617f9dea9a1680f9af43db0cf150e RPi.GPIO-0.7.0.tar.gz
+sha256 7424bc6c205466764f30f666c18187a0824077daf20b295c42f08aea2cb87d3f RPi.GPIO-0.7.0.tar.gz
diff --git a/package/python-rpi-gpio/python-rpi-gpio.mk b/package/python-rpi-gpio/python-rpi-gpio.mk
index fd3267420b..dfc59c882e 100644
--- a/package/python-rpi-gpio/python-rpi-gpio.mk
+++ b/package/python-rpi-gpio/python-rpi-gpio.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_RPI_GPIO_VERSION = 0.6.3
+PYTHON_RPI_GPIO_VERSION = 0.7.0
 PYTHON_RPI_GPIO_SOURCE = RPi.GPIO-$(PYTHON_RPI_GPIO_VERSION).tar.gz
-PYTHON_RPI_GPIO_SITE = https://pypi.python.org/packages/e2/58/6e1b775606da6439fa3fd1550e7f714ac62aa75e162eed29dbec684ecb3e
+PYTHON_RPI_GPIO_SITE = https://sourceforge.net/projects/raspberry-gpio-python/files
 PYTHON_RPI_GPIO_LICENSE = MIT
 PYTHON_RPI_GPIO_LICENSE_FILES = LICENCE.txt
 PYTHON_RPI_GPIO_SETUP_TYPE = distutils
-- 
2.23.0
