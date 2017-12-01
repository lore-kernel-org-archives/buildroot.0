From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 1 Dec 2017 22:56:41 +0100
Subject: [Buildroot] [git commit] packages: remove "consecutive empty lines"
Message-ID: <20171201214934.ED82B810AF@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=373b63d3f0a9e0ea2ba97a070a642e904605101f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

... as reported by utils/check-package

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Adam Duskett <aduskett@gmail.com>
Cc: Yegor Yefremov<yegorslists@googlemail.com>
Cc: Matt Weber <matthew.weber@rockwellcollins.com>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/python3/python3.mk | 2 --
 package/setools/setools.mk | 1 -
 2 files changed, 3 deletions(-)

diff --git a/package/python3/python3.mk b/package/python3/python3.mk
index 1d2201e..6e61108 100644
--- a/package/python3/python3.mk
+++ b/package/python3/python3.mk
@@ -159,7 +159,6 @@ PYTHON3_CONF_OPTS += \
 	--disable-idle3 \
 	--disable-pyc-build
 
-
 #
 # Some of CPython's source code is generated using Python interpreter
 # and some helper tools such as "Programs/_freeze_importlib" or
@@ -201,7 +200,6 @@ endef
 
 PYTHON3_PRE_BUILD_HOOKS += PYTHON3_MAKE_REGEN_IMPORTLIB
 
-
 #
 # Remove useless files. In the config/ directory, only the Makefile
 # and the pyconfig.h files are needed at runtime.
diff --git a/package/setools/setools.mk b/package/setools/setools.mk
index 8b93ccf..6748c95 100644
--- a/package/setools/setools.mk
+++ b/package/setools/setools.mk
@@ -13,7 +13,6 @@ SETOOLS_LICENSE_FILES = COPYING COPYING.GPL COPYING.LGPL
 SETOOLS_SETUP_TYPE = setuptools
 HOST_SETOOLS_DEPENDENCIES = host-libselinux host-libsepol
 
-
 ifeq ($(BR2_PACKAGE_PYTHON3),y)
 SETOOLS_PYLIBVER = python$(PYTHON3_VERSION_MAJOR)
 else
