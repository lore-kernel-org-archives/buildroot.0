From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 02 Sep 2020 16:24:33 -0000
Subject: [Buildroot] [git commit] package/python-hiredis: bump to version
 1.1.0
Message-ID: <20200902161634.09BA085EB9@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=5e55791981a909eb609574ab1a321e208c4fde05
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Grzegorz Blach <grzegorz@blach.pl>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/python-hiredis/python-hiredis.hash | 8 ++++----
 package/python-hiredis/python-hiredis.mk   | 4 ++--
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/package/python-hiredis/python-hiredis.hash b/package/python-hiredis/python-hiredis.hash
index 1a013bb3a2..091532dd2a 100644
--- a/package/python-hiredis/python-hiredis.hash
+++ b/package/python-hiredis/python-hiredis.hash
@@ -1,6 +1,6 @@
 # md5, sha256 from https://pypi.org/pypi/hiredis/json
-md5	ad421ea848734c7be5c10689caa2a6f1  hiredis-1.0.1.tar.gz
-sha256	aa59dd63bb3f736de4fc2d080114429d5d369dfb3265f771778e8349d67a97a4  hiredis-1.0.1.tar.gz
+md5  430294afb3ebb37ebc7cc05bf3e5a389  hiredis-1.1.0.tar.gz
+sha256  996021ef33e0f50b97ff2d6b5f422a0fe5577de21a8873b58a779a5ddd1c3132  hiredis-1.1.0.tar.gz
 # Locally computed sha256 checksums
-sha256	70edfa6d3e11f9d7497c2c2f298d06f33b11d10f37f76605102c5ab3b1f28262  COPYING
-sha256	dca05ce8fc87a8261783b4aed0deef8becc9350b6aa770bc714d0c1833b896eb  vendor/hiredis/COPYING
+sha256  70edfa6d3e11f9d7497c2c2f298d06f33b11d10f37f76605102c5ab3b1f28262  COPYING
+sha256  dca05ce8fc87a8261783b4aed0deef8becc9350b6aa770bc714d0c1833b896eb  vendor/hiredis/COPYING
diff --git a/package/python-hiredis/python-hiredis.mk b/package/python-hiredis/python-hiredis.mk
index 435918feb6..7d871d1f03 100644
--- a/package/python-hiredis/python-hiredis.mk
+++ b/package/python-hiredis/python-hiredis.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_HIREDIS_VERSION = 1.0.1
+PYTHON_HIREDIS_VERSION = 1.1.0
 PYTHON_HIREDIS_SOURCE = hiredis-$(PYTHON_HIREDIS_VERSION).tar.gz
-PYTHON_HIREDIS_SITE = https://files.pythonhosted.org/packages/7f/5c/62e5c6b811b4dcef4125b4a01f76db82c496d79299dd67053b8f9c0732c0
+PYTHON_HIREDIS_SITE = https://files.pythonhosted.org/packages/3d/9f/abc69e73055f73d42ddf9c46b3e01a08b9e74b579b8fc413cbd31112a749
 PYTHON_HIREDIS_SETUP_TYPE = setuptools
 PYTHON_HIREDIS_LICENSE = BSD-3-Clause
 PYTHON_HIREDIS_LICENSE_FILES = COPYING vendor/hiredis/COPYING
