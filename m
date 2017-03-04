From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 4 Mar 2017 11:40:44 +0100
Subject: [Buildroot] [git commit] Revert "python-pyasn: bump to version
	1.6.0b1"
Message-ID: <20170304104146.E045F8226D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=9c2ef1eafd398faf7223828165e4757ff2991383
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This reverts commit 98c9b1bec6fd511889f38c72bc4aa5aba89e264d, which
causes build failures.

Fixes:

  http://autobuild.buildroot.net/results/27e1c6cdf330bd2009bf8895d8c72a7c4f5186af/

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/python-pyasn/python-pyasn.hash | 6 +++---
 package/python-pyasn/python-pyasn.mk   | 6 +++---
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/package/python-pyasn/python-pyasn.hash b/package/python-pyasn/python-pyasn.hash
index 90924ff..59c90a8 100644
--- a/package/python-pyasn/python-pyasn.hash
+++ b/package/python-pyasn/python-pyasn.hash
@@ -1,3 +1,3 @@
-# md5 from https://pypi.python.org/pypi/pyasn/json, sha256 locally computed
-md5 f4556a3bcc6eb25eace37030202e3d90 pyasn-1.6.0b1.tar.gz
-sha256 d947900be23b073949b321c37d640b5ad86955704b7533b6f0519f550a5fa446 pyasn-1.6.0b1.tar.gz
+# md5 from https://pypi.python.org/pypi?:action=show_md5&digest=f00a02a631d4016818659d1cc38d229a, sha256 locally computed
+md5     f00a02a631d4016818659d1cc38d229a  pyasn1-0.1.9.tar.gz
+sha256  853cacd96d1f701ddd67aa03ecc05f51890135b7262e922710112f12a2ed2a7f  pyasn1-0.1.9.tar.gz
diff --git a/package/python-pyasn/python-pyasn.mk b/package/python-pyasn/python-pyasn.mk
index 20b2630..80d18cd 100644
--- a/package/python-pyasn/python-pyasn.mk
+++ b/package/python-pyasn/python-pyasn.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_PYASN_VERSION = 1.6.0b1
-PYTHON_PYASN_SOURCE = pyasn-$(PYTHON_PYASN_VERSION).tar.gz
-PYTHON_PYASN_SITE = https://pypi.python.org/packages/31/da/c8338545be0ee7a727c977113e75888e4f1f2b2e10f9284fdfa31dab29bc
+PYTHON_PYASN_VERSION = 0.1.9
+PYTHON_PYASN_SOURCE = pyasn1-$(PYTHON_PYASN_VERSION).tar.gz
+PYTHON_PYASN_SITE = https://pypi.python.org/packages/source/p/pyasn1
 PYTHON_PYASN_LICENSE = BSD-2c
 PYTHON_PYASN_LICENSE_FILES = LICENSE.txt
 PYTHON_PYASN_SETUP_TYPE = distutils
