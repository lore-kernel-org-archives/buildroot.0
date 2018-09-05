From: Joseph Kogut <joseph.kogut@gmail.com>
Date: Wed,  5 Sep 2018 16:29:53 -0700
Subject: [Buildroot] [PATCH 1/1] python-websockets: bump version to 6.0
Message-ID: <20180905232953.23273-1-joseph.kogut@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Joseph Kogut <joseph.kogut@gmail.com>
---
 package/python-websockets/python-websockets.hash | 4 ++--
 package/python-websockets/python-websockets.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-websockets/python-websockets.hash b/package/python-websockets/python-websockets.hash
index 0fbe144173..4939c7834f 100644
--- a/package/python-websockets/python-websockets.hash
+++ b/package/python-websockets/python-websockets.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/websockets/json
-md5	cd2f92f07bca588acd9238b18f6cfbcf  websockets-5.0.1.tar.gz
-sha256	a49d315db5a7a19d55422e1678e8a1c3b9661d7296bef3179fa620cf80b12674  websockets-5.0.1.tar.gz
+md5	76cf931a525a3415f5a4f59c133e89c3  websockets-6.0.tar.gz
+sha256	8f3b956d11c5b301206382726210dc1d3bee1a9ccf7aadf895aaf31f71c3716c  websockets-6.0.tar.gz
 # Locally computed sha256 checksums
 sha256	2cd4d416e432ca7fda2c103b38b852f8d3cb327d70c3db44410b9fe97e6c4d73  LICENSE
diff --git a/package/python-websockets/python-websockets.mk b/package/python-websockets/python-websockets.mk
index 0e225b90f1..4d547ada81 100644
--- a/package/python-websockets/python-websockets.mk
+++ b/package/python-websockets/python-websockets.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_WEBSOCKETS_VERSION = 5.0.1
+PYTHON_WEBSOCKETS_VERSION = 6.0
 PYTHON_WEBSOCKETS_SOURCE = websockets-$(PYTHON_WEBSOCKETS_VERSION).tar.gz
-PYTHON_WEBSOCKETS_SITE = https://files.pythonhosted.org/packages/4b/c6/026da2eeed75a49dd0b72a0c7ed6ee5cb2943e396ca9753eabff7359b27b
+PYTHON_WEBSOCKETS_SITE = https://files.pythonhosted.org/packages/4e/2a/56e60bb4c3696bc736998cc13c3fa1a36210609d7e1a3f2519857b420245
 PYTHON_WEBSOCKETS_SETUP_TYPE = setuptools
 PYTHON_WEBSOCKETS_LICENSE = BSD-3-Clause
 PYTHON_WEBSOCKETS_LICENSE_FILES = LICENSE
-- 
2.18.0
