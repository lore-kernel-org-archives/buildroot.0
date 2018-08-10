From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 10 Aug 2018 15:25:34 +0200
Subject: [Buildroot] [git commit branch/next] package/python-pillow: bump to
 version 5.2.0
Message-ID: <20180810131900.C7FA68B895@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=8a799d4757dde8d6e6d6ca7084379ad58c35edb1
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

This patch bumps python-pillow to version 5.2.0 and adds the hash for
license file.

Signed-off-by: Angelo Compagnucci <angelo@amarulasolutions.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/python-pillow/python-pillow.hash | 6 ++++--
 package/python-pillow/python-pillow.mk   | 4 ++--
 2 files changed, 6 insertions(+), 4 deletions(-)

diff --git a/package/python-pillow/python-pillow.hash b/package/python-pillow/python-pillow.hash
index 463b5620ce..0f90a0be18 100644
--- a/package/python-pillow/python-pillow.hash
+++ b/package/python-pillow/python-pillow.hash
@@ -1,2 +1,4 @@
-# sha256 from https://pypi.org/project/Pillow/5.1.0/#files
-sha256 cee9bc75bff455d317b6947081df0824a8f118de2786dc3d74a3503fd631f4ef  Pillow-5.1.0.tar.gz
+# sha256 for python-pillow from https://pypi.org/project/Pillow/5.2.0/#files
+# sha256 for LICENSE locally computed
+sha256 f8b3d413c5a8f84b12cd4c5df1d8e211777c9852c6be3ee9c094b626644d3eab  Pillow-5.2.0.tar.gz
+sha256 4960fc18becc286be839c8ff17bd70cd5222533f761129142153443718a25199  LICENSE
diff --git a/package/python-pillow/python-pillow.mk b/package/python-pillow/python-pillow.mk
index c9b3e316f9..c3a3d13315 100644
--- a/package/python-pillow/python-pillow.mk
+++ b/package/python-pillow/python-pillow.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_PILLOW_VERSION = 5.1.0
+PYTHON_PILLOW_VERSION = 5.2.0
 PYTHON_PILLOW_SOURCE = Pillow-$(PYTHON_PILLOW_VERSION).tar.gz
-PYTHON_PILLOW_SITE = https://files.pythonhosted.org/packages/89/b8/2f49bf71cbd0e9485bb36f72d438421b69b7356180695ae10bd4fd3066f5
+PYTHON_PILLOW_SITE = https://files.pythonhosted.org/packages/d3/c4/b45b9c0d549f482dd072055e2d3ced88f3b977f7b87c7a990228b20e7da1
 PYTHON_PILLOW_LICENSE = PIL Software License
 PYTHON_PILLOW_LICENSE_FILES = LICENSE
 PYTHON_PILLOW_SETUP_TYPE = setuptools
