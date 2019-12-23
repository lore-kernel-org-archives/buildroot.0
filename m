From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 23 Dec 2019 20:51:07 +0100
Subject: [Buildroot] [git commit] package/python-autobahn: bump to version
 19.11.1
Message-ID: <20191223194200.9B0D18295D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=60308ef387a01a22f29cf5bae79f974a24fea5fa
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/python-autobahn/python-autobahn.hash | 4 ++--
 package/python-autobahn/python-autobahn.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-autobahn/python-autobahn.hash b/package/python-autobahn/python-autobahn.hash
index 4020daa6b9..1dc6c1eeaf 100644
--- a/package/python-autobahn/python-autobahn.hash
+++ b/package/python-autobahn/python-autobahn.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/autobahn/json
-md5	8900783822b570e0395c4bade08e0d51  autobahn-19.10.1.tar.gz
-sha256	734385b00547448b3f30a752cbfd2900d15924d77dc4a1699b8bce1ea8899f39  autobahn-19.10.1.tar.gz
+md5	472d965c75dba0f8cb5f3b9f9001ed1b  autobahn-19.11.1.tar.gz
+sha256	201b9879b49c6e259d4126dbafe9e3c73807de0c242d50065fbebc62c6ccb181  autobahn-19.11.1.tar.gz
 # Locally computed sha256 checksums
 sha256	0387eefce570453daaa60633f28676003731eeca28b2d0a0071c628e3a0004ef  LICENSE
diff --git a/package/python-autobahn/python-autobahn.mk b/package/python-autobahn/python-autobahn.mk
index 9296492649..6c5c608b9a 100644
--- a/package/python-autobahn/python-autobahn.mk
+++ b/package/python-autobahn/python-autobahn.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_AUTOBAHN_VERSION = 19.10.1
+PYTHON_AUTOBAHN_VERSION = 19.11.1
 PYTHON_AUTOBAHN_SOURCE = autobahn-$(PYTHON_AUTOBAHN_VERSION).tar.gz
-PYTHON_AUTOBAHN_SITE = https://files.pythonhosted.org/packages/8d/bb/024c4e669f0b82bc895f95c10105156db0543648db8305390730c4078edf
+PYTHON_AUTOBAHN_SITE = https://files.pythonhosted.org/packages/3f/f4/e907b172d3c1d912b8da57560b8b298ebad22f900f8a412002247716328a
 PYTHON_AUTOBAHN_LICENSE = MIT
 PYTHON_AUTOBAHN_LICENSE_FILES = LICENSE
 PYTHON_AUTOBAHN_SETUP_TYPE = setuptools
