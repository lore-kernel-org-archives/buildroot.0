From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 13 Jan 2020 09:19:05 +0100
Subject: [Buildroot] [PATCH] package/python-websocket-client: bump to
 version 0.57.0
Message-ID: <20200113081905.7127-1-peter@korsgaard.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/python-websocket-client/python-websocket-client.hash | 4 ++--
 package/python-websocket-client/python-websocket-client.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-websocket-client/python-websocket-client.hash b/package/python-websocket-client/python-websocket-client.hash
index 735cb53e1c..968c1ab211 100644
--- a/package/python-websocket-client/python-websocket-client.hash
+++ b/package/python-websocket-client/python-websocket-client.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/websocket-client/json
-md5	89484bd5dac71123ae6a09b2f90fe62c  websocket_client-0.56.0.tar.gz
-sha256	1fd5520878b68b84b5748bb30e592b10d0a91529d5383f74f4964e72b297fd3a  websocket_client-0.56.0.tar.gz
+md5	8061820da5e1de26a6a1a6996d4eebd5  websocket_client-0.57.0.tar.gz
+sha256	d735b91d6d1692a6a181f2a8c9e0238e5f6373356f561bb9dc4c7af36f452010  websocket_client-0.57.0.tar.gz
 # Locally computed sha256 checksums
 sha256	a47b06717e8a3cf01d1307141287b1b4fa17fe4bb8785633d2fc6f57cb71d05e  LICENSE
diff --git a/package/python-websocket-client/python-websocket-client.mk b/package/python-websocket-client/python-websocket-client.mk
index 518f7b29a9..58cb597c22 100644
--- a/package/python-websocket-client/python-websocket-client.mk
+++ b/package/python-websocket-client/python-websocket-client.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_WEBSOCKET_CLIENT_VERSION = 0.56.0
+PYTHON_WEBSOCKET_CLIENT_VERSION = 0.57.0
 PYTHON_WEBSOCKET_CLIENT_SOURCE = websocket_client-$(PYTHON_WEBSOCKET_CLIENT_VERSION).tar.gz
-PYTHON_WEBSOCKET_CLIENT_SITE = https://files.pythonhosted.org/packages/c5/01/8c9c7de6c46f88e70b5a3276c791a2be82ae83d8e0d0cc030525ee2866fd
+PYTHON_WEBSOCKET_CLIENT_SITE = https://files.pythonhosted.org/packages/8b/0f/52de51b9b450ed52694208ab952d5af6ebbcbce7f166a48784095d930d8c
 PYTHON_WEBSOCKET_CLIENT_SETUP_TYPE = setuptools
 # Project was under LGPL-2.1+, but was relicensed under
 # BSD-3-Clause. The LICENSE file contains the BSD-3-Clause text, but
-- 
2.20.1
