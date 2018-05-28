From: Angelo Compagnucci <angelo@amarulasolutions.com>
Date: Mon, 28 May 2018 20:10:00 +0200
Subject: [Buildroot] [PATCH] package/python-can: bump to version 2.1.0
Message-ID: <1527531000-7304-1-git-send-email-angelo@amarulasolutions.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This patch bumps python-can to version 2.1.0.

Signed-off-by: Angelo Compagnucci <angelo@amarulasolutions.com>
---
 package/python-can/python-can.hash | 4 ++--
 package/python-can/python-can.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-can/python-can.hash b/package/python-can/python-can.hash
index bd19d19..8a70bb4 100644
--- a/package/python-can/python-can.hash
+++ b/package/python-can/python-can.hash
@@ -1,3 +1,3 @@
 # md5 from https://pypi.python.org/pypi/python-can/json, sha256 locally computed
-md5     f653aecf8b9034bbba32cc04ca6a7b6d  python-can-1.5.2.tar.gz
-sha256  edabb426e6cd11c2dc7a98980340135aa0eb02143b0d51bf14e3e6178c131cc3  python-can-1.5.2.tar.gz
+md5     3310f0aa2a8492d0ff614ecf636ec8a8  python-can-2.1.0.tar.gz
+sha256  4a5c01dd67feeda35f88e6c12ea14ac8cabd426b9be0cc5f9fd083fe90a9dbfc  python-can-2.1.0.tar.gz
diff --git a/package/python-can/python-can.mk b/package/python-can/python-can.mk
index a271bae..9a7e903 100644
--- a/package/python-can/python-can.mk
+++ b/package/python-can/python-can.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-PYTHON_CAN_VERSION = 1.5.2
-PYTHON_CAN_SITE = https://pypi.python.org/packages/a1/b1/80f023e2b728c7ebccbf989aec777f3add3dd4cee650573ce5d38132a07c
+PYTHON_CAN_VERSION = 2.1.0
+PYTHON_CAN_SITE = https://files.pythonhosted.org/packages/04/87/0d5b0f2f4e5d7f64a44f74b7f0bc1668457e6aa7e90b04ad15c3b9a44411
 PYTHON_CAN_LICENSE = LGPL-3.0
 PYTHON_CAN_LICENSE_FILES = LICENSE.txt
 PYTHON_CAN_SETUP_TYPE = setuptools
-- 
2.7.4
