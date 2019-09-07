From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 7 Sep 2019 22:06:46 +0200
Subject: [Buildroot] [git commit] package/python-aioconsole: bump to version
 0.1.15
Message-ID: <20190907200427.79C318CA5A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=155e5f3b5f4e2a3804ffd1c889eb275c9bba36c0
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/python-aioconsole/python-aioconsole.hash | 4 ++--
 package/python-aioconsole/python-aioconsole.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-aioconsole/python-aioconsole.hash b/package/python-aioconsole/python-aioconsole.hash
index a0be541d2b..28c841cf12 100644
--- a/package/python-aioconsole/python-aioconsole.hash
+++ b/package/python-aioconsole/python-aioconsole.hash
@@ -1,3 +1,3 @@
 # md5, sha256 from https://pypi.org/pypi/aioconsole/json
-md5	af4835de9fbc97faf8776af99f0b3e38  aioconsole-0.1.14.tar.gz
-sha256	f1ddd04050d9be5e93e223a4e9367433436d245f8fe70905f4124bfde2cd3cdd  aioconsole-0.1.14.tar.gz
+md5	918caf70f00a3fbc8a61cd74579da1c4  aioconsole-0.1.15.tar.gz
+sha256	498e567805b74c1ecf4501d28e48727e8e77af8d6a0b8f1b7aa9a4842e02743d  aioconsole-0.1.15.tar.gz
diff --git a/package/python-aioconsole/python-aioconsole.mk b/package/python-aioconsole/python-aioconsole.mk
index 2cf6d4eafd..83c694fe3d 100644
--- a/package/python-aioconsole/python-aioconsole.mk
+++ b/package/python-aioconsole/python-aioconsole.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_AIOCONSOLE_VERSION = 0.1.14
+PYTHON_AIOCONSOLE_VERSION = 0.1.15
 PYTHON_AIOCONSOLE_SOURCE = aioconsole-$(PYTHON_AIOCONSOLE_VERSION).tar.gz
-PYTHON_AIOCONSOLE_SITE = https://files.pythonhosted.org/packages/04/0a/0d86f8af4202a09c2fe91f5d9a8149ddd7cd04bcc638eea08dd10fcd18b1
+PYTHON_AIOCONSOLE_SITE = https://files.pythonhosted.org/packages/c4/68/56b09bf94aff8e02a6080493b3f85bdf7ddea7e4f264e6a90a158e064898
 PYTHON_AIOCONSOLE_SETUP_TYPE = setuptools
 PYTHON_AIOCONSOLE_LICENSE = GPL-3.0
 
