From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 28 Nov 2018 22:06:51 +0100
Subject: [Buildroot] [git commit] package/python-engineio: bump to version
 3.0.0
Message-ID: <20181202071600.2922C803E1@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=27a13216a6cc60d3abdc2035dddb70c766695ced
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Asaf Kahlon <asafka7@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/python-engineio/python-engineio.hash | 4 ++--
 package/python-engineio/python-engineio.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-engineio/python-engineio.hash b/package/python-engineio/python-engineio.hash
index 7bf1a49410..7a9a1fdad0 100644
--- a/package/python-engineio/python-engineio.hash
+++ b/package/python-engineio/python-engineio.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/python-engineio/json
-md5	92d2e1b62083ce8f0dcd8fd905b0dd9d  python-engineio-2.3.2.tar.gz
-sha256	871f4d022eb9171e380281266ba2aef0759b264ba862350bc94e7a597a98a443  python-engineio-2.3.2.tar.gz
+md5	a7930cb8bf957f1b12e1a21ae5b57982  python-engineio-3.0.0.tar.gz
+sha256	bb8b5888adb852614b4b1861586ee7d89145cbd2ebba03ed7043e64c029bbb3b  python-engineio-3.0.0.tar.gz
 # Locally computed sha256 checksums
 sha256	c9e97d3dbc1fbbcdb4f7808b282cd646db887aff4f5313fe6bbe8d4c31405a9c  LICENSE
diff --git a/package/python-engineio/python-engineio.mk b/package/python-engineio/python-engineio.mk
index e730c39cd2..9bda632661 100644
--- a/package/python-engineio/python-engineio.mk
+++ b/package/python-engineio/python-engineio.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-PYTHON_ENGINEIO_VERSION = 2.3.2
-PYTHON_ENGINEIO_SITE = https://files.pythonhosted.org/packages/66/18/09516793c68e0f7fb759d54c109a09a86e31c3e685eb77884613a1c1a7b3
+PYTHON_ENGINEIO_VERSION = 3.0.0
+PYTHON_ENGINEIO_SITE = https://files.pythonhosted.org/packages/51/a4/1642a75f1206a14e9a75f286d38b1794b13e9ee3169f57cb939cb99ffea3
 PYTHON_ENGINEIO_SETUP_TYPE = setuptools
 PYTHON_ENGINEIO_LICENSE = MIT
 PYTHON_ENGINEIO_LICENSE_FILES = LICENSE
