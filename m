From: James Hilliard <james.hilliard1@gmail.com>
Date: Thu, 26 Mar 2020 01:59:47 -0600
Subject: [Buildroot] [PATCH 1/1] package/python-aioconsole: bump to version
 0.1.16
Message-ID: <20200326075947.33425-1-james.hilliard1@gmail.com>
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
index 28c841cf12..93173e4721 100644
--- a/package/python-aioconsole/python-aioconsole.hash
+++ b/package/python-aioconsole/python-aioconsole.hash
@@ -1,3 +1,3 @@
 # md5, sha256 from https://pypi.org/pypi/aioconsole/json
-md5	918caf70f00a3fbc8a61cd74579da1c4  aioconsole-0.1.15.tar.gz
-sha256	498e567805b74c1ecf4501d28e48727e8e77af8d6a0b8f1b7aa9a4842e02743d  aioconsole-0.1.15.tar.gz
+md5  8eeeee86f96c51d202e69f0e0a56eaad  aioconsole-0.1.16.tar.gz
+sha256  a5d98a99539e060f514b96425f19839abc4bc2b487b39cdb76b91df2367c647a  aioconsole-0.1.16.tar.gz
diff --git a/package/python-aioconsole/python-aioconsole.mk b/package/python-aioconsole/python-aioconsole.mk
index 83c694fe3d..ef0aa2faee 100644
--- a/package/python-aioconsole/python-aioconsole.mk
+++ b/package/python-aioconsole/python-aioconsole.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_AIOCONSOLE_VERSION = 0.1.15
+PYTHON_AIOCONSOLE_VERSION = 0.1.16
 PYTHON_AIOCONSOLE_SOURCE = aioconsole-$(PYTHON_AIOCONSOLE_VERSION).tar.gz
-PYTHON_AIOCONSOLE_SITE = https://files.pythonhosted.org/packages/c4/68/56b09bf94aff8e02a6080493b3f85bdf7ddea7e4f264e6a90a158e064898
+PYTHON_AIOCONSOLE_SITE = https://files.pythonhosted.org/packages/70/08/5dbb71777058a4f3b6e61b61ffc5b5021056c4a139e118938773b93e9304
 PYTHON_AIOCONSOLE_SETUP_TYPE = setuptools
 PYTHON_AIOCONSOLE_LICENSE = GPL-3.0
 
-- 
2.20.1
