From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 4 Apr 2021 15:37:19 +0200
Subject: [Buildroot] [git commit] package/python-hiredis: bump to version
 2.0.0
Message-ID: <20210404131209.14CF28C005@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=69405d89596988b5b7d25886b7f9c07efad70741
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Depends on BR2_PACKAGE_PYTHON3

Signed-off-by: Grzegorz Blach <grzegorz@blach.pl>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/python-hiredis/Config.in           | 1 +
 package/python-hiredis/python-hiredis.hash | 4 ++--
 package/python-hiredis/python-hiredis.mk   | 4 ++--
 3 files changed, 5 insertions(+), 4 deletions(-)

diff --git a/package/python-hiredis/Config.in b/package/python-hiredis/Config.in
index a401de055d..aacdc87cd2 100644
--- a/package/python-hiredis/Config.in
+++ b/package/python-hiredis/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_PYTHON_HIREDIS
 	bool "python-hiredis"
+	depends on BR2_PACKAGE_PYTHON3
 	help
 	  Python wrapper for hiredis.
 
diff --git a/package/python-hiredis/python-hiredis.hash b/package/python-hiredis/python-hiredis.hash
index 091532dd2a..2e73d2f37b 100644
--- a/package/python-hiredis/python-hiredis.hash
+++ b/package/python-hiredis/python-hiredis.hash
@@ -1,6 +1,6 @@
 # md5, sha256 from https://pypi.org/pypi/hiredis/json
-md5  430294afb3ebb37ebc7cc05bf3e5a389  hiredis-1.1.0.tar.gz
-sha256  996021ef33e0f50b97ff2d6b5f422a0fe5577de21a8873b58a779a5ddd1c3132  hiredis-1.1.0.tar.gz
+md5  0ab76a8b29deb737c9bfc7f631969e38  hiredis-2.0.0.tar.gz
+sha256  81d6d8e39695f2c37954d1011c0480ef7cf444d4e3ae24bc5e89ee5de360139a  hiredis-2.0.0.tar.gz
 # Locally computed sha256 checksums
 sha256  70edfa6d3e11f9d7497c2c2f298d06f33b11d10f37f76605102c5ab3b1f28262  COPYING
 sha256  dca05ce8fc87a8261783b4aed0deef8becc9350b6aa770bc714d0c1833b896eb  vendor/hiredis/COPYING
diff --git a/package/python-hiredis/python-hiredis.mk b/package/python-hiredis/python-hiredis.mk
index 7d871d1f03..55f9a09f55 100644
--- a/package/python-hiredis/python-hiredis.mk
+++ b/package/python-hiredis/python-hiredis.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_HIREDIS_VERSION = 1.1.0
+PYTHON_HIREDIS_VERSION = 2.0.0
 PYTHON_HIREDIS_SOURCE = hiredis-$(PYTHON_HIREDIS_VERSION).tar.gz
-PYTHON_HIREDIS_SITE = https://files.pythonhosted.org/packages/3d/9f/abc69e73055f73d42ddf9c46b3e01a08b9e74b579b8fc413cbd31112a749
+PYTHON_HIREDIS_SITE = https://files.pythonhosted.org/packages/0c/39/eae11344d69ba435ec13d6bcc1a9eea3d2278324506fcd0e52d1ed8958c8
 PYTHON_HIREDIS_SETUP_TYPE = setuptools
 PYTHON_HIREDIS_LICENSE = BSD-3-Clause
 PYTHON_HIREDIS_LICENSE_FILES = COPYING vendor/hiredis/COPYING
