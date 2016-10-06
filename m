From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Thu,  6 Oct 2016 21:29:35 +0200
Subject: [Buildroot] [PATCH 08/21] package/python-pyudev: bump version to
	0.21.0
In-Reply-To: <20161006192948.27956-1-bernd.kuhls@t-online.de>
References: <20161006192948.27956-1-bernd.kuhls@t-online.de>
Message-ID: <20161006192948.27956-8-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/python-pyudev/python-pyudev.hash | 6 +++---
 package/python-pyudev/python-pyudev.mk   | 4 ++--
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/python-pyudev/python-pyudev.hash b/package/python-pyudev/python-pyudev.hash
index adda9a4..dca0650 100644
--- a/package/python-pyudev/python-pyudev.hash
+++ b/package/python-pyudev/python-pyudev.hash
@@ -1,3 +1,3 @@
-# md5 from https://pypi.python.org/pypi?:action=show_md5&digest=07a60f5f7a6028e83725f759a1b9490a, sha256 locally computed
-md5     07a60f5f7a6028e83725f759a1b9490a  pyudev-0.18.tar.gz
-sha256  83b315f74e29c3a4aa6ea38b6cf73b0bb7e37066d7a5d70972ac418a80aed62a  pyudev-0.18.tar.gz
+# md5 from https://pypi.python.org/pypi/pyudev/json, sha256 locally computed
+md5	cf4d9db7d772622144ca1be6b5d9353b  pyudev-0.21.0.tar.gz
+sha256	094b7a100150114748aaa3b70663485dd360457a709bfaaafe5a977371033f2b  pyudev-0.21.0.tar.gz
diff --git a/package/python-pyudev/python-pyudev.mk b/package/python-pyudev/python-pyudev.mk
index 70c4faf..a3e07b1 100644
--- a/package/python-pyudev/python-pyudev.mk
+++ b/package/python-pyudev/python-pyudev.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_PYUDEV_VERSION = 0.18
+PYTHON_PYUDEV_VERSION = 0.21.0
 PYTHON_PYUDEV_SOURCE = pyudev-$(PYTHON_PYUDEV_VERSION).tar.gz
-PYTHON_PYUDEV_SITE = https://pypi.python.org/packages/source/p/pyudev
+PYTHON_PYUDEV_SITE = https://pypi.python.org/packages/bc/a2/31a07829acea8e70a28c247f43fa5d981229ae0f9edfeddedf52de00709b
 PYTHON_PYUDEV_LICENSE = LGPLv2.1+
 PYTHON_PYUDEV_LICENSE_FILES = COPYING
 PYTHON_PYUDEV_SETUP_TYPE = setuptools
-- 
2.9.3
