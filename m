From: yegorslists at googlemail.com <yegorslists@googlemail.com>
Date: Tue, 18 Jul 2017 12:13:11 +0200
Subject: [Buildroot] [PATCH 2/2] python-pathpy: bump to version 10.3.1
In-Reply-To: <20170718101311.30667-1-yegorslists@googlemail.com>
References: <20170718101311.30667-1-yegorslists@googlemail.com>
Message-ID: <20170718101311.30667-2-yegorslists@googlemail.com>
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
index 4824e2a3c..451826c19 100644
--- a/package/python-pathpy/python-pathpy.hash
+++ b/package/python-pathpy/python-pathpy.hash
@@ -1,3 +1,3 @@
 # md5 from https://pypi.python.org/pypi/path.py/json, sha256 locally computed
-md5	eb8469ad498d2e462bff8f3b2b5ea68d  path.py-10.0.tar.gz
-sha256	ba984a2b536158a8841dd33150fce16bcf04210e83f92da674cad0a8a8f61e00  path.py-10.0.tar.gz
+md5	9c130bc6c1fd04365a3dac010f07b8f2  path.py-10.3.1.tar.gz
+sha256	412706be1cd8ab723c77829f9aa0c4d4b7c7b26c7b1be0275a6841c3cb1001e0  path.py-10.3.1.tar.gz
diff --git a/package/python-pathpy/python-pathpy.mk b/package/python-pathpy/python-pathpy.mk
index 577658602..c118ec018 100644
--- a/package/python-pathpy/python-pathpy.mk
+++ b/package/python-pathpy/python-pathpy.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_PATHPY_VERSION = 10.0
+PYTHON_PATHPY_VERSION = 10.3.1
 PYTHON_PATHPY_SOURCE = path.py-$(PYTHON_PATHPY_VERSION).tar.gz
-PYTHON_PATHPY_SITE = https://pypi.python.org/packages/f3/4e/3bce93c0d9e20abc6ed3aa7866beb688e889828ca2666743df11d9a30050
+PYTHON_PATHPY_SITE = https://pypi.python.org/packages/00/79/b1e5a02d156be8eedc1e60e5ce700edfb1d43992ec23f47da05fe5abe3a7
 PYTHON_PATHPY_SETUP_TYPE = setuptools
 PYTHON_PATHPY_LICENSE = MIT
 PYTHON_PATHPY_DEPENDENCIES = host-python-setuptools-scm
-- 
2.11.0
