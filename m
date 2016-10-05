From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 5 Oct 2016 23:00:55 +0200
Subject: [Buildroot] [git commit] package/python-pyroute2: bump version to
	0.4.8
Message-ID: <20161005210758.EEF19807CD@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=df9203648790b779b0f7d433fbb7ec67de3d556c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/python-pyroute2/python-pyroute2.hash | 6 +++---
 package/python-pyroute2/python-pyroute2.mk   | 8 ++++----
 2 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/package/python-pyroute2/python-pyroute2.hash b/package/python-pyroute2/python-pyroute2.hash
index df9ff02..ff680fc 100644
--- a/package/python-pyroute2/python-pyroute2.hash
+++ b/package/python-pyroute2/python-pyroute2.hash
@@ -1,3 +1,3 @@
-# md5 from https://pypi.python.org/pypi?:action=show_md5&digest=459b4020073b767cc129e360dabbd2d7, sha256 locally computed
-md5     459b4020073b767cc129e360dabbd2d7  pyroute2-0.3.20.tar.gz
-sha256  ed28856753b941d4277b2f14b89c9edec35be4c97e1831f900fe4ce6fc12161b  pyroute2-0.3.20.tar.gz
+# md5 from https://pypi.python.org/pypi/pyroute2/json, sha256 locally computed
+md5	317303ba8a5e3d55b4f918fd1b7e186d  pyroute2-0.4.8.tar.gz
+sha256	a59907d2c5756f188b5f8aa48e3060e31c6f40e076f8143b99240fe0108a48d6  pyroute2-0.4.8.tar.gz
diff --git a/package/python-pyroute2/python-pyroute2.mk b/package/python-pyroute2/python-pyroute2.mk
index 2e9e0dd..5ea4f54 100644
--- a/package/python-pyroute2/python-pyroute2.mk
+++ b/package/python-pyroute2/python-pyroute2.mk
@@ -1,12 +1,12 @@
-#############################################################
+################################################################################
 #
 # python-pyroute2
 #
-#############################################################
+################################################################################
 
-PYTHON_PYROUTE2_VERSION = 0.3.20
+PYTHON_PYROUTE2_VERSION = 0.4.8
 PYTHON_PYROUTE2_SOURCE = pyroute2-$(PYTHON_PYROUTE2_VERSION).tar.gz
-PYTHON_PYROUTE2_SITE = https://pypi.python.org/packages/source/p/pyroute2
+PYTHON_PYROUTE2_SITE = https://pypi.python.org/packages/fb/c1/2cbd9d3f91c663be7168ee2d8d6e919006ffeef57cac76bdd9e6cba7f468
 PYTHON_PYROUTE2_LICENSE = Apache-2.0 or GPLv2+
 PYTHON_PYROUTE2_LICENSE_FILES = LICENSE.Apache.v2 LICENSE.GPL.v2 README.license.md
 PYTHON_PYROUTE2_SETUP_TYPE = distutils
