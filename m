From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 27 Feb 2020 09:11:47 +0100
Subject: [Buildroot] [git commit branch/next] package/python-autobahn: bump
 to version 20.2.1
Message-ID: <20200227080701.BDCAA8EC47@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=d8bab87a12f89e72d69bf639e4d297224a9ad2e7
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/python-autobahn/python-autobahn.hash | 4 ++--
 package/python-autobahn/python-autobahn.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-autobahn/python-autobahn.hash b/package/python-autobahn/python-autobahn.hash
index 1dc6c1eeaf..204aba7783 100644
--- a/package/python-autobahn/python-autobahn.hash
+++ b/package/python-autobahn/python-autobahn.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/autobahn/json
-md5	472d965c75dba0f8cb5f3b9f9001ed1b  autobahn-19.11.1.tar.gz
-sha256	201b9879b49c6e259d4126dbafe9e3c73807de0c242d50065fbebc62c6ccb181  autobahn-19.11.1.tar.gz
+md5	8889605311865aa8fedd1819c6df2c30  autobahn-20.2.1.tar.gz
+sha256	1ec603ea374a3b9d85540c499709c41f35f7c6e288b571d12da14aba6c381211  autobahn-20.2.1.tar.gz
 # Locally computed sha256 checksums
 sha256	0387eefce570453daaa60633f28676003731eeca28b2d0a0071c628e3a0004ef  LICENSE
diff --git a/package/python-autobahn/python-autobahn.mk b/package/python-autobahn/python-autobahn.mk
index 6c5c608b9a..5d69253095 100644
--- a/package/python-autobahn/python-autobahn.mk
+++ b/package/python-autobahn/python-autobahn.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_AUTOBAHN_VERSION = 19.11.1
+PYTHON_AUTOBAHN_VERSION = 20.2.1
 PYTHON_AUTOBAHN_SOURCE = autobahn-$(PYTHON_AUTOBAHN_VERSION).tar.gz
-PYTHON_AUTOBAHN_SITE = https://files.pythonhosted.org/packages/3f/f4/e907b172d3c1d912b8da57560b8b298ebad22f900f8a412002247716328a
+PYTHON_AUTOBAHN_SITE = https://files.pythonhosted.org/packages/ef/6d/74e6ceea815ee836a64846ace4f754dacaf8fae58a37b4d3c912bc9d37ea
 PYTHON_AUTOBAHN_LICENSE = MIT
 PYTHON_AUTOBAHN_LICENSE_FILES = LICENSE
 PYTHON_AUTOBAHN_SETUP_TYPE = setuptools
