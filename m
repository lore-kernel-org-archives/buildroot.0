From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Mon,  5 Apr 2021 16:47:08 +0200
Subject: [Buildroot] [PATCH 1/1] package/python-paramiko: bump to version
 2.7.2
Message-ID: <20210405144708.4151427-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Update indentation in hash file (two spaces)

https://github.com/paramiko/paramiko/blob/2.7.2/sites/www/changelog.rst

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/python-paramiko/python-paramiko.hash | 6 +++---
 package/python-paramiko/python-paramiko.mk   | 4 ++--
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/python-paramiko/python-paramiko.hash b/package/python-paramiko/python-paramiko.hash
index 6054e8d492..cd26774cce 100644
--- a/package/python-paramiko/python-paramiko.hash
+++ b/package/python-paramiko/python-paramiko.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/paramiko/json
-md5	bf8239dc820ca86dd3c3226f4281c35f  paramiko-2.7.1.tar.gz
-sha256	920492895db8013f6cc0179293147f830b8c7b21fdfc839b6bad760c27459d9f  paramiko-2.7.1.tar.gz
+md5  44136d79da4cd7619e368018ad022619  paramiko-2.7.2.tar.gz
+sha256  7f36f4ba2c0d81d219f4595e35f70d56cc94f9ac40a6acdf51d6ca210ce65035  paramiko-2.7.2.tar.gz
 # Locally computed sha256 checksums
-sha256	5fa25bf5f395fd26e701c2e1de4ca7d162816986dc791c22f8f4226857ad1bb2  LICENSE
+sha256  fa25bf5f395fd26e701c2e1de4ca7d162816986dc791c22f8f4226857ad1bb2  LICENSE
diff --git a/package/python-paramiko/python-paramiko.mk b/package/python-paramiko/python-paramiko.mk
index 6dc473d34e..3c135cf9b1 100644
--- a/package/python-paramiko/python-paramiko.mk
+++ b/package/python-paramiko/python-paramiko.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_PARAMIKO_VERSION = 2.7.1
+PYTHON_PARAMIKO_VERSION = 2.7.2
 PYTHON_PARAMIKO_SOURCE = paramiko-$(PYTHON_PARAMIKO_VERSION).tar.gz
-PYTHON_PARAMIKO_SITE = https://files.pythonhosted.org/packages/ac/15/4351003352e11300b9f44a13576bff52dcdc6e4a911129c07447bda0a358
+PYTHON_PARAMIKO_SITE = https://files.pythonhosted.org/packages/cf/a1/20d00ce559a692911f11cadb7f94737aca3ede1c51de16e002c7d3a888e0
 PYTHON_PARAMIKO_SETUP_TYPE = setuptools
 PYTHON_PARAMIKO_LICENSE = LGPL-2.1+
 PYTHON_PARAMIKO_LICENSE_FILES = LICENSE
-- 
2.30.2
