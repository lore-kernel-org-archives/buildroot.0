From: Asaf Kahlon <asafka7@gmail.com>
Date: Wed, 19 Sep 2018 22:10:21 +0300
Subject: [Buildroot] [PATCH 1/1] python-paramiko: bump to version 2.4.2
Message-ID: <20180919191021.3458-1-asafka7@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Asaf Kahlon <asafka7@gmail.com>
---
 package/python-paramiko/python-paramiko.hash | 4 ++--
 package/python-paramiko/python-paramiko.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-paramiko/python-paramiko.hash b/package/python-paramiko/python-paramiko.hash
index 2132672aa4..cca2dd612d 100644
--- a/package/python-paramiko/python-paramiko.hash
+++ b/package/python-paramiko/python-paramiko.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/paramiko/json
-md5	f9fa1204f706767b6c179effa7c0fb9e  paramiko-2.4.1.tar.gz
-sha256	33e36775a6c71790ba7692a73f948b329cf9295a72b0102144b031114bd2a4f3  paramiko-2.4.1.tar.gz
+md5	a476ea106177fe22e797428d54811aed  paramiko-2.4.2.tar.gz
+sha256	a8975a7df3560c9f1e2b43dc54ebd40fd00a7017392ca5445ce7df409f900fcb  paramiko-2.4.2.tar.gz
 # Locally computed sha256 checksums
 sha256	5fa25bf5f395fd26e701c2e1de4ca7d162816986dc791c22f8f4226857ad1bb2  LICENSE
diff --git a/package/python-paramiko/python-paramiko.mk b/package/python-paramiko/python-paramiko.mk
index 72238ca2a8..1f5818e3b8 100644
--- a/package/python-paramiko/python-paramiko.mk
+++ b/package/python-paramiko/python-paramiko.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_PARAMIKO_VERSION = 2.4.1
+PYTHON_PARAMIKO_VERSION = 2.4.2
 PYTHON_PARAMIKO_SOURCE = paramiko-$(PYTHON_PARAMIKO_VERSION).tar.gz
-PYTHON_PARAMIKO_SITE = https://files.pythonhosted.org/packages/29/65/83181630befb17cd1370a6abb9a87957947a43c2332216e5975353f61d64
+PYTHON_PARAMIKO_SITE = https://files.pythonhosted.org/packages/a4/57/86681372e7a8d642718cadeef38ead1c24c4a1af21ae852642bf974e37c7
 PYTHON_PARAMIKO_SETUP_TYPE = setuptools
 PYTHON_PARAMIKO_LICENSE = LGPL-2.1+
 PYTHON_PARAMIKO_LICENSE_FILES = LICENSE
-- 
2.17.1
