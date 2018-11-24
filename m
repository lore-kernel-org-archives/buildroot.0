From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 24 Nov 2018 12:59:27 +0100
Subject: [Buildroot] [git commit] python-autobahn: bump to version 18.11.2
Message-ID: <20181202071558.93EFF82855@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=4c40968e0508772f505fa03c689f423d6908f406
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Asaf Kahlon <asafka7@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/python-autobahn/python-autobahn.hash | 4 ++--
 package/python-autobahn/python-autobahn.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-autobahn/python-autobahn.hash b/package/python-autobahn/python-autobahn.hash
index 522e28b5e5..024617fd81 100644
--- a/package/python-autobahn/python-autobahn.hash
+++ b/package/python-autobahn/python-autobahn.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/autobahn/json
-md5	a3a0648371b41328282a9ab7fe48ccbe  autobahn-18.11.1.tar.gz
-sha256	c7e775e46fc033160fa89942de4953ca739f26167f74431dc2c8a3cd165b8755  autobahn-18.11.1.tar.gz
+md5	4a63c94ea306e07602eaca6befd86751  autobahn-18.11.2.tar.gz
+sha256	43262e500aaf8b89fb5f0b60ab13163500ee877908cdd6861208546d95c6dba0  autobahn-18.11.2.tar.gz
 # Locally computed sha256 checksums
 sha256	0387eefce570453daaa60633f28676003731eeca28b2d0a0071c628e3a0004ef  LICENSE
diff --git a/package/python-autobahn/python-autobahn.mk b/package/python-autobahn/python-autobahn.mk
index c5faacf965..d175244fc0 100644
--- a/package/python-autobahn/python-autobahn.mk
+++ b/package/python-autobahn/python-autobahn.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_AUTOBAHN_VERSION = 18.11.1
+PYTHON_AUTOBAHN_VERSION = 18.11.2
 PYTHON_AUTOBAHN_SOURCE = autobahn-$(PYTHON_AUTOBAHN_VERSION).tar.gz
-PYTHON_AUTOBAHN_SITE = https://files.pythonhosted.org/packages/01/ee/d401d58dc7732fadf4fd12d7fb87dd2f3e5e2d0ba65865495565f97c2c31
+PYTHON_AUTOBAHN_SITE = https://files.pythonhosted.org/packages/3a/9f/9552ce8fec2703370f63eedbedffa1151865f1265fbfc5c3bbd1029710cc
 PYTHON_AUTOBAHN_LICENSE = MIT
 PYTHON_AUTOBAHN_LICENSE_FILES = LICENSE
 PYTHON_AUTOBAHN_SETUP_TYPE = setuptools
