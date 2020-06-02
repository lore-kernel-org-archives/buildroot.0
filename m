From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 02 Jun 2020 20:01:53 -0000
Subject: [Buildroot] [git commit] package/python-janus: bump to version 0.5.0
Message-ID: <20200602200120.D55BA8256A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=d4201027cbb3e033c84d5c95db1261e10e6ab641
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/python-janus/python-janus.hash | 6 +++---
 package/python-janus/python-janus.mk   | 4 ++--
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/python-janus/python-janus.hash b/package/python-janus/python-janus.hash
index 5098769901..9108db6325 100644
--- a/package/python-janus/python-janus.hash
+++ b/package/python-janus/python-janus.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/janus/json
-md5	26283b122439fbca4ae1db18ff839b7c  janus-0.4.0.tar.gz
-sha256	cfc221683160b91b35bae1917e2957b78dad10a2e634f4f8ed119ed72e2a88ef  janus-0.4.0.tar.gz
+md5  577c3c8939ef945c5dc00319bd59484f  janus-0.5.0.tar.gz
+sha256  0700f5537d076521851d19b7625545c5e76f6d5792ab17984f28230adcc3b34c  janus-0.5.0.tar.gz
 # Locally computed sha256 checksums
-sha256	8b177cccb6ddec12a9fc97bd49e7e2bbcd92464625624bd8bdbfad799ae606e9  LICENSE
+sha256  8b177cccb6ddec12a9fc97bd49e7e2bbcd92464625624bd8bdbfad799ae606e9  LICENSE
diff --git a/package/python-janus/python-janus.mk b/package/python-janus/python-janus.mk
index f718d0c19d..b5fa44f727 100644
--- a/package/python-janus/python-janus.mk
+++ b/package/python-janus/python-janus.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_JANUS_VERSION = 0.4.0
+PYTHON_JANUS_VERSION = 0.5.0
 PYTHON_JANUS_SOURCE = janus-$(PYTHON_JANUS_VERSION).tar.gz
-PYTHON_JANUS_SITE = https://files.pythonhosted.org/packages/e2/39/41fd545b99eac81d47fe346b8c78c09a3b187ce2fd9f3c9656dfe035e39a
+PYTHON_JANUS_SITE = https://files.pythonhosted.org/packages/9a/76/fbb89aa5d3cb5f3fec6ce74d34cf980ccd475b015d1a59cb5a14fe4cd2c5
 PYTHON_JANUS_SETUP_TYPE = setuptools
 PYTHON_JANUS_LICENSE = Apache-2.0
 PYTHON_JANUS_LICENSE_FILES = LICENSE
