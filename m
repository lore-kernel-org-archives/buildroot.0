From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 27 Feb 2020 10:16:16 +0100
Subject: [Buildroot] [git commit branch/next] package/python-lmdb: bump to
 version 0.98
Message-ID: <20200227100041.C8BFC8EC46@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=4b6566611815451ada4ceda3ab3dadb599f28487
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/python-lmdb/python-lmdb.hash | 4 ++--
 package/python-lmdb/python-lmdb.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-lmdb/python-lmdb.hash b/package/python-lmdb/python-lmdb.hash
index f57437b5f0..569d1d0bd6 100644
--- a/package/python-lmdb/python-lmdb.hash
+++ b/package/python-lmdb/python-lmdb.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/lmdb/json
-md5	917f611903283a05d43a85ad1e7d05d3  lmdb-0.97.tar.gz
-sha256	173d71ade5fd402c7e9ecb0a1d6022c92a7f89c313132ef4e5e561d349b0834b  lmdb-0.97.tar.gz
+md5	ae2efef18202e51c9e4a807a47900ce2  lmdb-0.98.tar.gz
+sha256	0625bc28bf0893e6000a83be7234f915ca078c32f9e73d8ae48b3508db7af708  lmdb-0.98.tar.gz
 # Locally computed sha256 checksums
 sha256	310fe25c858a9515fc8c8d7d1f24a67c9496f84a91e0a0e41ea9975b1371e569  LICENSE
diff --git a/package/python-lmdb/python-lmdb.mk b/package/python-lmdb/python-lmdb.mk
index 5e1c0f4c79..f92c7f775b 100644
--- a/package/python-lmdb/python-lmdb.mk
+++ b/package/python-lmdb/python-lmdb.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_LMDB_VERSION = 0.97
+PYTHON_LMDB_VERSION = 0.98
 PYTHON_LMDB_SOURCE = lmdb-$(PYTHON_LMDB_VERSION).tar.gz
-PYTHON_LMDB_SITE = https://files.pythonhosted.org/packages/9f/8f/37cc080deb867305bf2d3ec4639e33b981d0def8d78949454a4654ca16bf
+PYTHON_LMDB_SITE = https://files.pythonhosted.org/packages/c0/5c/d56dbc2532ecf14fa004c543927500c0f645eaca8bd7ec39420c7546396a
 PYTHON_LMDB_LICENSE = OLDAP-2.8
 PYTHON_LMDB_LICENSE_FILES = LICENSE
 PYTHON_LMDB_SETUP_TYPE = setuptools
