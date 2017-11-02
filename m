From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 2 Nov 2017 14:18:54 +0100
Subject: [Buildroot] [git commit] python-pathpy: bump version to 10.5
Message-ID: <20171102131141.60F76811EF@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=ed87b3fd392592f878c9b69cd6bcb8c98afead2d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/python-pathpy/python-pathpy.hash | 4 ++--
 package/python-pathpy/python-pathpy.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-pathpy/python-pathpy.hash b/package/python-pathpy/python-pathpy.hash
index 451826c..de22f6c 100644
--- a/package/python-pathpy/python-pathpy.hash
+++ b/package/python-pathpy/python-pathpy.hash
@@ -1,3 +1,3 @@
 # md5 from https://pypi.python.org/pypi/path.py/json, sha256 locally computed
-md5	9c130bc6c1fd04365a3dac010f07b8f2  path.py-10.3.1.tar.gz
-sha256	412706be1cd8ab723c77829f9aa0c4d4b7c7b26c7b1be0275a6841c3cb1001e0  path.py-10.3.1.tar.gz
+md5	afb4f92e4114b595f50573ecd61c31ee  path.py-10.5.tar.gz
+sha256	63a7af08676668fd51750f111affbd38c1a13c61aba15c6665b16681771c79a8  path.py-10.5.tar.gz
diff --git a/package/python-pathpy/python-pathpy.mk b/package/python-pathpy/python-pathpy.mk
index c118ec0..4523316 100644
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
