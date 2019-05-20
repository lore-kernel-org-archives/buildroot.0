From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 20 May 2019 21:11:56 +0200
Subject: [Buildroot] [git commit] package/python-socketio: bump version to
 4.0.2
Message-ID: <20190602201235.0961481354@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=58c16f4af15003d9a9aebcaa2d78b9c7275c778e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Serhii Sakhno <sergei.sakhno@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/python-socketio/python-socketio.hash | 9 +++++----
 package/python-socketio/python-socketio.mk   | 4 ++--
 2 files changed, 7 insertions(+), 6 deletions(-)

diff --git a/package/python-socketio/python-socketio.hash b/package/python-socketio/python-socketio.hash
index 659d4d540c..a6948659c7 100644
--- a/package/python-socketio/python-socketio.hash
+++ b/package/python-socketio/python-socketio.hash
@@ -1,4 +1,5 @@
-# md5 from https://pypi.python.org/pypi/python-socketio/json
-md5	44fd24e839dc3102920765f345740646  python-socketio-1.4.1.tar.gz
-# sha256 calculated by scanpypi
-sha256	ebd0984d831d602c8ec6d586ecde4466972cc7ed37dbbfe613192864e8263779  python-socketio-1.4.1.tar.gz
+# md5, sha256 from https://pypi.org/pypi/python-socketio/json
+md5	51d3820673710afa5caa442c17b08635  python-socketio-4.0.2.tar.gz
+sha256	7bb11f79981eaad08f33b98ffcd501590e5a2c645fdd7bb3fb0a5d9078e08bbc  python-socketio-4.0.2.tar.gz
+# Locally computed sha256 checksums
+sha256	c9e97d3dbc1fbbcdb4f7808b282cd646db887aff4f5313fe6bbe8d4c31405a9c  LICENSE
diff --git a/package/python-socketio/python-socketio.mk b/package/python-socketio/python-socketio.mk
index 57dc1f8b48..d68e76a2e3 100644
--- a/package/python-socketio/python-socketio.mk
+++ b/package/python-socketio/python-socketio.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-PYTHON_SOCKETIO_VERSION = 1.4.1
-PYTHON_SOCKETIO_SITE = https://pypi.python.org/packages/da/00/66103df6a116a2ce3ea662a9c8c80f337d43d7f138caf04e9af6dec24ba7
+PYTHON_SOCKETIO_VERSION = 4.0.2
+PYTHON_SOCKETIO_SITE = https://files.pythonhosted.org/packages/41/94/f59c7c61e4544d27ad0cdca354a20b4fc12674fae18c4f6a00e34a88007e
 PYTHON_SOCKETIO_SETUP_TYPE = setuptools
 PYTHON_SOCKETIO_LICENSE = MIT
 PYTHON_SOCKETIO_LICENSE_FILES = LICENSE
