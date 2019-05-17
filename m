From: Serhii Sakhno <sergei.sakhno@gmail.com>
Date: Fri, 17 May 2019 20:53:42 +0300
Subject: [Buildroot] [PATCH] package/python-socketio: bump version to 4.0.1
Message-ID: <20190517175342.12371-1-sergei.sakhno@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

---
 package/python-socketio/python-socketio.hash | 6 ++----
 package/python-socketio/python-socketio.mk   | 5 +++--
 2 files changed, 5 insertions(+), 6 deletions(-)

diff --git a/package/python-socketio/python-socketio.hash b/package/python-socketio/python-socketio.hash
index 659d4d540c..ea6f2359da 100644
--- a/package/python-socketio/python-socketio.hash
+++ b/package/python-socketio/python-socketio.hash
@@ -1,4 +1,2 @@
-# md5 from https://pypi.python.org/pypi/python-socketio/json
-md5	44fd24e839dc3102920765f345740646  python-socketio-1.4.1.tar.gz
-# sha256 calculated by scanpypi
-sha256	ebd0984d831d602c8ec6d586ecde4466972cc7ed37dbbfe613192864e8263779  python-socketio-1.4.1.tar.gz
+md5	1c9e30c6a70eaa8176cc1a9fbb51453c  python-socketio-4.0.1.tar.gz
+sha256	8035604105058195dfa1c8ca1aff0435f08bbbdc3f72bb1f4b81723d129a4ecf  python-socketio-4.0.1.tar.gz
diff --git a/package/python-socketio/python-socketio.mk b/package/python-socketio/python-socketio.mk
index 57dc1f8b48..6ab5ed46e2 100644
--- a/package/python-socketio/python-socketio.mk
+++ b/package/python-socketio/python-socketio.mk
@@ -4,8 +4,9 @@
 #
 ################################################################################
 
-PYTHON_SOCKETIO_VERSION = 1.4.1
-PYTHON_SOCKETIO_SITE = https://pypi.python.org/packages/da/00/66103df6a116a2ce3ea662a9c8c80f337d43d7f138caf04e9af6dec24ba7
+PYTHON_SOCKETIO_VERSION = 4.0.1
+PYTHON_SOCKETIO_SOURCE = python-socketio-$(PYTHON_SOCKETIO_VERSION).tar.gz
+PYTHON_SOCKETIO_SITE = https://files.pythonhosted.org/packages/79/74/c280be1e037226ad2ca4ab9e02ec4ae0f127da2765800b1e3bc651d3d678
 PYTHON_SOCKETIO_SETUP_TYPE = setuptools
 PYTHON_SOCKETIO_LICENSE = MIT
 PYTHON_SOCKETIO_LICENSE_FILES = LICENSE
-- 
2.21.0
