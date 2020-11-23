From: James Hilliard <james.hilliard1@gmail.com>
Date: Sun, 22 Nov 2020 19:57:19 -0700
Subject: [Buildroot] [PATCH 1/1] package/python-aiohttp: bump to version
 3.7.3
Message-ID: <20201123025719.2000375-1-james.hilliard1@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

License hash changed due to year update.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-aiohttp/python-aiohttp.hash | 6 +++---
 package/python-aiohttp/python-aiohttp.mk   | 4 ++--
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/python-aiohttp/python-aiohttp.hash b/package/python-aiohttp/python-aiohttp.hash
index fd02bc80d6..36056d2f99 100644
--- a/package/python-aiohttp/python-aiohttp.hash
+++ b/package/python-aiohttp/python-aiohttp.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/aiohttp/json
-md5	ca40144c199a09fc1a141960cf6295f0  aiohttp-3.6.2.tar.gz
-sha256	259ab809ff0727d0e834ac5e8a283dc5e3e0ecc30c4d80b3cd17a4139ce1f326  aiohttp-3.6.2.tar.gz
+md5  a66039c12f33dd093a2c260f5c459632  aiohttp-3.7.3.tar.gz
+sha256  9c1a81af067e72261c9cbe33ea792893e83bc6aa987bfbd6fdc1e5e7b22777c4  aiohttp-3.7.3.tar.gz
 # Locally computed sha256 checksums
-sha256	6fd5243e92dd7f98ec69c7ac377728e74905709ff527a5bf98d6d0263c04f5b6  LICENSE.txt
+sha256  96627bed0ad08e9b2efa9f4e04e80837cd0550e7694a0fec33b1dab2550282ab  LICENSE.txt
diff --git a/package/python-aiohttp/python-aiohttp.mk b/package/python-aiohttp/python-aiohttp.mk
index 5a5964ed5f..e5a1354267 100644
--- a/package/python-aiohttp/python-aiohttp.mk
+++ b/package/python-aiohttp/python-aiohttp.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_AIOHTTP_VERSION = 3.6.2
+PYTHON_AIOHTTP_VERSION = 3.7.3
 PYTHON_AIOHTTP_SOURCE = aiohttp-$(PYTHON_AIOHTTP_VERSION).tar.gz
-PYTHON_AIOHTTP_SITE = https://files.pythonhosted.org/packages/00/94/f9fa18e8d7124d7850a5715a0b9c0584f7b9375d331d35e157cee50f27cc
+PYTHON_AIOHTTP_SITE = https://files.pythonhosted.org/packages/68/96/40a765d7d68028c5a6d169b2747ea3f4828ec91a358a63818d468380521c
 PYTHON_AIOHTTP_SETUP_TYPE = setuptools
 PYTHON_AIOHTTP_LICENSE = Apache-2.0
 PYTHON_AIOHTTP_LICENSE_FILES = LICENSE.txt
-- 
2.25.1
