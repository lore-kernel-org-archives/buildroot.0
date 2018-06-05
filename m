From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 5 Jun 2018 22:41:11 +0200
Subject: [Buildroot] [git commit] package/python-web2py: bump to version
 R-2.16.1
Message-ID: <20180605203930.B20AD801D6@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=ae0a8be90e298650bd32a7f6d79d9ef42437aa92
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This patch bumps python-web2py to version R-2.16.1.

Signed-off-by: Angelo Compagnucci <angelo@amarulasolutions.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/python-web2py/python-web2py.hash | 2 +-
 package/python-web2py/python-web2py.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/python-web2py/python-web2py.hash b/package/python-web2py/python-web2py.hash
index adc7bc5d5c..d23da1ea6e 100644
--- a/package/python-web2py/python-web2py.hash
+++ b/package/python-web2py/python-web2py.hash
@@ -1,2 +1,2 @@
 # sha256 locally computed
-sha256 e432e051ebb826b77835bda03ddb16364b37d137b37ac33005b6ac0fd5d56280  python-web2py-R-2.15.4.tar.gz
+sha256 d9ed52676e9becd53d2d73a849dea3d55b8b61231abf3428cf516dcc0083d451  python-web2py-R-2.16.1.tar.gz
diff --git a/package/python-web2py/python-web2py.mk b/package/python-web2py/python-web2py.mk
index 9ad5a7785a..1e02fb7ca5 100644
--- a/package/python-web2py/python-web2py.mk
+++ b/package/python-web2py/python-web2py.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PYTHON_WEB2PY_VERSION = R-2.15.4
+PYTHON_WEB2PY_VERSION = R-2.16.1
 PYTHON_WEB2PY_SITE = $(call github,web2py,web2py,$(PYTHON_WEB2PY_VERSION))
 PYTHON_WEB2PY_LICENSE = LGPL-3.0
 PYTHON_WEB2PY_LICENSE_FILES = LICENSE
