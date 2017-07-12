From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 12 Jul 2017 18:33:52 +0200
Subject: [Buildroot] [git commit] python-attrs: bump to version 17.2.0
Message-ID: <20170712163001.CE94B81F11@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=2d634d449c77780b5226d437b4b6260a4bad3d04
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/python-attrs/python-attrs.hash | 4 ++--
 package/python-attrs/python-attrs.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-attrs/python-attrs.hash b/package/python-attrs/python-attrs.hash
index 33ecd2c..4434fa1 100644
--- a/package/python-attrs/python-attrs.hash
+++ b/package/python-attrs/python-attrs.hash
@@ -1,3 +1,3 @@
 # md5 from https://pypi.python.org/pypi/attrs/json, sha256 locally computed
-md5	4ec003c49360853cf935113d1ae56151  attrs-16.3.0.tar.gz
-sha256	80203177723e36f3bbe15aa8553da6e80d47bfe53647220ccaa9ad7a5e473ccc  attrs-16.3.0.tar.gz
+md5	3b7136a570f3ff8a4ff42e7360073f9f  attrs-17.2.0.tar.gz
+sha256	5d4d1b99f94d69338f485984127e4473b3ab9e20f43821b0e546cc3b2302fd11  attrs-17.2.0.tar.gz
diff --git a/package/python-attrs/python-attrs.mk b/package/python-attrs/python-attrs.mk
index 5e7985a..c963371 100644
--- a/package/python-attrs/python-attrs.mk
+++ b/package/python-attrs/python-attrs.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_ATTRS_VERSION = 16.3.0
+PYTHON_ATTRS_VERSION = 17.2.0
 PYTHON_ATTRS_SOURCE = attrs-$(PYTHON_ATTRS_VERSION).tar.gz
-PYTHON_ATTRS_SITE = https://pypi.python.org/packages/01/b0/3ac73bf6df716a38568a16f6a9cbc46cc9e8ed6fe30c8768260030db55d4
+PYTHON_ATTRS_SITE = https://pypi.python.org/packages/be/41/e909cb6d901e9689da947419505cc7fb7d242a08a62ee221fce6a009a523
 PYTHON_ATTRS_SETUP_TYPE = setuptools
 PYTHON_ATTRS_LICENSE = MIT
 PYTHON_ATTRS_LICENSE_FILES = LICENSE
