From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sat, 10 Apr 2021 13:53:57 +0200
Subject: [Buildroot] [PATCH 1/1] package/python-aioconsole: bump to version
 0.3.1
Message-ID: <20210410115357.47406-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://github.com/vxgmichel/aioconsole/releases/tag/v0.3.1

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/python-aioconsole/python-aioconsole.hash | 4 ++--
 package/python-aioconsole/python-aioconsole.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-aioconsole/python-aioconsole.hash b/package/python-aioconsole/python-aioconsole.hash
index 0aa9a7882c..dea2216fcf 100644
--- a/package/python-aioconsole/python-aioconsole.hash
+++ b/package/python-aioconsole/python-aioconsole.hash
@@ -1,3 +1,3 @@
 # md5, sha256 from https://pypi.org/pypi/aioconsole/json
-md5  a8b0640a1e2a3869baf4efcbb1182fbe  aioconsole-0.3.0.tar.gz
-sha256  b84724e6b93d1306a909974864df377236cf4bab8e0594096fed7936207205c5  aioconsole-0.3.0.tar.gz
+md5  66d4b05e3bc75267daf0f773d839f62b  aioconsole-0.3.1.tar.gz
+sha256  7c038bb40b7690bf5be6b17154830b7bff25e7be1c02d8420a346c3efbd5d8e5  aioconsole-0.3.1.tar.gz
diff --git a/package/python-aioconsole/python-aioconsole.mk b/package/python-aioconsole/python-aioconsole.mk
index 5c26d863c0..b32d2bea0f 100644
--- a/package/python-aioconsole/python-aioconsole.mk
+++ b/package/python-aioconsole/python-aioconsole.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_AIOCONSOLE_VERSION = 0.3.0
+PYTHON_AIOCONSOLE_VERSION = 0.3.1
 PYTHON_AIOCONSOLE_SOURCE = aioconsole-$(PYTHON_AIOCONSOLE_VERSION).tar.gz
-PYTHON_AIOCONSOLE_SITE = https://files.pythonhosted.org/packages/d1/bc/2e52bd41293e63d95fcb6c5de406d43ccbb91255a48feaa22c1b8e2e4a40
+PYTHON_AIOCONSOLE_SITE = https://files.pythonhosted.org/packages/5a/12/fce04ddc0a8ebd6482e5ec293d8bda47c9e05c82826b061f7b73523b8601
 PYTHON_AIOCONSOLE_SETUP_TYPE = setuptools
 PYTHON_AIOCONSOLE_LICENSE = GPL-3.0
 
-- 
2.30.2
