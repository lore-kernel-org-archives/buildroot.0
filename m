From: James Hilliard <james.hilliard1@gmail.com>
Date: Thu, 16 Apr 2020 04:04:28 -0600
Subject: [Buildroot] [PATCH 1/1] package/python-pycairo: bump to version
 1.19.1
Message-ID: <20200416100428.91405-1-james.hilliard1@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

License hash change is due to upstream commit:
https://github.com/pygobject/pycairo/commit/886ecfd5286a8af2202e521ef2d4d7fac18f1d6f

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-pycairo/python-pycairo.hash | 10 +++++-----
 package/python-pycairo/python-pycairo.mk   |  4 ++--
 2 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/package/python-pycairo/python-pycairo.hash b/package/python-pycairo/python-pycairo.hash
index f0b76b1e38..c617d8b601 100644
--- a/package/python-pycairo/python-pycairo.hash
+++ b/package/python-pycairo/python-pycairo.hash
@@ -1,7 +1,7 @@
 # md5, sha256 from https://pypi.org/pypi/pycairo/json
-md5	be2ba51f234270dec340f28f1695a95e  pycairo-1.18.2.tar.gz
-sha256	dcb853fd020729516e8828ad364084e752327d4cff8505d20b13504b32b16531  pycairo-1.18.2.tar.gz
+md5  59bc5c5d1debc3af0f6791af9d612551  pycairo-1.19.1.tar.gz
+sha256  2c143183280feb67f5beb4e543fd49990c28e7df427301ede04fc550d3562e84  pycairo-1.19.1.tar.gz
 # Locally computed sha256 checksums
-sha256	22c7747e2decb1b26e395b45dbaeb627784ef7fdbf2b80ac09a26a560277e58a  COPYING
-sha256	d80c9d084ebfb50ea1ed91bfbc2410d6ce542097a32c43b00781b83adcb8c77f  COPYING-LGPL-2.1
-sha256	53692a2ed6c6a2c6ec9b32dd0b820dfae91e0a1fcdf625ca9ed0bdf8705fcc4f  COPYING-MPL-1.1
+sha256  360b9a526d47c51a7cab7f1ec49ca5893050562d639b742d588934ff84823a72  COPYING
+sha256  d80c9d084ebfb50ea1ed91bfbc2410d6ce542097a32c43b00781b83adcb8c77f  COPYING-LGPL-2.1
+sha256  53692a2ed6c6a2c6ec9b32dd0b820dfae91e0a1fcdf625ca9ed0bdf8705fcc4f  COPYING-MPL-1.1
diff --git a/package/python-pycairo/python-pycairo.mk b/package/python-pycairo/python-pycairo.mk
index 5a48a2a29a..c635498d52 100644
--- a/package/python-pycairo/python-pycairo.mk
+++ b/package/python-pycairo/python-pycairo.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_PYCAIRO_VERSION = 1.18.2
+PYTHON_PYCAIRO_VERSION = 1.19.1
 PYTHON_PYCAIRO_SOURCE = pycairo-$(PYTHON_PYCAIRO_VERSION).tar.gz
-PYTHON_PYCAIRO_SITE = https://files.pythonhosted.org/packages/3c/1a/c0478ecab31baae50fda9956547788afbd0ca563adc52c9b03cab30f17eb
+PYTHON_PYCAIRO_SITE = https://files.pythonhosted.org/packages/e8/9d/c8be300fc6b1298559d37a071c3833b0b251e0fff334d2e4c408d5789162
 PYTHON_PYCAIRO_SETUP_TYPE = setuptools
 PYTHON_PYCAIRO_DEPENDENCIES = cairo
 PYTHON_PYCAIRO_LICENSE = LGPL-2.1 or MPL-1.1
-- 
2.20.1
