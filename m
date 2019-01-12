From: Asaf Kahlon <asafka7@gmail.com>
Date: Sat, 12 Jan 2019 20:40:47 +0200
Subject: [Buildroot] [PATCH 1/1] python-aiohttp: bump to version 3.5.4
Message-ID: <20190112184047.24175-1-asafka7@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

License change - a year bump.

Signed-off-by: Asaf Kahlon <asafka7@gmail.com>
---
 package/python-aiohttp/python-aiohttp.hash | 6 +++---
 package/python-aiohttp/python-aiohttp.mk   | 4 ++--
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/python-aiohttp/python-aiohttp.hash b/package/python-aiohttp/python-aiohttp.hash
index c76f49b4a4..bd9e2d7a62 100644
--- a/package/python-aiohttp/python-aiohttp.hash
+++ b/package/python-aiohttp/python-aiohttp.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/aiohttp/json
-md5	b692d5c602458957a0ef2df92ac48705  aiohttp-3.5.0.tar.gz
-sha256	1d00d58cf2665ce61bd637790988accca609aa3a898bb45747b6369830c0de28  aiohttp-3.5.0.tar.gz
+md5	85fe5c9037256c58d4678148bd91b3f3  aiohttp-3.5.4.tar.gz
+sha256	9c4c83f4fa1938377da32bc2d59379025ceeee8e24b89f72fcbccd8ca22dc9bf  aiohttp-3.5.4.tar.gz
 # Locally computed sha256 checksums
-sha256	bb0c0eeae85492ebfa03442b7784d4c42a623e15346df54ae85f55df972a82af  LICENSE.txt
+sha256	6fd5243e92dd7f98ec69c7ac377728e74905709ff527a5bf98d6d0263c04f5b6  LICENSE.txt
diff --git a/package/python-aiohttp/python-aiohttp.mk b/package/python-aiohttp/python-aiohttp.mk
index c17daf6a27..7a142a6550 100644
--- a/package/python-aiohttp/python-aiohttp.mk
+++ b/package/python-aiohttp/python-aiohttp.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_AIOHTTP_VERSION = 3.5.0
+PYTHON_AIOHTTP_VERSION = 3.5.4
 PYTHON_AIOHTTP_SOURCE = aiohttp-$(PYTHON_AIOHTTP_VERSION).tar.gz
-PYTHON_AIOHTTP_SITE = https://files.pythonhosted.org/packages/e4/a4/48e455139e03dc1555f904cf3843c9228c2a922f61512eb4d2482e04135c
+PYTHON_AIOHTTP_SITE = https://files.pythonhosted.org/packages/0f/58/c8b83f999da3b13e66249ea32f325be923791c0c10aee6cf16002a3effc1
 PYTHON_AIOHTTP_SETUP_TYPE = setuptools
 PYTHON_AIOHTTP_LICENSE = Apache-2.0
 PYTHON_AIOHTTP_LICENSE_FILES = LICENSE.txt
-- 
2.19.1
