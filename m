From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 7 Mar 2016 11:04:28 +0100
Subject: [Buildroot] [git commit] python-rpi-gpio: fix typo
Message-ID: <20160307100609.AD7148184B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=cdb9306ed2d7fdb1ad57bd39f4275ba0a5528ce9
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

s/LICENSE.txt/LICENCE.txt

Fixes:
http://autobuild.buildroot.net/results/406/4060be5aed299b9fc197f2f8c398ca2800e7ec08/

Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/python-rpi-gpio/python-rpi-gpio.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/python-rpi-gpio/python-rpi-gpio.mk b/package/python-rpi-gpio/python-rpi-gpio.mk
index e71fdea..106b8dd 100755
--- a/package/python-rpi-gpio/python-rpi-gpio.mk
+++ b/package/python-rpi-gpio/python-rpi-gpio.mk
@@ -8,7 +8,7 @@ PYTHON_RPI_GPIO_VERSION = 0.6.1
 PYTHON_RPI_GPIO_SOURCE = RPi.GPIO-$(PYTHON_RPI_GPIO_VERSION).tar.gz
 PYTHON_RPI_GPIO_SITE = http://sourceforge.net/projects/raspberry-gpio-python/files
 PYTHON_RPI_GPIO_LICENSE = MIT
-PYTHON_RPI_GPIO_LICENSE_FILES = LICENSE.txt
+PYTHON_RPI_GPIO_LICENSE_FILES = LICENCE.txt
 PYTHON_RPI_GPIO_SETUP_TYPE = distutils
 
 $(eval $(python-package))
