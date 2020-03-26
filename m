From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 26 Mar 2020 21:59:09 +0100
Subject: [Buildroot] [git commit] package/python-autobahn: bump to version
 20.3.1
Message-ID: <20200326210720.EF09288323@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=e701582a50e826a3f512cae2ffb86958cc32191e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/python-autobahn/python-autobahn.hash | 6 +++---
 package/python-autobahn/python-autobahn.mk   | 4 ++--
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/python-autobahn/python-autobahn.hash b/package/python-autobahn/python-autobahn.hash
index 204aba7783..1ecac0d5b7 100644
--- a/package/python-autobahn/python-autobahn.hash
+++ b/package/python-autobahn/python-autobahn.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/autobahn/json
-md5	8889605311865aa8fedd1819c6df2c30  autobahn-20.2.1.tar.gz
-sha256	1ec603ea374a3b9d85540c499709c41f35f7c6e288b571d12da14aba6c381211  autobahn-20.2.1.tar.gz
+md5  f4f7da4a23a9fa56bd299cc872b90538  autobahn-20.3.1.tar.gz
+sha256  88e150e4b3d284b83daafd8e0b289a5625ee00c633a2c580055bf1be2d391002  autobahn-20.3.1.tar.gz
 # Locally computed sha256 checksums
-sha256	0387eefce570453daaa60633f28676003731eeca28b2d0a0071c628e3a0004ef  LICENSE
+sha256  0387eefce570453daaa60633f28676003731eeca28b2d0a0071c628e3a0004ef  LICENSE
diff --git a/package/python-autobahn/python-autobahn.mk b/package/python-autobahn/python-autobahn.mk
index 5d69253095..8b1e0e73b5 100644
--- a/package/python-autobahn/python-autobahn.mk
+++ b/package/python-autobahn/python-autobahn.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_AUTOBAHN_VERSION = 20.2.1
+PYTHON_AUTOBAHN_VERSION = 20.3.1
 PYTHON_AUTOBAHN_SOURCE = autobahn-$(PYTHON_AUTOBAHN_VERSION).tar.gz
-PYTHON_AUTOBAHN_SITE = https://files.pythonhosted.org/packages/ef/6d/74e6ceea815ee836a64846ace4f754dacaf8fae58a37b4d3c912bc9d37ea
+PYTHON_AUTOBAHN_SITE = https://files.pythonhosted.org/packages/54/bc/ec75ee259752ad65ddc30782a3128dadd79345f1aa0d4f76722996f37480
 PYTHON_AUTOBAHN_LICENSE = MIT
 PYTHON_AUTOBAHN_LICENSE_FILES = LICENSE
 PYTHON_AUTOBAHN_SETUP_TYPE = setuptools
