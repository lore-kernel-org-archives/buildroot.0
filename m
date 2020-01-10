From: aduskett at gmail.com <aduskett@gmail.com>
Date: Fri, 10 Jan 2020 08:16:34 -0800
Subject: [Buildroot] [PATCH 2/3] package/python-aioredis: bump version to
 1.3.1
In-Reply-To: <20200110161635.35043-1-aduskett@gmail.com>
References: <20200110161635.35043-1-aduskett@gmail.com>
Message-ID: <20200110161635.35043-2-aduskett@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Adam Duskett <Aduskett@gmail.com>

Signed-off-by: Adam Duskett <Aduskett@gmail.com>
---
 package/python-aioredis/python-aioredis.hash | 4 ++--
 package/python-aioredis/python-aioredis.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-aioredis/python-aioredis.hash b/package/python-aioredis/python-aioredis.hash
index 9000072420..7162890c4c 100644
--- a/package/python-aioredis/python-aioredis.hash
+++ b/package/python-aioredis/python-aioredis.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/aioredis/json
-md5	7577e902854a66649c34866e1d3197c0  aioredis-1.3.0.tar.gz
-sha256	86da2748fb0652625a8346f413167f078ec72bdc76e217db7e605a059cd56e86  aioredis-1.3.0.tar.gz
+md5	950d2092ad96bb1145e9af7bd780fe38  aioredis-1.3.1.tar.gz
+sha256	15f8af30b044c771aee6787e5ec24694c048184c7b9e54c3b60c750a4b93273a  aioredis-1.3.1.tar.gz
 # Locally computed sha256 checksums
 sha256	a288b4f41b5531ff7e9e2df9cd3f17a1844badebc52d7a9205b131f8b8a50744  LICENSE
diff --git a/package/python-aioredis/python-aioredis.mk b/package/python-aioredis/python-aioredis.mk
index 0781ee55d5..750f37b6b2 100644
--- a/package/python-aioredis/python-aioredis.mk
+++ b/package/python-aioredis/python-aioredis.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_AIOREDIS_VERSION = 1.3.0
+PYTHON_AIOREDIS_VERSION = 1.3.1
 PYTHON_AIOREDIS_SOURCE = aioredis-$(PYTHON_AIOREDIS_VERSION).tar.gz
-PYTHON_AIOREDIS_SITE = https://files.pythonhosted.org/packages/48/28/0bf4d0d218f521b95b0497b72135a4ff5ef55e62c72bb73babb0345a4627
+PYTHON_AIOREDIS_SITE = https://files.pythonhosted.org/packages/2c/2a/662e5e79dde5d00964b995d50e38ecdefeeeb09b37edafff193c7e850f46
 PYTHON_AIOREDIS_SETUP_TYPE = setuptools
 PYTHON_AIOREDIS_LICENSE = MIT
 PYTHON_AIOREDIS_LICENSE_FILES = LICENSE
-- 
2.21.0 (Apple Git-122.2)
