From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 23 Jun 2018 09:51:10 +0200
Subject: [Buildroot] [git commit] python-raven: bump to version 6.9.0
Message-ID: <20180623080216.4AD2E813E3@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=28de0c07cf4e92f63a47328369e391241791cdc0
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Joseph Kogut <joseph.kogut@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/python-raven/python-raven.hash | 8 ++++----
 package/python-raven/python-raven.mk   | 4 ++--
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/package/python-raven/python-raven.hash b/package/python-raven/python-raven.hash
index ce21886e76..1e451ba41d 100644
--- a/package/python-raven/python-raven.hash
+++ b/package/python-raven/python-raven.hash
@@ -1,5 +1,5 @@
-# md5, sha256 from https://pypi.python.org/pypi/raven/json
-md5	35398b2447d337315e0069c2580d3468  raven-6.7.0.tar.gz
-sha256	f908e9b39f02580e7f822030d119ed3b2e8d32300a2fec6373e5827d588bbae7  raven-6.7.0.tar.gz
-# License file, locally calculated
+# md5, sha256 from https://pypi.org/pypi/raven/json
+md5	ba514edaca361a0edb476f76c959d8af  raven-6.9.0.tar.gz
+sha256	3fd787d19ebb49919268f06f19310e8112d619ef364f7989246fc8753d469888  raven-6.9.0.tar.gz
+# Locally computed sha256 checksums
 sha256	5ce9459bc19ced99cc9eb135d4f559ed01e336354bdf16dd998be85aa688c233  LICENSE
diff --git a/package/python-raven/python-raven.mk b/package/python-raven/python-raven.mk
index 4aa49f5b37..b822fcda78 100644
--- a/package/python-raven/python-raven.mk
+++ b/package/python-raven/python-raven.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_RAVEN_VERSION = 6.7.0
+PYTHON_RAVEN_VERSION = 6.9.0
 PYTHON_RAVEN_SOURCE = raven-$(PYTHON_RAVEN_VERSION).tar.gz
-PYTHON_RAVEN_SITE = https://files.pythonhosted.org/packages/d7/54/7d199f893a0ac01f8df9b7ec39c0f3ac19146e78b33401b1f4984c9d3583
+PYTHON_RAVEN_SITE = https://files.pythonhosted.org/packages/8f/80/e8d734244fd377fd7d65275b27252642512ccabe7850105922116340a37b
 PYTHON_RAVEN_SETUP_TYPE = setuptools
 PYTHON_RAVEN_LICENSE = BSD-3-Clause
 PYTHON_RAVEN_LICENSE_FILES = LICENSE
