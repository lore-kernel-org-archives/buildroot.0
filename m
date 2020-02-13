From: James Hilliard <james.hilliard1@gmail.com>
Date: Wed, 12 Feb 2020 22:19:24 -0700
Subject: [Buildroot] [PATCH 1/1] package/python-paramiko: bump to version
 2.7.1
Message-ID: <20200213051924.66813-1-james.hilliard1@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-paramiko/python-paramiko.hash | 4 ++--
 package/python-paramiko/python-paramiko.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-paramiko/python-paramiko.hash b/package/python-paramiko/python-paramiko.hash
index 48cc79e7eb..6054e8d492 100644
--- a/package/python-paramiko/python-paramiko.hash
+++ b/package/python-paramiko/python-paramiko.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/paramiko/json
-md5	f729a45c9122bf975b9177ec5aaa3791  paramiko-2.6.0.tar.gz
-sha256	f4b2edfa0d226b70bd4ca31ea7e389325990283da23465d572ed1f70a7583041  paramiko-2.6.0.tar.gz
+md5	bf8239dc820ca86dd3c3226f4281c35f  paramiko-2.7.1.tar.gz
+sha256	920492895db8013f6cc0179293147f830b8c7b21fdfc839b6bad760c27459d9f  paramiko-2.7.1.tar.gz
 # Locally computed sha256 checksums
 sha256	5fa25bf5f395fd26e701c2e1de4ca7d162816986dc791c22f8f4226857ad1bb2  LICENSE
diff --git a/package/python-paramiko/python-paramiko.mk b/package/python-paramiko/python-paramiko.mk
index 381cd2df21..c9e144c96e 100644
--- a/package/python-paramiko/python-paramiko.mk
+++ b/package/python-paramiko/python-paramiko.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_PARAMIKO_VERSION = 2.6.0
+PYTHON_PARAMIKO_VERSION = 2.7.1
 PYTHON_PARAMIKO_SOURCE = paramiko-$(PYTHON_PARAMIKO_VERSION).tar.gz
-PYTHON_PARAMIKO_SITE = https://files.pythonhosted.org/packages/54/68/dde7919279d4ecdd1607a7eb425a2874ccd49a73a5a71f8aa4f0102d3eb8
+PYTHON_PARAMIKO_SITE = https://files.pythonhosted.org/packages/ac/15/4351003352e11300b9f44a13576bff52dcdc6e4a911129c07447bda0a358
 PYTHON_PARAMIKO_SETUP_TYPE = setuptools
 PYTHON_PARAMIKO_LICENSE = LGPL-2.1+
 PYTHON_PARAMIKO_LICENSE_FILES = LICENSE
-- 
2.20.1
