From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 8 Oct 2019 22:42:00 +0200
Subject: [Buildroot] [git commit] package/python-autobahn: bump to version
 19.10.1
Message-ID: <20191008203844.10F618B7E6@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=26d9d4dca656e29a36bbe3320ce2bf946b6e9fc0
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Asaf Kahlon <asafka7@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/python-autobahn/python-autobahn.hash | 4 ++--
 package/python-autobahn/python-autobahn.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-autobahn/python-autobahn.hash b/package/python-autobahn/python-autobahn.hash
index 344fc8d6a4..4020daa6b9 100644
--- a/package/python-autobahn/python-autobahn.hash
+++ b/package/python-autobahn/python-autobahn.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/autobahn/json
-md5	e6045ea79a9c22f6ad1810670d833bcc  autobahn-19.8.1.tar.gz
-sha256	294e7381dd54e73834354832604ae85567caf391c39363fed0ea2bfa86aa4304  autobahn-19.8.1.tar.gz
+md5	8900783822b570e0395c4bade08e0d51  autobahn-19.10.1.tar.gz
+sha256	734385b00547448b3f30a752cbfd2900d15924d77dc4a1699b8bce1ea8899f39  autobahn-19.10.1.tar.gz
 # Locally computed sha256 checksums
 sha256	0387eefce570453daaa60633f28676003731eeca28b2d0a0071c628e3a0004ef  LICENSE
diff --git a/package/python-autobahn/python-autobahn.mk b/package/python-autobahn/python-autobahn.mk
index 56e6d54227..9296492649 100644
--- a/package/python-autobahn/python-autobahn.mk
+++ b/package/python-autobahn/python-autobahn.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_AUTOBAHN_VERSION = 19.8.1
+PYTHON_AUTOBAHN_VERSION = 19.10.1
 PYTHON_AUTOBAHN_SOURCE = autobahn-$(PYTHON_AUTOBAHN_VERSION).tar.gz
-PYTHON_AUTOBAHN_SITE = https://files.pythonhosted.org/packages/7b/b9/3460d9f73aba656f06a22f2bbc92e1c31e567372d66614651582858c93ae
+PYTHON_AUTOBAHN_SITE = https://files.pythonhosted.org/packages/8d/bb/024c4e669f0b82bc895f95c10105156db0543648db8305390730c4078edf
 PYTHON_AUTOBAHN_LICENSE = MIT
 PYTHON_AUTOBAHN_LICENSE_FILES = LICENSE
 PYTHON_AUTOBAHN_SETUP_TYPE = setuptools
