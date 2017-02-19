From: Adam Duskett <aduskett@gmail.com>
Date: Sun, 19 Feb 2017 14:12:09 -0500
Subject: [Buildroot] [PATCH 12/58] python-enum: bump to version 0.4.6
In-Reply-To: <20170219191255.1503-1-Adamduskett@outlook.com>
References: <20170219191255.1503-1-Adamduskett@outlook.com>
Message-ID: <20170219191255.1503-13-Adamduskett@outlook.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Adam Duskett <Adamduskett@outlook.com>
---
 package/python-enum/python-enum.hash | 6 +++---
 package/python-enum/python-enum.mk   | 4 ++--
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/python-enum/python-enum.hash b/package/python-enum/python-enum.hash
index c7c1924..6f1daa0 100644
--- a/package/python-enum/python-enum.hash
+++ b/package/python-enum/python-enum.hash
@@ -1,3 +1,3 @@
-# md5 from https://pypi.python.org/pypi?:action=show_md5&digest=ce75c7c3c86741175a84456cc5bd531e, sha256 locally computed
-md5	ce75c7c3c86741175a84456cc5bd531e  enum-0.4.4.tar.gz
-sha256	9bdfacf543baf2350df7613eb37f598a802f346985ca0dc1548be6494140fdff  enum-0.4.4.tar.gz
+# md5 from https://pypi.python.org/pypi/enum/json, sha256 locally computed
+md5 173d468112cfa13a149b2c8af3e8fd52 enum-0.4.6.tar.gz
+sha256 54e78526b166982b36884613f35a76d9a6711c49810d3ec1a05b10c9b31f938e enum-0.4.6.tar.gz
diff --git a/package/python-enum/python-enum.mk b/package/python-enum/python-enum.mk
index 0131be3..e1a55c3 100644
--- a/package/python-enum/python-enum.mk
+++ b/package/python-enum/python-enum.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_ENUM_VERSION = 0.4.4
+PYTHON_ENUM_VERSION = 0.4.6
 PYTHON_ENUM_SOURCE = enum-$(PYTHON_ENUM_VERSION).tar.gz
-PYTHON_ENUM_SITE = http://pypi.python.org/packages/source/e/enum
+PYTHON_ENUM_SITE = https://pypi.python.org/packages/0c/4e/1ea357e7783c756bb579333c1e4a026fb331371ee771f616ffedc781e531
 PYTHON_ENUM_SETUP_TYPE = setuptools
 PYTHON_ENUM_LICENSE = GPLv2+ or Python software foundation license v2
 PYTHON_ENUM_LICENSE_FILES = LICENSE.GPL LICENSE.PSF
-- 
2.9.3
