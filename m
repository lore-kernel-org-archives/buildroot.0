From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 8 Nov 2018 21:04:59 +0100
Subject: [Buildroot] [git commit] python-autobahn: bump to version 18.11.1
Message-ID: <20181108200244.714C4817A6@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=83c19a40c09e40db3bfcd0dbfab58bd9e2112cf3
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Asaf Kahlon <asafka7@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/python-autobahn/python-autobahn.hash | 4 ++--
 package/python-autobahn/python-autobahn.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-autobahn/python-autobahn.hash b/package/python-autobahn/python-autobahn.hash
index 809678ba6e..522e28b5e5 100644
--- a/package/python-autobahn/python-autobahn.hash
+++ b/package/python-autobahn/python-autobahn.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/autobahn/json
-md5	66767ee7b3dd31e76c77ab18eeaa619c  autobahn-18.10.1.tar.gz
-sha256	b5767bebd94ba13fc286604f889f208e7babc77d72d9f372d331bc14c89c5a40  autobahn-18.10.1.tar.gz
+md5	a3a0648371b41328282a9ab7fe48ccbe  autobahn-18.11.1.tar.gz
+sha256	c7e775e46fc033160fa89942de4953ca739f26167f74431dc2c8a3cd165b8755  autobahn-18.11.1.tar.gz
 # Locally computed sha256 checksums
 sha256	0387eefce570453daaa60633f28676003731eeca28b2d0a0071c628e3a0004ef  LICENSE
diff --git a/package/python-autobahn/python-autobahn.mk b/package/python-autobahn/python-autobahn.mk
index 7ec012efe4..c5faacf965 100644
--- a/package/python-autobahn/python-autobahn.mk
+++ b/package/python-autobahn/python-autobahn.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_AUTOBAHN_VERSION = 18.10.1
+PYTHON_AUTOBAHN_VERSION = 18.11.1
 PYTHON_AUTOBAHN_SOURCE = autobahn-$(PYTHON_AUTOBAHN_VERSION).tar.gz
-PYTHON_AUTOBAHN_SITE = https://files.pythonhosted.org/packages/e3/42/8a8ba7e371c5d0cbacf42cafd9f562e12cab613edb1f752b6ddfa2f3b280
+PYTHON_AUTOBAHN_SITE = https://files.pythonhosted.org/packages/01/ee/d401d58dc7732fadf4fd12d7fb87dd2f3e5e2d0ba65865495565f97c2c31
 PYTHON_AUTOBAHN_LICENSE = MIT
 PYTHON_AUTOBAHN_LICENSE_FILES = LICENSE
 PYTHON_AUTOBAHN_SETUP_TYPE = setuptools
