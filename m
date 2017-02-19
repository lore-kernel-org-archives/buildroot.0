From: Adam Duskett <aduskett@gmail.com>
Date: Sun, 19 Feb 2017 14:12:25 -0500
Subject: [Buildroot] [PATCH 28/58] python-pathvalidate: bump to version
	0.14.0
In-Reply-To: <20170219191255.1503-1-Adamduskett@outlook.com>
References: <20170219191255.1503-1-Adamduskett@outlook.com>
Message-ID: <20170219191255.1503-29-Adamduskett@outlook.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Adam Duskett <Adamduskett@outlook.com>
---
 package/python-pathvalidate/python-pathvalidate.hash | 4 ++--
 package/python-pathvalidate/python-pathvalidate.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-pathvalidate/python-pathvalidate.hash b/package/python-pathvalidate/python-pathvalidate.hash
index 68e6907..fdd1b8a 100644
--- a/package/python-pathvalidate/python-pathvalidate.hash
+++ b/package/python-pathvalidate/python-pathvalidate.hash
@@ -1,3 +1,3 @@
 # md5 from https://pypi.python.org/pypi/pathvalidate/json, sha256 locally computed
-md5	03f0af69596f7de52d52753c2a585fce  pathvalidate-0.13.0.tar.gz
-sha256	1ecaebfbd32794abe5f47a20189d5f7dd196a6ba445c1a07429de6ce608bf9b9  pathvalidate-0.13.0.tar.gz
+md5 62ac5ed4c1eb56e10effe0c3a0380bf7 pathvalidate-0.14.0.tar.gz
+sha256 b6993e278b791b383bd6d98b1f64df11270c95fa20af2e6962e60063c22ac2c6 pathvalidate-0.14.0.tar.gz
diff --git a/package/python-pathvalidate/python-pathvalidate.mk b/package/python-pathvalidate/python-pathvalidate.mk
index a8ab4ad..21f87ca 100644
--- a/package/python-pathvalidate/python-pathvalidate.mk
+++ b/package/python-pathvalidate/python-pathvalidate.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_PATHVALIDATE_VERSION = 0.13.0
+PYTHON_PATHVALIDATE_VERSION = 0.14.0
 PYTHON_PATHVALIDATE_SOURCE = pathvalidate-$(PYTHON_PATHVALIDATE_VERSION).tar.gz
-PYTHON_PATHVALIDATE_SITE = https://pypi.python.org/packages/3a/03/ca01cdbf0f7b766b414d134e71b2eb689619dba0ddee002d53c2d58f6436
+PYTHON_PATHVALIDATE_SITE = https://pypi.python.org/packages/7a/6d/b49f04caa4531f0cbb8f8678af9f4beb3f26d1c0e61edd700a54f65fb9bf
 PYTHON_PATHVALIDATE_SETUP_TYPE = setuptools
 PYTHON_PATHVALIDATE_LICENSE = MIT
 PYTHON_PATHVALIDATE_LICENSE_FILES = LICENSE
-- 
2.9.3
