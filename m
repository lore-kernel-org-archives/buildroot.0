From: Asaf Kahlon <asafka7@gmail.com>
Date: Mon, 15 Oct 2018 21:19:59 +0300
Subject: [Buildroot] [PATCH 1/1] python-posix-ipc: bump to version 1.0.4
In-Reply-To: <20181015181959.12446-1-asafka7@gmail.com>
References: <20181015181959.12446-1-asafka7@gmail.com>
Message-ID: <20181015181959.12446-3-asafka7@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Also add license hash.

Signed-off-by: Asaf Kahlon <asafka7@gmail.com>
---
 package/python-posix-ipc/python-posix-ipc.hash | 8 +++++---
 package/python-posix-ipc/python-posix-ipc.mk   | 6 +++---
 2 files changed, 8 insertions(+), 6 deletions(-)

diff --git a/package/python-posix-ipc/python-posix-ipc.hash b/package/python-posix-ipc/python-posix-ipc.hash
index 196f186de1..d267cabc88 100644
--- a/package/python-posix-ipc/python-posix-ipc.hash
+++ b/package/python-posix-ipc/python-posix-ipc.hash
@@ -1,3 +1,5 @@
-# md5 from https://pypi.python.org/pypi/posix-ipc/json, sha256 locally computed
-md5	85607a392087715ac3a3c7ded2492d06  posix_ipc-1.0.0.tar.gz
-sha256	9c93070374ca672725575e5c9874930c8cde69367fb90378b2255e048e31efcb  posix_ipc-1.0.0.tar.gz
+# md5, sha256 from https://pypi.org/pypi/posix-ipc/json
+md5	c4fd0065244ccb2f59cb8ceedf287cf6  posix_ipc-1.0.4.tar.gz
+sha256	ff6c9077633fc62a491d6997c43b094d885bb45a7ca1f36c9a0d647c54b74b14  posix_ipc-1.0.4.tar.gz
+# Locally computed sha256 checksums
+sha256	61f0669e70518e6d32f87e485965fe9309de60e4bef938b29cecd068b3db9a98  LICENSE
diff --git a/package/python-posix-ipc/python-posix-ipc.mk b/package/python-posix-ipc/python-posix-ipc.mk
index 6178c75498..d4429f117e 100644
--- a/package/python-posix-ipc/python-posix-ipc.mk
+++ b/package/python-posix-ipc/python-posix-ipc.mk
@@ -4,11 +4,11 @@
 #
 ################################################################################
 
-PYTHON_POSIX_IPC_VERSION = 1.0.0
+PYTHON_POSIX_IPC_VERSION = 1.0.4
 PYTHON_POSIX_IPC_SOURCE = posix_ipc-$(PYTHON_POSIX_IPC_VERSION).tar.gz
-PYTHON_POSIX_IPC_SITE = https://pypi.python.org/packages/f0/e6/bff62b62b2e75f695b737695951b7a4c1c6595369268a37868f5c34e1c12
+PYTHON_POSIX_IPC_SITE = https://files.pythonhosted.org/packages/c9/3e/54217da71aa26b488295d878df4d3132093253b4ae5798ac66fcb6921ef0
 PYTHON_POSIX_IPC_LICENSE = BSD-3-Clause
 PYTHON_POSIX_IPC_LICENSE_FILES = LICENSE
-PYTHON_POSIX_IPC_SETUP_TYPE = distutils
+PYTHON_POSIX_IPC_SETUP_TYPE = setuptools
 
 $(eval $(python-package))
-- 
2.17.1
