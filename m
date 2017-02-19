From: Adam Duskett <aduskett@gmail.com>
Date: Sun, 19 Feb 2017 14:12:06 -0500
Subject: [Buildroot] [PATCH 09/58] python-cryptography: bump to version 1.7.2
In-Reply-To: <20170219191255.1503-1-Adamduskett@outlook.com>
References: <20170219191255.1503-1-Adamduskett@outlook.com>
Message-ID: <20170219191255.1503-10-Adamduskett@outlook.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Adam Duskett <Adamduskett@outlook.com>
---
 package/python-cryptography/python-cryptography.hash | 4 ++--
 package/python-cryptography/python-cryptography.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-cryptography/python-cryptography.hash b/package/python-cryptography/python-cryptography.hash
index 7738d23..a1162cf 100644
--- a/package/python-cryptography/python-cryptography.hash
+++ b/package/python-cryptography/python-cryptography.hash
@@ -1,3 +1,3 @@
 # md5 from https://pypi.python.org/pypi/cryptography/json, sha256 locally computed
-md5	2f63dee6ace602d1d20d1995f8538015  cryptography-1.7.1.tar.gz
-sha256	953fef7d40a49a795f4d955c5ce4338abcec5dea822ed0414ed30348303fdb4c  cryptography-1.7.1.tar.gz
+md5 fade66de437392ed1ba6980768626204 cryptography-1.7.2.tar.gz
+sha256 878cb68b3da3d493ffd68f36db11c29deee623671d3287c3f8d685117ffda9a9 cryptography-1.7.2.tar.gz
diff --git a/package/python-cryptography/python-cryptography.mk b/package/python-cryptography/python-cryptography.mk
index d4e18ec..9e2b86f 100644
--- a/package/python-cryptography/python-cryptography.mk
+++ b/package/python-cryptography/python-cryptography.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_CRYPTOGRAPHY_VERSION = 1.7.1
+PYTHON_CRYPTOGRAPHY_VERSION = 1.7.2
 PYTHON_CRYPTOGRAPHY_SOURCE = cryptography-$(PYTHON_CRYPTOGRAPHY_VERSION).tar.gz
-PYTHON_CRYPTOGRAPHY_SITE = https://pypi.python.org/packages/82/f7/d6dfd7595910a20a563a83a762bf79a253c4df71759c3b228accb3d7e5e4
+PYTHON_CRYPTOGRAPHY_SITE = https://pypi.python.org/packages/99/df/71c7260003f5c469cec3db4c547115df39e9ce6c719a99e067ba0e78fd8a
 PYTHON_CRYPTOGRAPHY_SETUP_TYPE = setuptools
 PYTHON_CRYPTOGRAPHY_LICENSE = Apache-2.0 or BSD-3c
 PYTHON_CRYPTOGRAPHY_LICENSE_FILES = LICENSE LICENSE.APACHE LICENSE.BSD
-- 
2.9.3
