From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 2 Oct 2019 22:19:14 +0200
Subject: [Buildroot] [git commit] package/python-couchdb: bump to versoin 1.2
Message-ID: <20191002201426.8E46081E52@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=741ad8124f49edf4f6f60358eb97a0e88c944b53
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Also add hash for license file.

Signed-off-by: Asaf Kahlon <asafka7@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/python-couchdb/python-couchdb.hash | 8 +++++---
 package/python-couchdb/python-couchdb.mk   | 4 ++--
 2 files changed, 7 insertions(+), 5 deletions(-)

diff --git a/package/python-couchdb/python-couchdb.hash b/package/python-couchdb/python-couchdb.hash
index f9422a8ce7..67b7b12692 100644
--- a/package/python-couchdb/python-couchdb.hash
+++ b/package/python-couchdb/python-couchdb.hash
@@ -1,3 +1,5 @@
-# md5 from https://pypi.python.org/pypi/couchdb/json, sha256 locally computed
-md5	2ed5ad2a477fd3cb472ed6dc5a381ff3  CouchDB-1.1.tar.gz
-sha256	9503ea413956c33b5e2af248235afb5e0f011f33f816a32e872f8ff9b0a0e710  CouchDB-1.1.tar.gz
+# md5, sha256 from https://pypi.org/pypi/couchdb/json
+md5	de40696472202d728cfca4279629e4ff  CouchDB-1.2.tar.gz
+sha256	1386a1a43f25bed3667e3b805222054940d674fa1967fa48e9d2012a18630ab7  CouchDB-1.2.tar.gz
+# Locally computed sha256 checksums
+sha256	c538da1ae16b6d75f6fa65852bb158dbf9e556b01681be5b692692906d244241  COPYING
diff --git a/package/python-couchdb/python-couchdb.mk b/package/python-couchdb/python-couchdb.mk
index afdbdf59c9..b88c65703d 100644
--- a/package/python-couchdb/python-couchdb.mk
+++ b/package/python-couchdb/python-couchdb.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_COUCHDB_VERSION = 1.1
+PYTHON_COUCHDB_VERSION = 1.2
 PYTHON_COUCHDB_SOURCE = CouchDB-$(PYTHON_COUCHDB_VERSION).tar.gz
-PYTHON_COUCHDB_SITE = https://pypi.python.org/packages/9a/e8/c3c8da6d00145aaca07f2b784794917613dad26532068da4e8392dc48d7f
+PYTHON_COUCHDB_SITE = https://files.pythonhosted.org/packages/7c/c8/f94a107eca0c178e5d74c705dad1a5205c0f580840bd1b155cd8a258cb7c
 PYTHON_COUCHDB_SETUP_TYPE = setuptools
 PYTHON_COUCHDB_LICENSE = BSD-3-Clause
 PYTHON_COUCHDB_LICENSE_FILES = COPYING
