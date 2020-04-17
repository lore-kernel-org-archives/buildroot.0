From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 17 Apr 2020 22:02:26 +0200
Subject: [Buildroot] [git commit] package/python-autobahn: bump to version
 20.4.2
Message-ID: <20200417194859.411A58EF63@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=674c4ab6ad19406227c756778f8195eb3490ba63
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/python-autobahn/python-autobahn.hash | 4 ++--
 package/python-autobahn/python-autobahn.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-autobahn/python-autobahn.hash b/package/python-autobahn/python-autobahn.hash
index 3e4c167cfe..a49de07b70 100644
--- a/package/python-autobahn/python-autobahn.hash
+++ b/package/python-autobahn/python-autobahn.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/autobahn/json
-md5  d8a916d44eced92c3152ac59b2805118  autobahn-20.4.1.tar.gz
-sha256  6d3989e4d8b0e961c9d3bb1fe133099767bbd5080cea21b2bdc2a0a1b4581b2e  autobahn-20.4.1.tar.gz
+md5  9702594ee1c5613e9bb31af105140b5b  autobahn-20.4.2.tar.gz
+sha256  1c943f94bb759c07445a6984a3bc4c76f73e2a90a1fc2c3521c211579b73d3db  autobahn-20.4.2.tar.gz
 # Locally computed sha256 checksums
 sha256  0387eefce570453daaa60633f28676003731eeca28b2d0a0071c628e3a0004ef  LICENSE
diff --git a/package/python-autobahn/python-autobahn.mk b/package/python-autobahn/python-autobahn.mk
index 17bf338c24..d4e52352f2 100644
--- a/package/python-autobahn/python-autobahn.mk
+++ b/package/python-autobahn/python-autobahn.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_AUTOBAHN_VERSION = 20.4.1
+PYTHON_AUTOBAHN_VERSION = 20.4.2
 PYTHON_AUTOBAHN_SOURCE = autobahn-$(PYTHON_AUTOBAHN_VERSION).tar.gz
-PYTHON_AUTOBAHN_SITE = https://files.pythonhosted.org/packages/a3/2e/58f68840eef4a6740a41f59c5d3206a76e49993f90c954ae9777b120e09c
+PYTHON_AUTOBAHN_SITE = https://files.pythonhosted.org/packages/13/0e/b182b46ea437e59003de78c68bb00824d304dcfe58e7235f29c4f275eca0
 PYTHON_AUTOBAHN_LICENSE = MIT
 PYTHON_AUTOBAHN_LICENSE_FILES = LICENSE
 PYTHON_AUTOBAHN_SETUP_TYPE = setuptools
