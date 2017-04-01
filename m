From: Rahul Bedarkar <rahulbedarkar89@gmail.com>
Date: Sun,  2 Apr 2017 00:36:24 +0530
Subject: [Buildroot] [PATCH 2/9] package: use SPDX short identifier for
	libpng license
In-Reply-To: <1491073591-21477-1-git-send-email-rahulbedarkar89@gmail.com>
References: <1491073591-21477-1-git-send-email-rahulbedarkar89@gmail.com>
Message-ID: <1491073591-21477-2-git-send-email-rahulbedarkar89@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

We want to use SPDX identifier for license string as much as possible.
SPDX short identifier for libpng license is Libpng.

Signed-off-by: Rahul Bedarkar <rahulbedarkar89@gmail.com>
---
 package/libpng/libpng.mk             | 2 +-
 package/python-pysmb/python-pysmb.mk | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libpng/libpng.mk b/package/libpng/libpng.mk
index c562965..2491157 100644
--- a/package/libpng/libpng.mk
+++ b/package/libpng/libpng.mk
@@ -8,7 +8,7 @@ LIBPNG_VERSION = 1.6.28
 LIBPNG_SERIES = 16
 LIBPNG_SOURCE = libpng-$(LIBPNG_VERSION).tar.xz
 LIBPNG_SITE = http://downloads.sourceforge.net/project/libpng/libpng${LIBPNG_SERIES}/$(LIBPNG_VERSION)
-LIBPNG_LICENSE = libpng license
+LIBPNG_LICENSE = Libpng
 LIBPNG_LICENSE_FILES = LICENSE
 LIBPNG_INSTALL_STAGING = YES
 LIBPNG_DEPENDENCIES = host-pkgconf zlib
diff --git a/package/python-pysmb/python-pysmb.mk b/package/python-pysmb/python-pysmb.mk
index 49d7c30..1b4c187 100644
--- a/package/python-pysmb/python-pysmb.mk
+++ b/package/python-pysmb/python-pysmb.mk
@@ -7,7 +7,7 @@
 PYTHON_PYSMB_VERSION = 1.1.19
 PYTHON_PYSMB_SOURCE = pysmb-$(PYTHON_PYSMB_VERSION).tar.gz
 PYTHON_PYSMB_SITE = https://pypi.python.org/packages/f9/e7/1fd7faaa946cc6b43ce85bb7a177b75a4718d9c5e291201fec00112b497c
-PYTHON_PYSMB_LICENSE = libpng license
+PYTHON_PYSMB_LICENSE = Libpng
 PYTHON_PYSMB_LICENSE_FILES = LICENSE
 PYTHON_PYSMB_SETUP_TYPE = setuptools
 
-- 
2.7.4
