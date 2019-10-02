From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 2 Oct 2019 22:19:29 +0200
Subject: [Buildroot] [git commit] package/python-pyroute2: bump to version
 0.5.6
Message-ID: <20191002201427.2BCA881E52@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=1d5bbdb6c58c7edcf00db6bd8dd0a2cbce7d5716
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Asaf Kahlon <asafka7@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/python-pyroute2/python-pyroute2.hash | 4 ++--
 package/python-pyroute2/python-pyroute2.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-pyroute2/python-pyroute2.hash b/package/python-pyroute2/python-pyroute2.hash
index 9078004d5a..d819d31db6 100644
--- a/package/python-pyroute2/python-pyroute2.hash
+++ b/package/python-pyroute2/python-pyroute2.hash
@@ -1,6 +1,6 @@
 # md5, sha256 from https://pypi.org/pypi/pyroute2/json
-md5    62b24242940b5d73c6ec9c53169b8ef8  pyroute2-0.5.3.tar.gz
-sha256 79f7b4286be773c46914df0201dabaf92717a9c06e341e0c420603b2dd31c6bf  pyroute2-0.5.3.tar.gz
+md5    649fed4ea0ca98f548a0c166995f0f6d  pyroute2-0.5.6.tar.gz
+sha256 deae0e6191a04c3ee213c6fae6ed779602ef5da5ca5e2fa533f27bc04326bfbe  pyroute2-0.5.6.tar.gz
 # Locally computed sha256
 sha256 4739b32a2478e9c204bf010bad5d565d188e59ff905e3c8f71fe3398098b7093  LICENSE.Apache.v2
 sha256 8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  LICENSE.GPL.v2
diff --git a/package/python-pyroute2/python-pyroute2.mk b/package/python-pyroute2/python-pyroute2.mk
index 7937bd2362..a40f907531 100644
--- a/package/python-pyroute2/python-pyroute2.mk
+++ b/package/python-pyroute2/python-pyroute2.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_PYROUTE2_VERSION = 0.5.3
+PYTHON_PYROUTE2_VERSION = 0.5.6
 PYTHON_PYROUTE2_SOURCE = pyroute2-$(PYTHON_PYROUTE2_VERSION).tar.gz
-PYTHON_PYROUTE2_SITE =  https://files.pythonhosted.org/packages/19/1c/fc2efd9dfa5c1f7f713dbfee621365ad01f7b7ec0a6908e444f08bfd5873
+PYTHON_PYROUTE2_SITE = https://files.pythonhosted.org/packages/f6/80/16a604075345f0c253537d55e5c5282a37c61a1fc8ee0fcc42d1fd2a0739
 PYTHON_PYROUTE2_LICENSE = Apache-2.0 or GPL-2.0+
 PYTHON_PYROUTE2_LICENSE_FILES = LICENSE.Apache.v2 LICENSE.GPL.v2 README.license.md
 PYTHON_PYROUTE2_SETUP_TYPE = distutils
