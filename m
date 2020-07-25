From: Angelo Compagnucci <angelo@amarulasolutions.com>
Date: Sat, 25 Jul 2020 17:35:11 +0200
Subject: [Buildroot] [PATCH] package/python-spidev: bump to version 3.5
Message-ID: <20200725153511.104443-1-angelo@amarulasolutions.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This patch bump python-spidev to version 3.5

Signed-off-by: Angelo Compagnucci <angelo@amarulasolutions.com>
---
 package/python-spidev/python-spidev.hash | 2 +-
 package/python-spidev/python-spidev.mk   | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/python-spidev/python-spidev.hash b/package/python-spidev/python-spidev.hash
index d3d2b685ed..13128ee3e5 100644
--- a/package/python-spidev/python-spidev.hash
+++ b/package/python-spidev/python-spidev.hash
@@ -1,5 +1,5 @@
 # sha256 from https://pypi.org/project/spidev
-sha256	4314e52f573d95233c907f307558893313a8a606e197e77bb711526b0e179e80  spidev-3.4.tar.gz
+sha256	8a7f5c289f161ea2ac4697fa8a10918232c990678dd0053084b3c43b1363910d  spidev-3.5.tar.gz
 
 # locally computed
 sha256	153a6f02f41aebe292cf3307f973a80b4fb0c988d8d3e7d126c7a66c20b1cc27  README.md
diff --git a/package/python-spidev/python-spidev.mk b/package/python-spidev/python-spidev.mk
index 7f9bec7c93..a3da332926 100644
--- a/package/python-spidev/python-spidev.mk
+++ b/package/python-spidev/python-spidev.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_SPIDEV_VERSION = 3.4
+PYTHON_SPIDEV_VERSION = 3.5
 PYTHON_SPIDEV_SOURCE = spidev-$(PYTHON_SPIDEV_VERSION).tar.gz
-PYTHON_SPIDEV_SITE = https://files.pythonhosted.org/packages/fb/14/4c2e1640f0cb04862c76d9d76ed7c945b0f67876e503ac02f7f675fe86a0
+PYTHON_SPIDEV_SITE = https://files.pythonhosted.org/packages/62/56/de649e7d95f9fcfaf965a6eb937b4a46bc77ef21487c99cde1a7a0546040
 PYTHON_SPIDEV_SETUP_TYPE = distutils
 PYTHON_SPIDEV_LICENSE = MIT
 PYTHON_SPIDEV_LICENSE_FILES = README.md
-- 
2.25.1
