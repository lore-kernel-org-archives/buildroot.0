From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 3 Apr 2017 14:56:23 +0200
Subject: [Buildroot] [git commit] python-serial: fix legal info
Message-ID: <20170403125752.7601882675@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=705c0c2292825adbdaf613a592521853c534bcdf
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

python-serial is provided under BSD-3-Clause license.

Signed-off-by: Rahul Bedarkar <rahulbedarkar89@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/python-serial/python-serial.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/python-serial/python-serial.mk b/package/python-serial/python-serial.mk
index 4b3ffad..ce7ec07 100644
--- a/package/python-serial/python-serial.mk
+++ b/package/python-serial/python-serial.mk
@@ -7,7 +7,7 @@
 PYTHON_SERIAL_VERSION = 3.1
 PYTHON_SERIAL_SOURCE = pyserial-$(PYTHON_SERIAL_VERSION).tar.gz
 PYTHON_SERIAL_SITE = https://pypi.python.org/packages/ce/9c/694ce79a9d4a164e109aeba1a40fba23336f3b7554978553e22a5d41d54d
-PYTHON_SERIAL_LICENSE = Python Software Foundation License
+PYTHON_SERIAL_LICENSE = BSD-3-Clause
 PYTHON_SERIAL_LICENSE_FILES = LICENSE.txt
 PYTHON_SERIAL_SETUP_TYPE = setuptools
 
