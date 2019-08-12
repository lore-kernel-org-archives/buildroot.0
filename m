From: James Hilliard <james.hilliard1@gmail.com>
Date: Mon, 12 Aug 2019 15:12:21 -0600
Subject: [Buildroot] [PATCH 1/1] package/python-aioconsole: bump to version
 0.1.14
Message-ID: <20190812211221.102056-1-james.hilliard1@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-aioconsole/python-aioconsole.hash | 4 ++--
 package/python-aioconsole/python-aioconsole.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-aioconsole/python-aioconsole.hash b/package/python-aioconsole/python-aioconsole.hash
index 0e09cfb4ec..a0be541d2b 100644
--- a/package/python-aioconsole/python-aioconsole.hash
+++ b/package/python-aioconsole/python-aioconsole.hash
@@ -1,3 +1,3 @@
 # md5, sha256 from https://pypi.org/pypi/aioconsole/json
-md5	212dc49e2f2a995c87ce659ba63e7422  aioconsole-0.1.13.tar.gz
-sha256	8b9898f0f6539bdce3bc3720d75189e21813f1a7f8350228fc7fd54bf7327d0f  aioconsole-0.1.13.tar.gz
+md5	af4835de9fbc97faf8776af99f0b3e38  aioconsole-0.1.14.tar.gz
+sha256	f1ddd04050d9be5e93e223a4e9367433436d245f8fe70905f4124bfde2cd3cdd  aioconsole-0.1.14.tar.gz
diff --git a/package/python-aioconsole/python-aioconsole.mk b/package/python-aioconsole/python-aioconsole.mk
index 47245d2038..2cf6d4eafd 100644
--- a/package/python-aioconsole/python-aioconsole.mk
+++ b/package/python-aioconsole/python-aioconsole.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_AIOCONSOLE_VERSION = 0.1.13
+PYTHON_AIOCONSOLE_VERSION = 0.1.14
 PYTHON_AIOCONSOLE_SOURCE = aioconsole-$(PYTHON_AIOCONSOLE_VERSION).tar.gz
-PYTHON_AIOCONSOLE_SITE = https://files.pythonhosted.org/packages/ea/ee/80154d7242c2107d02768c5a848e4cded39ce8cd89b48982c217474c8ddd
+PYTHON_AIOCONSOLE_SITE = https://files.pythonhosted.org/packages/04/0a/0d86f8af4202a09c2fe91f5d9a8149ddd7cd04bcc638eea08dd10fcd18b1
 PYTHON_AIOCONSOLE_SETUP_TYPE = setuptools
 PYTHON_AIOCONSOLE_LICENSE = GPL-3.0
 
-- 
2.20.1
