From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 2 Mar 2017 21:54:15 +0100
Subject: [Buildroot] [git commit] python-pyroute2: bump to version 0.4.13
Message-ID: <20170302205924.54B5F7FECB@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=ed27ecb18737c6c1115ecd9679dbf67ae124f411
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Adam Duskett <Adamduskett@outlook.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/python-pyroute2/python-pyroute2.hash | 4 ++--
 package/python-pyroute2/python-pyroute2.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-pyroute2/python-pyroute2.hash b/package/python-pyroute2/python-pyroute2.hash
index ff680fc..dbf09c9 100644
--- a/package/python-pyroute2/python-pyroute2.hash
+++ b/package/python-pyroute2/python-pyroute2.hash
@@ -1,3 +1,3 @@
 # md5 from https://pypi.python.org/pypi/pyroute2/json, sha256 locally computed
-md5	317303ba8a5e3d55b4f918fd1b7e186d  pyroute2-0.4.8.tar.gz
-sha256	a59907d2c5756f188b5f8aa48e3060e31c6f40e076f8143b99240fe0108a48d6  pyroute2-0.4.8.tar.gz
+md5 ef4282b1401bcd07a9cf4ec0696aba24 pyroute2-0.4.13.tar.gz
+sha256 93f3d72f58b3627036427b5571f8e27c93dbb6d01372dc4c452707d6610c0a39 pyroute2-0.4.13.tar.gz
diff --git a/package/python-pyroute2/python-pyroute2.mk b/package/python-pyroute2/python-pyroute2.mk
index 5ea4f54..f026b7f 100644
--- a/package/python-pyroute2/python-pyroute2.mk
+++ b/package/python-pyroute2/python-pyroute2.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_PYROUTE2_VERSION = 0.4.8
+PYTHON_PYROUTE2_VERSION = 0.4.13
 PYTHON_PYROUTE2_SOURCE = pyroute2-$(PYTHON_PYROUTE2_VERSION).tar.gz
-PYTHON_PYROUTE2_SITE = https://pypi.python.org/packages/fb/c1/2cbd9d3f91c663be7168ee2d8d6e919006ffeef57cac76bdd9e6cba7f468
+PYTHON_PYROUTE2_SITE = https://pypi.python.org/packages/91/e7/814f60e355078dc51625cd2e7e715ed4a06111ddf2ac5580f2f10e79c94a
 PYTHON_PYROUTE2_LICENSE = Apache-2.0 or GPLv2+
 PYTHON_PYROUTE2_LICENSE_FILES = LICENSE.Apache.v2 LICENSE.GPL.v2 README.license.md
 PYTHON_PYROUTE2_SETUP_TYPE = distutils
