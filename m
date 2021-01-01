From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 1 Jan 2021 23:47:12 +0100
Subject: [Buildroot] [git commit] package/python-chardet: bump version to
 4.0.0
Message-ID: <20210101223449.4F0B88404B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=9c4851f782ecb0cbd8bcd5cd5d14add407caa05d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Added sha256 hash provided by upstream, reformatted hashes.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/python-chardet/python-chardet.hash | 6 +++---
 package/python-chardet/python-chardet.mk   | 4 ++--
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/python-chardet/python-chardet.hash b/package/python-chardet/python-chardet.hash
index a1804603a2..fb4260a227 100644
--- a/package/python-chardet/python-chardet.hash
+++ b/package/python-chardet/python-chardet.hash
@@ -1,5 +1,5 @@
-# md5 from https://pypi.python.org/pypi/chardet/json
-md5	7dd1ba7f9c77e32351b0a0cfacf4055c  chardet-3.0.4.tar.gz
+# md5, sha256 from https://pypi.org/pypi/chardet/json
+md5  bc9a5603d8d0994b2d4cbf255f99e654  chardet-4.0.0.tar.gz
+sha256  0d6f53a15db4120f2b08c94f11e7d93d2c911ee118b6b30a04ec3ee8310179fa  chardet-4.0.0.tar.gz
 # Locally computed
-sha256	84ab92ed1c4d4f16916e05906b6b75a6c0fb5db821cc65e70cbd64a3e2a5eaae  chardet-3.0.4.tar.gz
 sha256  6095e9ffa777dd22839f7801aa845b31c9ed07f3d6bf8a26dc5d2dec8ccc0ef3  LICENSE
diff --git a/package/python-chardet/python-chardet.mk b/package/python-chardet/python-chardet.mk
index 5161098945..448877d056 100644
--- a/package/python-chardet/python-chardet.mk
+++ b/package/python-chardet/python-chardet.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_CHARDET_VERSION = 3.0.4
+PYTHON_CHARDET_VERSION = 4.0.0
 PYTHON_CHARDET_SOURCE = chardet-$(PYTHON_CHARDET_VERSION).tar.gz
-PYTHON_CHARDET_SITE = https://pypi.python.org/packages/fc/bb/a5768c230f9ddb03acc9ef3f0d4a3cf93462473795d18e9535498c8f929d
+PYTHON_CHARDET_SITE = https://files.pythonhosted.org/packages/ee/2d/9cdc2b527e127b4c9db64b86647d567985940ac3698eeabc7ffaccb4ea61
 PYTHON_CHARDET_SETUP_TYPE = setuptools
 PYTHON_CHARDET_LICENSE = LGPL-2.1+
 PYTHON_CHARDET_LICENSE_FILES = LICENSE
