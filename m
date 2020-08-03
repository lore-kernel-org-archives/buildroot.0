From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 3 Aug 2020 18:38:08 +0200
Subject: [Buildroot] [git commit] package/python-cbor2: bump to version 5.1.2
Message-ID: <20200803163649.915A1831C3@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=37a003c372c9d5ea9993b0ecdbb10ebaed9aec54
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/python-cbor2/python-cbor2.hash | 4 ++--
 package/python-cbor2/python-cbor2.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-cbor2/python-cbor2.hash b/package/python-cbor2/python-cbor2.hash
index 70e16cae2d..a643cdbe25 100644
--- a/package/python-cbor2/python-cbor2.hash
+++ b/package/python-cbor2/python-cbor2.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/cbor2/json
-md5  b7c3b94ad5b78ba144ed4df9e55ce2ea  cbor2-5.1.0.tar.gz
-sha256  43ce11e8c2fe4971d386d1a60cf83bfa0a4a667b97668ba76acbf5e6398821aa  cbor2-5.1.0.tar.gz
+md5  693c1bd6635bee8a591a70ea924ad676  cbor2-5.1.2.tar.gz
+sha256  91759bd0ee5ef0d4fa24144dfa551670730baeca8cf2fff1cc59f734ecd21de6  cbor2-5.1.2.tar.gz
 # Locally computed sha256 checksums
 sha256  6163f7987dfb38d6bc320ce2b70b2f02b862bc41126516d552ef1cd43247e758  LICENSE.txt
diff --git a/package/python-cbor2/python-cbor2.mk b/package/python-cbor2/python-cbor2.mk
index 850ee7c50d..115eb8d276 100644
--- a/package/python-cbor2/python-cbor2.mk
+++ b/package/python-cbor2/python-cbor2.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_CBOR2_VERSION = 5.1.0
+PYTHON_CBOR2_VERSION = 5.1.2
 PYTHON_CBOR2_SOURCE = cbor2-$(PYTHON_CBOR2_VERSION).tar.gz
-PYTHON_CBOR2_SITE = https://files.pythonhosted.org/packages/ee/80/bc617b7fd89855649e48eb8242e09535e1b75371ec8389313fa0f97e2a70
+PYTHON_CBOR2_SITE = https://files.pythonhosted.org/packages/3f/14/a7cdcab562ee9b599ce409168eb0a5f7c7190a83f23c92c8c310e56d1b58
 PYTHON_CBOR2_SETUP_TYPE = setuptools
 PYTHON_CBOR2_LICENSE = MIT
 PYTHON_CBOR2_LICENSE_FILES = LICENSE.txt
