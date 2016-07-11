From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 11 Jul 2016 14:12:01 +0200
Subject: [Buildroot] [git commit] python-mako: bump to version 1.0.4
Message-ID: <20160711121221.10006818C0@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=20c0cbd67db39839afb5fd47fe343fd28cf130e0
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/python-mako/python-mako.hash | 7 +++----
 package/python-mako/python-mako.mk   | 4 ++--
 2 files changed, 5 insertions(+), 6 deletions(-)

diff --git a/package/python-mako/python-mako.hash b/package/python-mako/python-mako.hash
index 374be1a..b6a74f3 100644
--- a/package/python-mako/python-mako.hash
+++ b/package/python-mako/python-mako.hash
@@ -1,4 +1,3 @@
-# From https://pypi.python.org/pypi/Mako/1.0.3
-md5	a78f20f6366a8a0659ce5532f8614e53	Mako-1.0.3.tar.gz
-# Locally computed
-sha256	7644bc0ee35965d2e146dde31827b8982ed70a58281085fac42869a09764d38c	Mako-1.0.3.tar.gz
+# md5 from https://pypi.python.org/pypi/Mako/json, sha256 locally computed
+md5	c5fc31a323dd4990683d2f2da02d4e20	Mako-1.0.4.tar.gz
+sha256	fed99dbe4d0ddb27a33ee4910d8708aca9ef1fe854e668387a9ab9a90cbf9059	Mako-1.0.4.tar.gz
diff --git a/package/python-mako/python-mako.mk b/package/python-mako/python-mako.mk
index 52679e0..88ce13e 100644
--- a/package/python-mako/python-mako.mk
+++ b/package/python-mako/python-mako.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_MAKO_VERSION = 1.0.3
+PYTHON_MAKO_VERSION = 1.0.4
 PYTHON_MAKO_SOURCE = Mako-$(PYTHON_MAKO_VERSION).tar.gz
-PYTHON_MAKO_SITE = https://pypi.python.org/packages/source/M/Mako
+PYTHON_MAKO_SITE = https://pypi.python.org/packages/7a/ae/925434246ee90b42e8ef57d3b30a0ab7caf9a2de3e449b876c56dcb48155
 PYTHON_MAKO_SETUP_TYPE = setuptools
 PYTHON_MAKO_LICENSE = MIT
 PYTHON_MAKO_LICENSE_FILES = LICENSE
