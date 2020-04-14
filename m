From: James Hilliard <james.hilliard1@gmail.com>
Date: Mon, 13 Apr 2020 19:33:56 -0600
Subject: [Buildroot] [PATCH 1/1] package/python-httplib2: bump to version
 0.17.2
Message-ID: <20200414013356.58187-1-james.hilliard1@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

License hash change is due to httplib2 package version number update.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-httplib2/python-httplib2.hash | 6 +++---
 package/python-httplib2/python-httplib2.mk   | 4 ++--
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/python-httplib2/python-httplib2.hash b/package/python-httplib2/python-httplib2.hash
index fe9995a9b3..c272d8517c 100644
--- a/package/python-httplib2/python-httplib2.hash
+++ b/package/python-httplib2/python-httplib2.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/httplib2/json
-md5  4a55ae1d33721110bf81b4d197bfa862  httplib2-0.17.0.tar.gz
-sha256  de96d0a49f46d0ee7e0aae80141d37b8fcd6a68fb05d02e0b82c128592dd8261  httplib2-0.17.0.tar.gz
+md5  4c05b09eb6f6c20a31ca488c7a87dda9  httplib2-0.17.2.tar.gz
+sha256  eb7a6b137ae31e61c5f429083c5bebb71fe5fd1958e7f3d5c39b21b11cd4b290  httplib2-0.17.2.tar.gz
 # Locally computer sha256 checksums
-sha256  bbc124e160cd5c0381fe9560aaed43462dd60371210dbb2c87f00b7fec9a05ba  PKG-INFO
+sha256  4205f0d88e04380ba13b9c60e2f85771196b66ee84bf48971d30d82a78e84c3f  PKG-INFO
diff --git a/package/python-httplib2/python-httplib2.mk b/package/python-httplib2/python-httplib2.mk
index f9e1d8b3d7..fbdb6d83c4 100644
--- a/package/python-httplib2/python-httplib2.mk
+++ b/package/python-httplib2/python-httplib2.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_HTTPLIB2_VERSION = 0.17.0
+PYTHON_HTTPLIB2_VERSION = 0.17.2
 PYTHON_HTTPLIB2_SOURCE = httplib2-$(PYTHON_HTTPLIB2_VERSION).tar.gz
-PYTHON_HTTPLIB2_SITE = https://files.pythonhosted.org/packages/6d/97/8225643419a53dd52d84c34d9d1e99bdbe18083dc760e7a2d0c47c0fab93
+PYTHON_HTTPLIB2_SITE = https://files.pythonhosted.org/packages/1b/f0/a35a448afea308aeb6a1430dbcfb46f4cef11360cbc18f22af6e567bb847
 PYTHON_HTTPLIB2_SETUP_TYPE = setuptools
 PYTHON_HTTPLIB2_LICENSE = MIT
 PYTHON_HTTPLIB2_LICENSE_FILES = PKG-INFO
-- 
2.20.1
