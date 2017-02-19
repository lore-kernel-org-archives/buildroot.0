From: Adam Duskett <aduskett@gmail.com>
Date: Sun, 19 Feb 2017 14:12:28 -0500
Subject: [Buildroot] [PATCH 31/58] python-pudb: bump to version 2017.1.1
In-Reply-To: <20170219191255.1503-1-Adamduskett@outlook.com>
References: <20170219191255.1503-1-Adamduskett@outlook.com>
Message-ID: <20170219191255.1503-32-Adamduskett@outlook.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Adam Duskett <Adamduskett@outlook.com>
---
 package/python-pudb/python-pudb.hash | 4 ++--
 package/python-pudb/python-pudb.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-pudb/python-pudb.hash b/package/python-pudb/python-pudb.hash
index b06d5e8..4313af0 100644
--- a/package/python-pudb/python-pudb.hash
+++ b/package/python-pudb/python-pudb.hash
@@ -1,3 +1,3 @@
 # md5 from https://pypi.python.org/pypi/pudb/json, sha256 locally computed
-md5	4573b70163329c1cb59836a357bfdf7c  pudb-2016.2.tar.gz
-sha256	e958d7f7b1771cf297714e95054075df3b2a47455d7a740be4abbbd41289505a  pudb-2016.2.tar.gz
+md5 4ec3302ef90f22b13c60db16b3557c56 pudb-2017.1.1.tar.gz
+sha256 87117640902c5f602c8517d0167eb5c953a5bdede97975ba29ff17e3d570442c pudb-2017.1.1.tar.gz
diff --git a/package/python-pudb/python-pudb.mk b/package/python-pudb/python-pudb.mk
index 5349c1e..e192877 100644
--- a/package/python-pudb/python-pudb.mk
+++ b/package/python-pudb/python-pudb.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_PUDB_VERSION = 2016.2
+PYTHON_PUDB_VERSION = 2017.1.1
 PYTHON_PUDB_SOURCE = pudb-$(PYTHON_PUDB_VERSION).tar.gz
-PYTHON_PUDB_SITE = https://pypi.python.org/packages/50/1a/d9b692e32afff09ccb5aa33c3d51c6d5a80efbb59de90307b33601e7fa62
+PYTHON_PUDB_SITE = https://pypi.python.org/packages/3f/ab/a8e103f329460696bb74e3c5cef4060313be3fe0f6fceae866900cb2033c
 PYTHON_PUDB_SETUP_TYPE = setuptools
 PYTHON_PUDB_LICENSE = MIT
 PYTHON_PUDB_LICENSE_FILES = LICENSE
-- 
2.9.3
