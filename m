From: Gwenhael Goavec-Merou <gwenj@trabucayre.com>
Date: Mon, 28 Jun 2021 11:54:45 +0200
Subject: [Buildroot] [PATCH] package/python-cheetah: Bump version to 3.2.6
Message-ID: <20210628095445.1416769-1-gwenj@trabucayre.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>

Signed-off-by: Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>
---
 package/python-cheetah/python-cheetah.hash | 4 ++--
 package/python-cheetah/python-cheetah.mk   | 4 ++--
 package/python3-cheetah/python3-cheetah.mk | 4 ++--
 3 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/package/python-cheetah/python-cheetah.hash b/package/python-cheetah/python-cheetah.hash
index 286b41fd9e..f7094a8bb1 100644
--- a/package/python-cheetah/python-cheetah.hash
+++ b/package/python-cheetah/python-cheetah.hash
@@ -1,5 +1,5 @@
 # From https://pypi.org/pypi/Cheetah3/json
-md5  8c0ac643263ffc3454fb321342284d0a  Cheetah3-3.2.4.tar.gz
-sha256	caabb9c22961a3413ac85cd1e5525ec9ca80daeba6555f4f60802b6c256e252b  Cheetah3-3.2.4.tar.gz
+md5  42bb9da785974c7e4089aa754ff99a73  Cheetah3-3.2.6.post2.tar.gz
+sha256	63157d7a00a273b59676b5be5aa817c75c37efc88478231f1a160f4cfb7f7878  Cheetah3-3.2.6.post2.tar.gz
 # Locally computed sha256 checksums
 sha256  635349ae512fafc2e60eb74a50d0a5276fa06c00b5ecb20da53546449ddc45ea  LICENSE
diff --git a/package/python-cheetah/python-cheetah.mk b/package/python-cheetah/python-cheetah.mk
index 3dfd1fc54a..02877e03c4 100644
--- a/package/python-cheetah/python-cheetah.mk
+++ b/package/python-cheetah/python-cheetah.mk
@@ -5,9 +5,9 @@
 ################################################################################
 
 # Please keep in sync with package/python3-cheetah/python3-cheetah.mk
-PYTHON_CHEETAH_VERSION = 3.2.4
+PYTHON_CHEETAH_VERSION = 3.2.6.post2
 PYTHON_CHEETAH_SOURCE = Cheetah3-$(PYTHON_CHEETAH_VERSION).tar.gz
-PYTHON_CHEETAH_SITE = https://files.pythonhosted.org/packages/4e/72/e6a7d92279e3551db1b68fd336fd7a6e3d2f2ec742bf486486e6150d77d2
+PYTHON_CHEETAH_SITE = https://files.pythonhosted.org/packages/c0/97/c3fa47e223207e6ca6b501a954c5c959ed3e99f2a1ceec9918238ce38418
 PYTHON_CHEETAH_LICENSE = MIT
 PYTHON_CHEETAH_LICENSE_FILES = LICENSE
 PYTHON_CHEETAH_SETUP_TYPE = setuptools
diff --git a/package/python3-cheetah/python3-cheetah.mk b/package/python3-cheetah/python3-cheetah.mk
index 8876f8d735..93d16201aa 100644
--- a/package/python3-cheetah/python3-cheetah.mk
+++ b/package/python3-cheetah/python3-cheetah.mk
@@ -6,9 +6,9 @@
 
 # Please keep in sync with
 # package/python-cheetah/python-cheetah.mk
-PYTHON3_CHEETAH_VERSION = 3.2.4
+PYTHON3_CHEETAH_VERSION = 3.2.6.post2
 PYTHON3_CHEETAH_SOURCE = Cheetah3-$(PYTHON3_CHEETAH_VERSION).tar.gz
-PYTHON3_CHEETAH_SITE = https://files.pythonhosted.org/packages/4e/72/e6a7d92279e3551db1b68fd336fd7a6e3d2f2ec742bf486486e6150d77d2
+PYTHON3_CHEETAH_SITE = https://files.pythonhosted.org/packages/c0/97/c3fa47e223207e6ca6b501a954c5c959ed3e99f2a1ceec9918238ce38418
 PYTHON3_CHEETAH_LICENSE = MIT
 PYTHON3_CHEETAH_LICENSE_FILES = LICENSE
 PYTHON3_CHEETAH_SETUP_TYPE = setuptools
-- 
2.20.1
