From: Joseph Kogut <joseph.kogut@gmail.com>
Date: Mon, 18 Feb 2019 11:12:05 -0800
Subject: [Buildroot] [PATCH 1/1] python-websockets: bump to version 7.0
Message-ID: <20190218191205.110550-1-joseph.kogut@gmail.com>
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
index 4939c7834f..024b83d908 100644
--- a/package/python-websockets/python-websockets.hash
+++ b/package/python-websockets/python-websockets.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/websockets/json
-md5	76cf931a525a3415f5a4f59c133e89c3  websockets-6.0.tar.gz
-sha256	8f3b956d11c5b301206382726210dc1d3bee1a9ccf7aadf895aaf31f71c3716c  websockets-6.0.tar.gz
+md5	e3b5f2e257de0371e7b4d0b6ef7bc29e  websockets-7.0.tar.gz
+sha256	08e3c3e0535befa4f0c4443824496c03ecc25062debbcf895874f8a0b4c97c9f  websockets-7.0.tar.gz
 # Locally computed sha256 checksums
 sha256	2cd4d416e432ca7fda2c103b38b852f8d3cb327d70c3db44410b9fe97e6c4d73  LICENSE
diff --git a/package/python-websockets/python-websockets.mk b/package/python-websockets/python-websockets.mk
index 4d547ada81..30c35d3baa 100644
--- a/package/python-websockets/python-websockets.mk
+++ b/package/python-websockets/python-websockets.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_WEBSOCKETS_VERSION = 6.0
+PYTHON_WEBSOCKETS_VERSION = 7.0
 PYTHON_WEBSOCKETS_SOURCE = websockets-$(PYTHON_WEBSOCKETS_VERSION).tar.gz
-PYTHON_WEBSOCKETS_SITE = https://files.pythonhosted.org/packages/4e/2a/56e60bb4c3696bc736998cc13c3fa1a36210609d7e1a3f2519857b420245
+PYTHON_WEBSOCKETS_SITE = https://files.pythonhosted.org/packages/ba/60/59844a5cef2428cb752bd4f446b72095b1edee404a58c27e87cd12a141e2
 PYTHON_WEBSOCKETS_SETUP_TYPE = setuptools
 PYTHON_WEBSOCKETS_LICENSE = BSD-3-Clause
 PYTHON_WEBSOCKETS_LICENSE_FILES = LICENSE
-- 
2.20.1
