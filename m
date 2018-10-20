From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 20 Oct 2018 14:39:19 +0200
Subject: [Buildroot] [git commit] python-autobahn: bump to version 18.10.1
Message-ID: <20181020123843.08097802F7@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=5e1aae8cca2531b8bcd2ed999324311da58b417d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Asaf Kahlon <asafka7@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/python-autobahn/python-autobahn.hash | 4 ++--
 package/python-autobahn/python-autobahn.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-autobahn/python-autobahn.hash b/package/python-autobahn/python-autobahn.hash
index a59ee2df5d..809678ba6e 100644
--- a/package/python-autobahn/python-autobahn.hash
+++ b/package/python-autobahn/python-autobahn.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/autobahn/json
-md5	e8192e3a4bb7dc59db2a82234b13b080  autobahn-18.9.2.tar.gz
-sha256	d98b924f06865700116ee616027e4a6d678004a7b44e0d01cb262eab333112d6  autobahn-18.9.2.tar.gz
+md5	66767ee7b3dd31e76c77ab18eeaa619c  autobahn-18.10.1.tar.gz
+sha256	b5767bebd94ba13fc286604f889f208e7babc77d72d9f372d331bc14c89c5a40  autobahn-18.10.1.tar.gz
 # Locally computed sha256 checksums
 sha256	0387eefce570453daaa60633f28676003731eeca28b2d0a0071c628e3a0004ef  LICENSE
diff --git a/package/python-autobahn/python-autobahn.mk b/package/python-autobahn/python-autobahn.mk
index 1668b241b0..7ec012efe4 100644
--- a/package/python-autobahn/python-autobahn.mk
+++ b/package/python-autobahn/python-autobahn.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_AUTOBAHN_VERSION = 18.9.2
+PYTHON_AUTOBAHN_VERSION = 18.10.1
 PYTHON_AUTOBAHN_SOURCE = autobahn-$(PYTHON_AUTOBAHN_VERSION).tar.gz
-PYTHON_AUTOBAHN_SITE = https://files.pythonhosted.org/packages/68/f8/43ef6e614f27a97a88a6e91768d3917adff630936ec71665fcc3bec48e53
+PYTHON_AUTOBAHN_SITE = https://files.pythonhosted.org/packages/e3/42/8a8ba7e371c5d0cbacf42cafd9f562e12cab613edb1f752b6ddfa2f3b280
 PYTHON_AUTOBAHN_LICENSE = MIT
 PYTHON_AUTOBAHN_LICENSE_FILES = LICENSE
 PYTHON_AUTOBAHN_SETUP_TYPE = setuptools
