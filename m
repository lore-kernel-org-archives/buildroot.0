From: yegorslists at googlemail.com <yegorslists@googlemail.com>
Date: Thu, 23 Nov 2017 11:55:00 +0100
Subject: [Buildroot] [PATCH 2/3] python-cheroot: bump version to 5.9.0
In-Reply-To: <20171123105501.14505-1-yegorslists@googlemail.com>
References: <20171123105501.14505-1-yegorslists@googlemail.com>
Message-ID: <20171123105501.14505-2-yegorslists@googlemail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Yegor Yefremov <yegorslists@googlemail.com>

Omit 5.9.1 as is has broken Python files.

Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
---
 package/python-cheroot/python-cheroot.hash | 6 +++---
 package/python-cheroot/python-cheroot.mk   | 4 ++--
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/python-cheroot/python-cheroot.hash b/package/python-cheroot/python-cheroot.hash
index 348b82d1ca..7b309a9399 100644
--- a/package/python-cheroot/python-cheroot.hash
+++ b/package/python-cheroot/python-cheroot.hash
@@ -1,3 +1,3 @@
-# md5 from https://pypi.python.org/pypi/cheroot/json, sha256 locally computed
-md5	e5503b0e67bdba29c6585965e7f42099  cheroot-5.5.0.tar.gz
-sha256	59e349f91b9230930f7078646bb92b3a5b0f9cf19a6ff949777409fd289a1eba  cheroot-5.5.0.tar.gz
+# md5 from https://pypi.python.org/pypi/Cheroot/json, sha256 locally computed
+md5	288eb3a6df4964ba0435493d2914da3d  cheroot-5.9.0.tar.gz
+sha256	d8ec06b6e907b911ac5bb626876ee498c289d21f1a638cb2510fc57290567ef5  cheroot-5.9.0.tar.gz
diff --git a/package/python-cheroot/python-cheroot.mk b/package/python-cheroot/python-cheroot.mk
index 3f4b6893d5..d3e056be36 100644
--- a/package/python-cheroot/python-cheroot.mk
+++ b/package/python-cheroot/python-cheroot.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_CHEROOT_VERSION = 5.5.0
+PYTHON_CHEROOT_VERSION = 5.9.0
 PYTHON_CHEROOT_SOURCE = cheroot-$(PYTHON_CHEROOT_VERSION).tar.gz
-PYTHON_CHEROOT_SITE = https://pypi.python.org/packages/a5/43/f8a461762dc62e9f273d4944fb8c140757c11a29c91c91d3fbd5fafb1570
+PYTHON_CHEROOT_SITE = https://pypi.python.org/packages/df/63/5c5265feb7e02e43d2f3a3c19dbb2d78742b0a2ff237c9e473c77bc23500
 PYTHON_CHEROOT_LICENSE = BSD-3-Clause
 PYTHON_CHEROOT_LICENSE_FILES = LICENSE.md
 PYTHON_CHEROOT_SETUP_TYPE = setuptools
-- 
2.11.0
