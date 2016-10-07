From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 7 Oct 2016 15:15:19 +0200
Subject: [Buildroot] [git commit] package/python-rpi-gpio: bump version to
	0.6.2
Message-ID: <20161007131551.CC48B80089@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=43a60215f2aec9a7024bd5e2e790e721e96c005e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/python-rpi-gpio/python-rpi-gpio.hash | 6 +++---
 package/python-rpi-gpio/python-rpi-gpio.mk   | 4 ++--
 2 files changed, 5 insertions(+), 5 deletions(-)

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
