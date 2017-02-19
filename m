From: Adam Duskett <aduskett@gmail.com>
Date: Sun, 19 Feb 2017 14:12:32 -0500
Subject: [Buildroot] [PATCH 35/58] python-pydal: bump to version 17.1
In-Reply-To: <20170219191255.1503-1-Adamduskett@outlook.com>
References: <20170219191255.1503-1-Adamduskett@outlook.com>
Message-ID: <20170219191255.1503-36-Adamduskett@outlook.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Adam Duskett <Adamduskett@outlook.com>
---
 package/python-pydal/python-pydal.hash | 4 ++--
 package/python-pydal/python-pydal.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-pydal/python-pydal.hash b/package/python-pydal/python-pydal.hash
index ad17c33..8e20215 100644
--- a/package/python-pydal/python-pydal.hash
+++ b/package/python-pydal/python-pydal.hash
@@ -1,3 +1,3 @@
 # md5 from https://pypi.python.org/pypi/pydal/json, sha256 locally computed
-md5	74c6cc43d5ee57bcffa804c1204030d8  pyDAL-16.9.tar.gz
-sha256	e5e18b10df044c4328a5a2fe0400793a8f643fe3526daee8c99103fc5589476e  pyDAL-16.9.tar.gz
+md5 f544da78cd4980d3a13024bc79065cf0 pyDAL-17.1.tar.gz
+sha256 ae33e903725133c051df3cd0712cc1967997f56fc480a90ab6a7c50df265f9d1 pyDAL-17.1.tar.gz
diff --git a/package/python-pydal/python-pydal.mk b/package/python-pydal/python-pydal.mk
index a0e9729..7492357 100644
--- a/package/python-pydal/python-pydal.mk
+++ b/package/python-pydal/python-pydal.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_PYDAL_VERSION = 16.9
+PYTHON_PYDAL_VERSION = 17.1
 PYTHON_PYDAL_SOURCE = pyDAL-$(PYTHON_PYDAL_VERSION).tar.gz
-PYTHON_PYDAL_SITE = https://pypi.python.org/packages/31/cb/7537f8d848106e3e4b4063955395a5dc3177c32c2cd2cc0a1938a486d4fa
+PYTHON_PYDAL_SITE = https://pypi.python.org/packages/64/9a/4fc08f6078b3a3019a9e33c8383bb023e064405dc5e16c273b8ec6d430cd
 PYTHON_PYDAL_LICENSE = BSD-3c
 PYTHON_PYDAL_LICENSE_FILES = LICENSE
 PYTHON_PYDAL_SETUP_TYPE = setuptools
-- 
2.9.3
