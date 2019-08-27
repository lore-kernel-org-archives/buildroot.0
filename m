From: Asaf Kahlon <asafka7@gmail.com>
Date: Tue, 27 Aug 2019 20:28:05 +0300
Subject: [Buildroot] [PATCH 1/1] package/python-ipaddr: bump to version 2.2.0
In-Reply-To: <20190827172812.10594-1-asafka7@gmail.com>
References: <20190827172812.10594-1-asafka7@gmail.com>
Message-ID: <20190827172812.10594-4-asafka7@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Also add hash for license file.

Signed-off-by: Asaf Kahlon <asafka7@gmail.com>
---
 package/python-ipaddr/python-ipaddr.hash | 8 +++++---
 package/python-ipaddr/python-ipaddr.mk   | 4 ++--
 2 files changed, 7 insertions(+), 5 deletions(-)

diff --git a/package/python-ipaddr/python-ipaddr.hash b/package/python-ipaddr/python-ipaddr.hash
index 99e1ca9415..d9963a2933 100644
--- a/package/python-ipaddr/python-ipaddr.hash
+++ b/package/python-ipaddr/python-ipaddr.hash
@@ -1,3 +1,5 @@
-# md5 from https://pypi.python.org/pypi?:action=show_md5&digest=f2c7852f95862715f92e7d089dc3f2cf, sha256 locally computed
-md5	f2c7852f95862715f92e7d089dc3f2cf  ipaddr-2.1.11.tar.gz
-sha256	1b555b8a8800134fdafe32b7d0cb52f5bdbfdd093707c3dd484c5ea59f1d98b7  ipaddr-2.1.11.tar.gz
+# md5, sha256 from https://pypi.org/pypi/ipaddr/json
+md5	f88353e40dec06410acfa075b8209b27  ipaddr-2.2.0.tar.gz
+sha256	4092dfe667588d16aa12b59acb7c8a4024e5dcb23a681cd0b0b602373eca88d6  ipaddr-2.2.0.tar.gz
+# Locally computed sha256 checksums
+sha256	175b3b509d5c840db72ad8c22d22a690d15c67b317f34de8a8bb0a66059e8215  COPYING
diff --git a/package/python-ipaddr/python-ipaddr.mk b/package/python-ipaddr/python-ipaddr.mk
index 84c486dc56..9a5d147533 100644
--- a/package/python-ipaddr/python-ipaddr.mk
+++ b/package/python-ipaddr/python-ipaddr.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_IPADDR_VERSION = 2.1.11
+PYTHON_IPADDR_VERSION = 2.2.0
 PYTHON_IPADDR_SOURCE = ipaddr-$(PYTHON_IPADDR_VERSION).tar.gz
-PYTHON_IPADDR_SITE = https://pypi.python.org/packages/source/i/ipaddr
+PYTHON_IPADDR_SITE = https://files.pythonhosted.org/packages/9d/a7/1b39a16cb90dfe491f57e1cab3103a15d4e8dd9a150872744f531b1106c1
 PYTHON_IPADDR_SETUP_TYPE = distutils
 PYTHON_IPADDR_LICENSE = Apache-2.0
 PYTHON_IPADDR_LICENSE_FILES = COPYING
-- 
2.20.1
