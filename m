From: Asaf Kahlon <asafka7@gmail.com>
Date: Mon, 24 Jun 2019 22:24:13 +0300
Subject: [Buildroot] [PATCH 1/1] package/python-paramiko: bump to version
 2.6.0
Message-ID: <20190624192413.21277-1-asafka7@gmail.com>
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
index c4589feb82..48cc79e7eb 100644
--- a/package/python-paramiko/python-paramiko.hash
+++ b/package/python-paramiko/python-paramiko.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/paramiko/json
-md5	1ca8e7fe1745db0e130b2cb6d9c68a03  paramiko-2.5.0.tar.gz
-sha256	9f081281064b5180dc0ef60e256224a280ff16f603a99f3dd4ba6334ebb65f7e  paramiko-2.5.0.tar.gz
+md5	f729a45c9122bf975b9177ec5aaa3791  paramiko-2.6.0.tar.gz
+sha256	f4b2edfa0d226b70bd4ca31ea7e389325990283da23465d572ed1f70a7583041  paramiko-2.6.0.tar.gz
 # Locally computed sha256 checksums
 sha256	5fa25bf5f395fd26e701c2e1de4ca7d162816986dc791c22f8f4226857ad1bb2  LICENSE
diff --git a/package/python-paramiko/python-paramiko.mk b/package/python-paramiko/python-paramiko.mk
index ef03b3173a..381cd2df21 100644
--- a/package/python-paramiko/python-paramiko.mk
+++ b/package/python-paramiko/python-paramiko.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_PARAMIKO_VERSION = 2.5.0
+PYTHON_PARAMIKO_VERSION = 2.6.0
 PYTHON_PARAMIKO_SOURCE = paramiko-$(PYTHON_PARAMIKO_VERSION).tar.gz
-PYTHON_PARAMIKO_SITE = https://files.pythonhosted.org/packages/0e/29/aa6647f283796ff1c46747ee8e69092390116cd86c7c660247ef0d56a146
+PYTHON_PARAMIKO_SITE = https://files.pythonhosted.org/packages/54/68/dde7919279d4ecdd1607a7eb425a2874ccd49a73a5a71f8aa4f0102d3eb8
 PYTHON_PARAMIKO_SETUP_TYPE = setuptools
 PYTHON_PARAMIKO_LICENSE = LGPL-2.1+
 PYTHON_PARAMIKO_LICENSE_FILES = LICENSE
-- 
2.20.1
