From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 29 Nov 2018 23:01:26 +0100
Subject: [Buildroot] [git commit] package/python-web2py: bump to version
 R-2.17.2
Message-ID: <20181202071601.6CD4A7F917@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=26b9536420baea7eb7ba6e0b044c512b8be5a226
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This patch bumps web2py to version R-2.17.2

Signed-off-by: Angelo Compagnucci <angelo@amarulasolutions.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/python-web2py/python-web2py.hash | 3 ++-
 package/python-web2py/python-web2py.mk   | 2 +-
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/package/python-web2py/python-web2py.hash b/package/python-web2py/python-web2py.hash
index d23da1ea6e..9a1df0c2a1 100644
--- a/package/python-web2py/python-web2py.hash
+++ b/package/python-web2py/python-web2py.hash
@@ -1,2 +1,3 @@
 # sha256 locally computed
-sha256 d9ed52676e9becd53d2d73a849dea3d55b8b61231abf3428cf516dcc0083d451  python-web2py-R-2.16.1.tar.gz
+sha256 8205a7a08595ca1a41919750a8dc4e431258966cb46c8021564b25003cf90863  python-web2py-R-2.17.2.tar.gz
+sha256 2aae96826184a492bc799add49aed7b29036e7aba2d2294fb65053bd30fe55fe  LICENSE
diff --git a/package/python-web2py/python-web2py.mk b/package/python-web2py/python-web2py.mk
index 1e02fb7ca5..922b267b8b 100644
--- a/package/python-web2py/python-web2py.mk
+++ b/package/python-web2py/python-web2py.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PYTHON_WEB2PY_VERSION = R-2.16.1
+PYTHON_WEB2PY_VERSION = R-2.17.2
 PYTHON_WEB2PY_SITE = $(call github,web2py,web2py,$(PYTHON_WEB2PY_VERSION))
 PYTHON_WEB2PY_LICENSE = LGPL-3.0
 PYTHON_WEB2PY_LICENSE_FILES = LICENSE
