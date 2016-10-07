From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 7 Oct 2016 15:15:19 +0200
Subject: [Buildroot] [git commit] package/python-pyxb: bump version to 1.2.5
Message-ID: <20161007131551.BFBA080089@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=f338578aa28f4aff461e0e865c559e16d48af0f7
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/python-pyxb/python-pyxb.hash | 5 +++--
 package/python-pyxb/python-pyxb.mk   | 5 +++--
 2 files changed, 6 insertions(+), 4 deletions(-)

diff --git a/package/python-pyxb/python-pyxb.hash b/package/python-pyxb/python-pyxb.hash
index d8b43f8..9aa50fc 100644
--- a/package/python-pyxb/python-pyxb.hash
+++ b/package/python-pyxb/python-pyxb.hash
@@ -1,2 +1,3 @@
-# Locally computed:
-sha256  14ced19ecce51e7cd26434446f9bd6b4e309e91806f1f6fc5e21f4ac736aa0de  python-pyxb-1.2.4.tar.gz
+# md5 from https://pypi.python.org/pypi/pyxb/json, sha256 locally computed
+md5	197c462ab8427ea197313ca3776b252a  PyXB-1.2.5.tar.gz
+sha256	4e8f62ee2cfffc37e4f40634ab9c79e0311cfaf28cf4ce5e7f4828ec56e4ff67  PyXB-1.2.5.tar.gz
diff --git a/package/python-pyxb/python-pyxb.mk b/package/python-pyxb/python-pyxb.mk
index eb9ffce..d0b2da5 100644
--- a/package/python-pyxb/python-pyxb.mk
+++ b/package/python-pyxb/python-pyxb.mk
@@ -4,8 +4,9 @@
 #
 ################################################################################
 
-PYTHON_PYXB_VERSION = 1.2.4
-PYTHON_PYXB_SITE = $(call github,pabigot,pyxb,PyXB-$(PYTHON_PYXB_VERSION))
+PYTHON_PYXB_VERSION = 1.2.5
+PYTHON_PYXB_SOURCE = PyXB-$(PYTHON_PYXB_VERSION).tar.gz
+PYTHON_PYXB_SITE = https://pypi.python.org/packages/43/7a/9d40392e4380463f37bf5aa2851dfd8ba7c0e4d2a9dc2355177b8b785794
 PYTHON_PYXB_LICENSE = Apache-2.0
 PYTHON_PYXB_LICENSE_FILES = LICENSE
 PYTHON_PYXB_SETUP_TYPE = distutils
