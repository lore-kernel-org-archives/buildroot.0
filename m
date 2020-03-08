From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 8 Mar 2020 15:43:33 +0100
Subject: [Buildroot] [git commit branch/next] package/python-httplib2: bump
 to version 0.17.0
Message-ID: <20200308143108.277748FEB4@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=4b5970a93f918644459a0eeb4ff4c0add0f634db
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

PKG-INFO hash change is due to version bump.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/python-httplib2/python-httplib2.hash | 6 +++---
 package/python-httplib2/python-httplib2.mk   | 4 ++--
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/python-httplib2/python-httplib2.hash b/package/python-httplib2/python-httplib2.hash
index d299b61bc8..fe9995a9b3 100644
--- a/package/python-httplib2/python-httplib2.hash
+++ b/package/python-httplib2/python-httplib2.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/httplib2/json
-md5	427cda9f4d55762db325bd2eb46b7fe0  httplib2-0.14.0.tar.gz
-sha256	34537dcdd5e0f2386d29e0e2c6d4a1703a3b982d34c198a5102e6e5d6194b107  httplib2-0.14.0.tar.gz
+md5  4a55ae1d33721110bf81b4d197bfa862  httplib2-0.17.0.tar.gz
+sha256  de96d0a49f46d0ee7e0aae80141d37b8fcd6a68fb05d02e0b82c128592dd8261  httplib2-0.17.0.tar.gz
 # Locally computer sha256 checksums
-sha256	d8b8e99f77a260b8ca939f6a73ed0ea86977229a3d97f85547f499a62f61f5af  PKG-INFO
+sha256  bbc124e160cd5c0381fe9560aaed43462dd60371210dbb2c87f00b7fec9a05ba  PKG-INFO
diff --git a/package/python-httplib2/python-httplib2.mk b/package/python-httplib2/python-httplib2.mk
index a74c0e7c72..f9e1d8b3d7 100644
--- a/package/python-httplib2/python-httplib2.mk
+++ b/package/python-httplib2/python-httplib2.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_HTTPLIB2_VERSION = 0.14.0
+PYTHON_HTTPLIB2_VERSION = 0.17.0
 PYTHON_HTTPLIB2_SOURCE = httplib2-$(PYTHON_HTTPLIB2_VERSION).tar.gz
-PYTHON_HTTPLIB2_SITE = https://files.pythonhosted.org/packages/ce/2e/87461bfbb7e561203b759b3f7f639e2144226604372830d00a8279960ae1
+PYTHON_HTTPLIB2_SITE = https://files.pythonhosted.org/packages/6d/97/8225643419a53dd52d84c34d9d1e99bdbe18083dc760e7a2d0c47c0fab93
 PYTHON_HTTPLIB2_SETUP_TYPE = setuptools
 PYTHON_HTTPLIB2_LICENSE = MIT
 PYTHON_HTTPLIB2_LICENSE_FILES = PKG-INFO
