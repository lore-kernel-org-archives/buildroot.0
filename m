From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 18 Oct 2019 21:10:47 +0200
Subject: [Buildroot] [git commit] package/python-socketio: bump to version
 4.3.1
Message-ID: <20191018191755.B5609826DB@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=fc7b51d38da17dbe292425d326a78225d8dcdf59
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Asaf Kahlon <asafka7@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/python-socketio/python-socketio.hash | 4 ++--
 package/python-socketio/python-socketio.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-socketio/python-socketio.hash b/package/python-socketio/python-socketio.hash
index a6948659c7..d0d8a87dcf 100644
--- a/package/python-socketio/python-socketio.hash
+++ b/package/python-socketio/python-socketio.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/python-socketio/json
-md5	51d3820673710afa5caa442c17b08635  python-socketio-4.0.2.tar.gz
-sha256	7bb11f79981eaad08f33b98ffcd501590e5a2c645fdd7bb3fb0a5d9078e08bbc  python-socketio-4.0.2.tar.gz
+md5	86cd47dddea1785ce7a6c72f55c93fe7  python-socketio-4.3.1.tar.gz
+sha256	506b2cf7a520b40ea0b3f25e1272eff8de134dce6f471c1f6bc0de8c90fe8c57  python-socketio-4.3.1.tar.gz
 # Locally computed sha256 checksums
 sha256	c9e97d3dbc1fbbcdb4f7808b282cd646db887aff4f5313fe6bbe8d4c31405a9c  LICENSE
diff --git a/package/python-socketio/python-socketio.mk b/package/python-socketio/python-socketio.mk
index d68e76a2e3..ece4f65b78 100644
--- a/package/python-socketio/python-socketio.mk
+++ b/package/python-socketio/python-socketio.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-PYTHON_SOCKETIO_VERSION = 4.0.2
-PYTHON_SOCKETIO_SITE = https://files.pythonhosted.org/packages/41/94/f59c7c61e4544d27ad0cdca354a20b4fc12674fae18c4f6a00e34a88007e
+PYTHON_SOCKETIO_VERSION = 4.3.1
+PYTHON_SOCKETIO_SITE = https://files.pythonhosted.org/packages/36/87/e9128a4da04df991fbdb01f44dc4d6dd8f6c03bfd4d1f42dcd6779fd975a
 PYTHON_SOCKETIO_SETUP_TYPE = setuptools
 PYTHON_SOCKETIO_LICENSE = MIT
 PYTHON_SOCKETIO_LICENSE_FILES = LICENSE
