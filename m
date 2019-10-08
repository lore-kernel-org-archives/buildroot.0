From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 8 Oct 2019 22:41:40 +0200
Subject: [Buildroot] [git commit] package/python-aioredis: bump to version
 1.3.0
Message-ID: <20191008203843.DBE998B7E6@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=efb1d509c4b5272529b368369b52ec9f90ca3d2d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Asaf Kahlon <asafka7@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/python-aioredis/python-aioredis.hash | 4 ++--
 package/python-aioredis/python-aioredis.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-aioredis/python-aioredis.hash b/package/python-aioredis/python-aioredis.hash
index 19f147fdcc..9000072420 100644
--- a/package/python-aioredis/python-aioredis.hash
+++ b/package/python-aioredis/python-aioredis.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/aioredis/json
-md5	fd6c66e4d8efce553c369c0855c6fb49  aioredis-1.2.0.tar.gz
-sha256	84d62be729beb87118cf126c20b0e3f52d7a42bb7373dc5bcdd874f26f1f251a  aioredis-1.2.0.tar.gz
+md5	7577e902854a66649c34866e1d3197c0  aioredis-1.3.0.tar.gz
+sha256	86da2748fb0652625a8346f413167f078ec72bdc76e217db7e605a059cd56e86  aioredis-1.3.0.tar.gz
 # Locally computed sha256 checksums
 sha256	a288b4f41b5531ff7e9e2df9cd3f17a1844badebc52d7a9205b131f8b8a50744  LICENSE
diff --git a/package/python-aioredis/python-aioredis.mk b/package/python-aioredis/python-aioredis.mk
index 02641ec7ac..0781ee55d5 100644
--- a/package/python-aioredis/python-aioredis.mk
+++ b/package/python-aioredis/python-aioredis.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_AIOREDIS_VERSION = 1.2.0
+PYTHON_AIOREDIS_VERSION = 1.3.0
 PYTHON_AIOREDIS_SOURCE = aioredis-$(PYTHON_AIOREDIS_VERSION).tar.gz
-PYTHON_AIOREDIS_SITE = https://files.pythonhosted.org/packages/2e/a3/cd122b68d8071d332972027d225f548e0206001da1aa0685ea08db803b06
+PYTHON_AIOREDIS_SITE = https://files.pythonhosted.org/packages/48/28/0bf4d0d218f521b95b0497b72135a4ff5ef55e62c72bb73babb0345a4627
 PYTHON_AIOREDIS_SETUP_TYPE = setuptools
 PYTHON_AIOREDIS_LICENSE = MIT
 PYTHON_AIOREDIS_LICENSE_FILES = LICENSE
