From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 14 Oct 2019 22:04:02 +0200
Subject: [Buildroot] [git commit] package/python-pyroute2: bump to version
 0.5.7
Message-ID: <20191014201700.A23AE8DF3C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=c35fc2ff38d0d127da229388e900c1e3516ad631
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Asaf Kahlon <asafka7@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/python-pyroute2/python-pyroute2.hash | 4 ++--
 package/python-pyroute2/python-pyroute2.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-pyroute2/python-pyroute2.hash b/package/python-pyroute2/python-pyroute2.hash
index d819d31db6..35f397b14a 100644
--- a/package/python-pyroute2/python-pyroute2.hash
+++ b/package/python-pyroute2/python-pyroute2.hash
@@ -1,6 +1,6 @@
 # md5, sha256 from https://pypi.org/pypi/pyroute2/json
-md5    649fed4ea0ca98f548a0c166995f0f6d  pyroute2-0.5.6.tar.gz
-sha256 deae0e6191a04c3ee213c6fae6ed779602ef5da5ca5e2fa533f27bc04326bfbe  pyroute2-0.5.6.tar.gz
+md5	371683b62314211b8bc9807ac8ef1144  pyroute2-0.5.7.tar.gz
+sha256	963fce07da2841456d39e3b932b071f6de28d23dadfae014022d67a752916f98  pyroute2-0.5.7.tar.gz
 # Locally computed sha256
 sha256 4739b32a2478e9c204bf010bad5d565d188e59ff905e3c8f71fe3398098b7093  LICENSE.Apache.v2
 sha256 8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  LICENSE.GPL.v2
diff --git a/package/python-pyroute2/python-pyroute2.mk b/package/python-pyroute2/python-pyroute2.mk
index a40f907531..44c42d1033 100644
--- a/package/python-pyroute2/python-pyroute2.mk
+++ b/package/python-pyroute2/python-pyroute2.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_PYROUTE2_VERSION = 0.5.6
+PYTHON_PYROUTE2_VERSION = 0.5.7
 PYTHON_PYROUTE2_SOURCE = pyroute2-$(PYTHON_PYROUTE2_VERSION).tar.gz
-PYTHON_PYROUTE2_SITE = https://files.pythonhosted.org/packages/f6/80/16a604075345f0c253537d55e5c5282a37c61a1fc8ee0fcc42d1fd2a0739
+PYTHON_PYROUTE2_SITE = https://files.pythonhosted.org/packages/6b/94/2a5f6c11369a21efd27a0b4cb92adf5012da7acdbce7e78055710986ca23
 PYTHON_PYROUTE2_LICENSE = Apache-2.0 or GPL-2.0+
 PYTHON_PYROUTE2_LICENSE_FILES = LICENSE.Apache.v2 LICENSE.GPL.v2 README.license.md
 PYTHON_PYROUTE2_SETUP_TYPE = distutils
