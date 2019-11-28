From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 28 Nov 2019 20:12:06 +0100
Subject: [Buildroot] [git commit branch/next] package/python-aiohttp: bump
 to version 3.6.2
Message-ID: <20191128190512.626D781E53@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=429e5afbf8c561d7479697060a8e5ab3d038a117
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/python-aiohttp/python-aiohttp.hash | 4 ++--
 package/python-aiohttp/python-aiohttp.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-aiohttp/python-aiohttp.hash b/package/python-aiohttp/python-aiohttp.hash
index bd9e2d7a62..fd02bc80d6 100644
--- a/package/python-aiohttp/python-aiohttp.hash
+++ b/package/python-aiohttp/python-aiohttp.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/aiohttp/json
-md5	85fe5c9037256c58d4678148bd91b3f3  aiohttp-3.5.4.tar.gz
-sha256	9c4c83f4fa1938377da32bc2d59379025ceeee8e24b89f72fcbccd8ca22dc9bf  aiohttp-3.5.4.tar.gz
+md5	ca40144c199a09fc1a141960cf6295f0  aiohttp-3.6.2.tar.gz
+sha256	259ab809ff0727d0e834ac5e8a283dc5e3e0ecc30c4d80b3cd17a4139ce1f326  aiohttp-3.6.2.tar.gz
 # Locally computed sha256 checksums
 sha256	6fd5243e92dd7f98ec69c7ac377728e74905709ff527a5bf98d6d0263c04f5b6  LICENSE.txt
diff --git a/package/python-aiohttp/python-aiohttp.mk b/package/python-aiohttp/python-aiohttp.mk
index 7a142a6550..5a5964ed5f 100644
--- a/package/python-aiohttp/python-aiohttp.mk
+++ b/package/python-aiohttp/python-aiohttp.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_AIOHTTP_VERSION = 3.5.4
+PYTHON_AIOHTTP_VERSION = 3.6.2
 PYTHON_AIOHTTP_SOURCE = aiohttp-$(PYTHON_AIOHTTP_VERSION).tar.gz
-PYTHON_AIOHTTP_SITE = https://files.pythonhosted.org/packages/0f/58/c8b83f999da3b13e66249ea32f325be923791c0c10aee6cf16002a3effc1
+PYTHON_AIOHTTP_SITE = https://files.pythonhosted.org/packages/00/94/f9fa18e8d7124d7850a5715a0b9c0584f7b9375d331d35e157cee50f27cc
 PYTHON_AIOHTTP_SETUP_TYPE = setuptools
 PYTHON_AIOHTTP_LICENSE = Apache-2.0
 PYTHON_AIOHTTP_LICENSE_FILES = LICENSE.txt
