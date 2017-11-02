From: yegorslists at googlemail.com <yegorslists@googlemail.com>
Date: Thu,  2 Nov 2017 12:05:01 +0100
Subject: [Buildroot] [PATCH 3/4] python-pathpy: bump version to 10.5
In-Reply-To: <20171102110502.18102-1-yegorslists@googlemail.com>
References: <20171102110502.18102-1-yegorslists@googlemail.com>
Message-ID: <20171102110502.18102-3-yegorslists@googlemail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Yegor Yefremov <yegorslists@googlemail.com>

Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
---
 package/python-pathpy/python-pathpy.hash | 4 ++--
 package/python-pathpy/python-pathpy.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-pathpy/python-pathpy.hash b/package/python-pathpy/python-pathpy.hash
index 451826c192..de22f6c576 100644
--- a/package/python-pathpy/python-pathpy.hash
+++ b/package/python-pathpy/python-pathpy.hash
@@ -1,3 +1,3 @@
 # md5 from https://pypi.python.org/pypi/path.py/json, sha256 locally computed
-md5	9c130bc6c1fd04365a3dac010f07b8f2  path.py-10.3.1.tar.gz
-sha256	412706be1cd8ab723c77829f9aa0c4d4b7c7b26c7b1be0275a6841c3cb1001e0  path.py-10.3.1.tar.gz
+md5	afb4f92e4114b595f50573ecd61c31ee  path.py-10.5.tar.gz
+sha256	63a7af08676668fd51750f111affbd38c1a13c61aba15c6665b16681771c79a8  path.py-10.5.tar.gz
diff --git a/package/python-pathpy/python-pathpy.mk b/package/python-pathpy/python-pathpy.mk
index c118ec0181..452331682b 100644
--- a/package/python-pathpy/python-pathpy.mk
+++ b/package/python-pathpy/python-pathpy.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_PATHPY_VERSION = 10.3.1
+PYTHON_PATHPY_VERSION = 10.5
 PYTHON_PATHPY_SOURCE = path.py-$(PYTHON_PATHPY_VERSION).tar.gz
-PYTHON_PATHPY_SITE = https://pypi.python.org/packages/00/79/b1e5a02d156be8eedc1e60e5ce700edfb1d43992ec23f47da05fe5abe3a7
+PYTHON_PATHPY_SITE = https://pypi.python.org/packages/a5/7b/7b303dc1b79fc394b67cea351455ec0db8e6ca5d8537687d40cb7c7d70bb
 PYTHON_PATHPY_SETUP_TYPE = setuptools
 PYTHON_PATHPY_LICENSE = MIT
 PYTHON_PATHPY_DEPENDENCIES = host-python-setuptools-scm
-- 
2.11.0
