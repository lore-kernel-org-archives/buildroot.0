From: James Hilliard <james.hilliard1@gmail.com>
Date: Mon, 27 Jan 2020 14:42:46 -0700
Subject: [Buildroot] [PATCH 1/1] package/python-aiohttp-debugtoolbar: bump
 to version 0.6.0
Message-ID: <20200127214246.122938-1-james.hilliard1@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 .../python-aiohttp-debugtoolbar.hash                          | 4 ++--
 .../python-aiohttp-debugtoolbar.mk                            | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-aiohttp-debugtoolbar/python-aiohttp-debugtoolbar.hash b/package/python-aiohttp-debugtoolbar/python-aiohttp-debugtoolbar.hash
index 655c46da3c..927bd32895 100644
--- a/package/python-aiohttp-debugtoolbar/python-aiohttp-debugtoolbar.hash
+++ b/package/python-aiohttp-debugtoolbar/python-aiohttp-debugtoolbar.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/aiohttp_debugtoolbar/json
-md5	26b26163f3fbeb16ac67197902330942  aiohttp-debugtoolbar-0.5.0.tar.gz
-sha256	697c9cfac4017d532e26a8c05f14c1a43b3b147f53460daacb0ed144401df441  aiohttp-debugtoolbar-0.5.0.tar.gz
+md5	496734057cb413d7a49a52a817802dbb  aiohttp-debugtoolbar-0.6.0.tar.gz
+sha256	ec231661133b40136608d39dfb688e7ea0c3d47b6ae6dee52d5bf24ceb9e4d45  aiohttp-debugtoolbar-0.6.0.tar.gz
 # Locally computed sha256 checksums
 sha256	94d638be2cb4f186cc62bb567455837757547c15f1b350863aaf05a38843b542  LICENSE
diff --git a/package/python-aiohttp-debugtoolbar/python-aiohttp-debugtoolbar.mk b/package/python-aiohttp-debugtoolbar/python-aiohttp-debugtoolbar.mk
index 27eadd2173..319d20ffc5 100644
--- a/package/python-aiohttp-debugtoolbar/python-aiohttp-debugtoolbar.mk
+++ b/package/python-aiohttp-debugtoolbar/python-aiohttp-debugtoolbar.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_AIOHTTP_DEBUGTOOLBAR_VERSION = 0.5.0
+PYTHON_AIOHTTP_DEBUGTOOLBAR_VERSION = 0.6.0
 PYTHON_AIOHTTP_DEBUGTOOLBAR_SOURCE = aiohttp-debugtoolbar-$(PYTHON_AIOHTTP_DEBUGTOOLBAR_VERSION).tar.gz
-PYTHON_AIOHTTP_DEBUGTOOLBAR_SITE = https://files.pythonhosted.org/packages/08/b1/b629499450a84e68b53d000e6150ae4dace68ae589c5ac36b6541777c8d3
+PYTHON_AIOHTTP_DEBUGTOOLBAR_SITE = https://files.pythonhosted.org/packages/3f/dd/5121417dfbeb4661673afa5c8708f1539889d0e54b1509a6fdf66705efc5
 PYTHON_AIOHTTP_DEBUGTOOLBAR_SETUP_TYPE = setuptools
 PYTHON_AIOHTTP_DEBUGTOOLBAR_LICENSE = Apache-2.0
 PYTHON_AIOHTTP_DEBUGTOOLBAR_LICENSE_FILES = LICENSE
-- 
2.20.1
