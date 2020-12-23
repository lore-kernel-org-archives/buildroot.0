From: Marcin Niestroj <m.niestroj@grinn-global.com>
Date: Wed, 23 Dec 2020 17:12:22 +0100
Subject: [Buildroot] [PATCH 1/3] package/python-typing: bump to version
 3.7.4.3
In-Reply-To: <20201223161224.69815-1-m.niestroj@grinn-global.com>
References: <20201223161224.69815-1-m.niestroj@grinn-global.com>
Message-ID: <20201223161224.69815-2-m.niestroj@grinn-global.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Marcin Niestroj <m.niestroj@grinn-global.com>
---
 package/python-typing/python-typing.hash | 6 +++---
 package/python-typing/python-typing.mk   | 4 ++--
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/python-typing/python-typing.hash b/package/python-typing/python-typing.hash
index 8796a4c2e3..438ecb0727 100644
--- a/package/python-typing/python-typing.hash
+++ b/package/python-typing/python-typing.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/typing/json
-md5	0a1ebd4af65b4769e33459004eb20345  typing-3.7.4.1.tar.gz
-sha256	91dfe6f3f706ee8cc32d38edbbf304e9b7583fb37108fef38229617f8b3eba23  typing-3.7.4.1.tar.gz
+md5  276296e7b6b617d4f8b5e8874f240bd4  typing-3.7.4.3.tar.gz
+sha256  1187fb9c82fd670d10aa07bbb6cfcfe4bdda42d6fab8d5134f04e8c4d0b71cc9  typing-3.7.4.3.tar.gz
 # Locally computed sha256 checksums
-sha256	ff17ce94e102024deb68773eb1cc74ca76da4e658f373531f0ac22d68a6bb1ad  LICENSE
+sha256  ff17ce94e102024deb68773eb1cc74ca76da4e658f373531f0ac22d68a6bb1ad  LICENSE
diff --git a/package/python-typing/python-typing.mk b/package/python-typing/python-typing.mk
index 6894481243..efb2196286 100644
--- a/package/python-typing/python-typing.mk
+++ b/package/python-typing/python-typing.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_TYPING_VERSION = 3.7.4.1
+PYTHON_TYPING_VERSION = 3.7.4.3
 PYTHON_TYPING_SOURCE = typing-$(PYTHON_TYPING_VERSION).tar.gz
-PYTHON_TYPING_SITE = https://files.pythonhosted.org/packages/67/b0/b2ea2bd67bfb80ea5d12a5baa1d12bda002cab3b6c9b48f7708cd40c34bf
+PYTHON_TYPING_SITE = https://files.pythonhosted.org/packages/05/d9/6eebe19d46bd05360c9a9aae822e67a80f9242aabbfc58b641b957546607
 PYTHON_TYPING_SETUP_TYPE = setuptools
 PYTHON_TYPING_LICENSE = Python-2.0, others
 PYTHON_TYPING_LICENSE_FILES = LICENSE
-- 
2.29.2
