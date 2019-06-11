From: Asaf Kahlon <asafka7@gmail.com>
Date: Tue, 11 Jun 2019 20:24:15 +0300
Subject: [Buildroot] [PATCH 1/1] package/python-paramiko: bump to version
 2.5.0
In-Reply-To: <20190611172416.6099-1-asafka7@gmail.com>
References: <20190611172416.6099-1-asafka7@gmail.com>
Message-ID: <20190611172416.6099-2-asafka7@gmail.com>
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
index cca2dd612d..c4589feb82 100644
--- a/package/python-paramiko/python-paramiko.hash
+++ b/package/python-paramiko/python-paramiko.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/paramiko/json
-md5	a476ea106177fe22e797428d54811aed  paramiko-2.4.2.tar.gz
-sha256	a8975a7df3560c9f1e2b43dc54ebd40fd00a7017392ca5445ce7df409f900fcb  paramiko-2.4.2.tar.gz
+md5	1ca8e7fe1745db0e130b2cb6d9c68a03  paramiko-2.5.0.tar.gz
+sha256	9f081281064b5180dc0ef60e256224a280ff16f603a99f3dd4ba6334ebb65f7e  paramiko-2.5.0.tar.gz
 # Locally computed sha256 checksums
 sha256	5fa25bf5f395fd26e701c2e1de4ca7d162816986dc791c22f8f4226857ad1bb2  LICENSE
diff --git a/package/python-paramiko/python-paramiko.mk b/package/python-paramiko/python-paramiko.mk
index 1f5818e3b8..ef03b3173a 100644
--- a/package/python-paramiko/python-paramiko.mk
+++ b/package/python-paramiko/python-paramiko.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_PARAMIKO_VERSION = 2.4.2
+PYTHON_PARAMIKO_VERSION = 2.5.0
 PYTHON_PARAMIKO_SOURCE = paramiko-$(PYTHON_PARAMIKO_VERSION).tar.gz
-PYTHON_PARAMIKO_SITE = https://files.pythonhosted.org/packages/a4/57/86681372e7a8d642718cadeef38ead1c24c4a1af21ae852642bf974e37c7
+PYTHON_PARAMIKO_SITE = https://files.pythonhosted.org/packages/0e/29/aa6647f283796ff1c46747ee8e69092390116cd86c7c660247ef0d56a146
 PYTHON_PARAMIKO_SETUP_TYPE = setuptools
 PYTHON_PARAMIKO_LICENSE = LGPL-2.1+
 PYTHON_PARAMIKO_LICENSE_FILES = LICENSE
-- 
2.20.1
