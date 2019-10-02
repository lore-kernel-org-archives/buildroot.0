From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 2 Oct 2019 22:19:20 +0200
Subject: [Buildroot] [git commit] package/python-lmdb: bump to version 0.97
Message-ID: <20191002201426.CA69D81E52@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=c9a98b6bd7fe4fcd2151dc8785fc97069b589a3c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Asaf Kahlon <asafka7@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/python-lmdb/python-lmdb.hash | 4 ++--
 package/python-lmdb/python-lmdb.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-lmdb/python-lmdb.hash b/package/python-lmdb/python-lmdb.hash
index ed96d69545..f57437b5f0 100644
--- a/package/python-lmdb/python-lmdb.hash
+++ b/package/python-lmdb/python-lmdb.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/lmdb/json
-md5	57216cb8fba7aed91ceba5a69d359939  lmdb-0.94.tar.gz
-sha256	9c2b7f05c26b2c95d6f3a566314feefe2dc64ecec6c50242a932703cf74303fe  lmdb-0.94.tar.gz
+md5	917f611903283a05d43a85ad1e7d05d3  lmdb-0.97.tar.gz
+sha256	173d71ade5fd402c7e9ecb0a1d6022c92a7f89c313132ef4e5e561d349b0834b  lmdb-0.97.tar.gz
 # Locally computed sha256 checksums
 sha256	310fe25c858a9515fc8c8d7d1f24a67c9496f84a91e0a0e41ea9975b1371e569  LICENSE
diff --git a/package/python-lmdb/python-lmdb.mk b/package/python-lmdb/python-lmdb.mk
index 039656e2c1..5e1c0f4c79 100644
--- a/package/python-lmdb/python-lmdb.mk
+++ b/package/python-lmdb/python-lmdb.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_LMDB_VERSION = 0.94
+PYTHON_LMDB_VERSION = 0.97
 PYTHON_LMDB_SOURCE = lmdb-$(PYTHON_LMDB_VERSION).tar.gz
-PYTHON_LMDB_SITE = https://files.pythonhosted.org/packages/cb/31/5be8f436b56733d9e69c721c358502f4d77b627489a459978686be7db65f
+PYTHON_LMDB_SITE = https://files.pythonhosted.org/packages/9f/8f/37cc080deb867305bf2d3ec4639e33b981d0def8d78949454a4654ca16bf
 PYTHON_LMDB_LICENSE = OLDAP-2.8
 PYTHON_LMDB_LICENSE_FILES = LICENSE
 PYTHON_LMDB_SETUP_TYPE = setuptools
