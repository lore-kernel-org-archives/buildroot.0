From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 7 Oct 2016 14:48:43 +0200
Subject: [Buildroot] [git commit] package/python-pytz: bump version to 2016.7
Message-ID: <20161007131551.B06AA80089@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=e3d7e801d8b4fec8353638881cc118eddfa4ed28
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/python-pytz/python-pytz.hash | 7 +++----
 package/python-pytz/python-pytz.mk   | 4 ++--
 2 files changed, 5 insertions(+), 6 deletions(-)

diff --git a/package/python-pytz/python-pytz.hash b/package/python-pytz/python-pytz.hash
index 5047a8c..db362ec 100644
--- a/package/python-pytz/python-pytz.hash
+++ b/package/python-pytz/python-pytz.hash
@@ -1,4 +1,3 @@
-# md5 from https://pypi.python.org/pypi/pytz/json
-md5	e56283d61935963157aebc5135206a47  pytz-2016.4.tar.bz2
-# sha256 calculated by scanpypi
-sha256	ee7c751544e35a7b7fb5e3fb25a49dade37d51e70a93e5107f10575d7102c311  pytz-2016.4.tar.bz2
+# md5 from https://pypi.python.org/pypi/pytz/json, sha256 locally computed
+md5	8d8121d619a43cf0b38a4195de1cb8a5  pytz-2016.7.tar.bz2
+sha256	6eab31709e3a4aea748457707da45e805b650cbb352583805d2417de2a1dd71e  pytz-2016.7.tar.bz2
diff --git a/package/python-pytz/python-pytz.mk b/package/python-pytz/python-pytz.mk
index a73c9cf..ffcab32 100644
--- a/package/python-pytz/python-pytz.mk
+++ b/package/python-pytz/python-pytz.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_PYTZ_VERSION = 2016.4
+PYTHON_PYTZ_VERSION = 2016.7
 PYTHON_PYTZ_SOURCE = pytz-$(PYTHON_PYTZ_VERSION).tar.bz2
-PYTHON_PYTZ_SITE = https://pypi.python.org/packages/f4/7d/7c0c85e9c64a75dde11bc9d3e1adc4e09a42ce7cdb873baffa1598118709
+PYTHON_PYTZ_SITE = https://pypi.python.org/packages/53/35/6376f58fb82ce69e2c113ca0ebe5c0f69b20f006e184bcc238a6007f4bdb
 PYTHON_PYTZ_SETUP_TYPE = setuptools
 PYTHON_PYTZ_LICENSE = MIT
 PYTHON_PYTZ_LICENSE_FILES = LICENSE.txt
